
* Datensammlung mit Hilfe von *YouTube API v3*
  - direkte API-Anfragen 
  -  `tuber`

# YouTube API v3

![113628-98738-i_rc](https://user-images.githubusercontent.com/17723168/145721894-13dcf0a6-fccd-4609-b81d-7da2dc3e3980.jpg)

Die **YouTube** **Application Programming Interface** (YouTube API) gibt uns Zugriff auf Videos, Kanäle, Playlists, deren Statistiken und Kommentare auf der Video-Sharing Platform YouTube. 

YouTube hat weltweit 2 Milliarden Nutzer und jeden Tag sehen die Nutzer eine Milliarde Stunden Video auf YouTube. Es ist also eine wichtige Datenquelle für sozialwissenschaftliche Forschung. 

Bitte folgen Sie [dieser Anleitung](https://github.com/jobreu/youtube-workshop-gesis-2021/blob/main/slides/A0_YouTube_API_Setup/A0_YouTubeAPISetup.pdf) von *Julian Kohne, Johannes Breuer und Rohangis Mohseni*, um den Zugang zur YouTube API zu beantragen. Die Anleitung ist von Februar 2021 und ein paar Sachen haben sich verändert, aber im Großen und Ganzen sieht die Beantragung gleich aus. 

## Rate Limits


Per Default gibt *Youtube API v3* uns `10.000` Units am Tag, um Informationen zu extrahieren. Jede Operation, auch fehlerhafte, kosten Units: 

  - Eine Lesen-Operation von `channels`, `videos`, `playlists` kostet normallerweise `1` Unit.
  - Eine Suche kostet `100` Units.
  - Ein Video hochzuladen kostet `1600` Units.

Ihren aktuellen Verbrauch können Sie hier angucken: https://console.developers.google.com/ 

# API-Anfragen an die YouTube API


YouTube hat eine sehr ausführliche, aber gleichzeitig oft verwirrende Dokumentation: [YouTube API Dokumentation](https://developers.google.com/youtube/v3/docs). 

Um direkt API-Anfragen an YouTube API zu schicken, benötigen wir die Packages `httr`, `tidyverse` und `jsonlite`: 

```r
library(httr)
library(tidyverse) # Datenmanipulationen
library(jsonlite) # erleichtert den Umgang mit JSON-Dateien in R
```

Nehmen wir an, wir wollen 25 Videos für die Suche "surfing" sammeln. Das würde so gehen: 

```r
response = GET("https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q=surfing&key=xxxxxxxxx") #key ersetzen
status_code(response)

## 200 # Status 200 sagt uns, dass alles erfolgreich gelaufen ist.  
```

In dem Beispiel oben gibt die Query-Parameter `maxResults=` an wie viele Ergebnisse wir zurück bekommen möchten; `q=` ist Keyword, und `key=` ist der API Schlüssel. 

Wenn die Daten von der API übermittelt sind, kommt der nächste schwere Schritt - die relevanten Daten in einen *tidy*-Format zu extrahieren. Dafür zuerst JSON zu einem Dataframe umwandeln:  

```r
#JSON to Dataframe: 

d = response %>%
    content(as = "text") %>% 
    fromJSON()

glimpse(d)
```

Das Dataframe ist nested. Das heißt es enthällt verschachtelte Listen als Spalten. Das ist nicht *tidy*. Solche Dataframes müssen bereinigt werden und die relevanten Daten müssen in einzelne Spalten extrahiert werden. Dafür gibt es mehrere Möglichkeiten (s. unten). Aber zuerst, eine praktische Funktion, die bei der Navigation von Nested-Dataframes hilft ist `names()`:  

```r
# Hilft bei der Navigation von Nested-Dataframes 

names(d$items$snippet)
```

## Daten extrahieren

```r
# Relevante Daten aus den verschachtelten Nested-Dataframes rausholen: 

df = as_tibble(d$items)
df = mutate(df, 
            id = df$id$videoId,
            title = df$snippet$channelTitle, 
            description = df$snippet$description,
            channelTitle = df$snippet$channelTitle,
            publishTime = df$snippet$publishTime
)
df = select(df, -snippet)

glimpse(df) 
```
```r
# Mit Pipes: 

df = d$items %>%
  as_tibble() %>%
  mutate(
            id = id$videoId,
            title = snippet$channelTitle, 
            description = snippet$description,
            channelTitle = snippet$channelTitle,
            publishTime = snippet$publishTime
  ) %>%
  select(-snippet) %>%
  glimpse()
```


```r
# Daten extrahieren (kürzer)

# cbind(d1, d2)

df = cbind(as_tibble(d$items$id$videoId), select(as_tibble(d$items$snippet), -thumbnails))
glimpse(df)
```


# `tuber`

`tuber` ist ein Hilfspacket (Wrapper), der den Umgang mit YouTube API erleichtert. Aber immer wenn man einen Wrapper benutzt, verliert man ein Teil der Kontrolle. 

```r
#install.packages("tuber")
#install.packages("httpuv")

library(tuber)
library(httpuv)
```

```r
#Authentifizieren 

ID = "your_client_id"
secret = "your_client_secret"

yt_oauth(ID, secret)
```

Es sollte ein Pop-Up Fenster erscheinen und Sie werden aufgefordert sich mit Ihrem Google-Account anzumelden und den Zugang der API zu erlauben. 

Wenn Sie diesen Text sehen, dann ist alles gut gelaufen: 

![youtube_api_complete](https://user-images.githubusercontent.com/17723168/145722512-06af9074-d388-48e1-8975-c45ecb9c36dd.png)




## Was kann man mit `tuber` machen?


*   `get_stats()`: Video-Statistiken extrahieren
* `get_channel_stats()` : Statistiken zu Kanälen extrahieren
* `get_video_details()` : Infos über Videos sammeln
* Kommentare extrahieren:
  - `get_comment_threads()` : nur Kommentare
  - `get_all_comments()` : Kommentare und Replies 
* `get_all_channel_video_stats()`: Statistiken für alle Videos auf einem Kanal sammeln 
* `get_playlist_items(filter=c(playlist_id='playlist_id'))`: Inhalte von Playlists sammeln
* `yt_search()` : YouTube durchsuchen 

...und vieles anderes. Mehr dazu in der Dokumentation: https://cran.r-project.org/web/packages/tuber/tuber.pdf


## `get_stats()`: Video-Statistiken extrahieren


Um Statistiken für ein Video zu erhalten, benötigen Sie dessen ID. Die Video-IDs sind die Zeichen nach dem "v=" URL-Parameter. Zum Beispiel, das Video https://www.youtube.com/watch?v=Z0ajuTaHBtM hat die ID "Z0ajuTaHBtM".

```r
jingle_stats = get_stats("Z0ajuTaHBtM") 

jingle_stats_df = jingle_stats %>%
  as_tibble() %>%
  #mutate(across(c(2:6), as.numeric))

jingle_stats_df
```

## `get_channel_stats()` : Statistiken zu Kanälen bekommen

Um Kanäle-Statistiken zu erhalten, benötigen Sie deren IDs. Größere Kanäle haben oft "versteckte" IDs. Um solche IDs rauszufinden können Sie die Webseite [Comment Picker](https://commentpicker.com/youtube-channel-id.php) verwenden. 

```r
rstudio_channel = get_channel_stats("UC3xfbCMLCw1Hh4dWop3XtHg") # Channel ID 

#rstudio_channel

##		Channel Title: RStudio 
##		No. of Views: 1043106 
##		No. of Subscribers: 
##		No. of Videos: 388
```


## `get_video_details()` : Infos über Videos extrahieren

```r
jingle_details = get_video_details("Z0ajuTaHBtM") # Ausgabe -> Nested List

# Daten extrahieren: 

d = lapply(jingle_details$items, function(x) unlist(x)) # Unterspalten aufteilen 
df = purrr::map_dfr(d, bind_rows) # Unterspalten zu einer df verbinden 

glimpse(df)
```

## Kommentare extrahieren

`tuber` bietet zwei Möglichkeiten, um Kommentare zu extrahieren (und beide Möglichkeiten sind nicht perfekt):   

* `get_comment_threads(filter = c(video_id = "video_id"))` : Kommentare
  - möglich die max zu ändern (max_results = 101), default = 100. 
* `get_all_comments()` : Kommentare und Replies 
  - **Problem:** nur die erste 5 Replies 

```r
# Kommentare

comments_tutorial = get_comment_threads(filter = c(video_id = "4YyoMGv1nkc")) # Ausgabe -> ein Dataframe, kein JSON

comments_tutorial

# Kommentare und Replies 

comments_and_replies_tutorial = get_all_comments("4YyoMGv1nkc")

comments_and_replies_tutorial
```



# Searching Video IDs with `tuber`

`tuber` bietet die Funktion `yt_search()`, um *YouTube* zu suchen. Die Nutzung dieser Funktion ist jedoch in Bezug auf API-Abfragen/Quoten extrem kostspielig.

Eine einzelne Suchanfrage mit der Funktion `yt_search()` kann Ihr tägliches Kontingentlimit leicht überschreiten, da standardmäßig Daten für alle Suchergebnisse zurückgegeben werden. Wenn Sie die Funktion `yt_search()` verwenden möchten, empfehlen wir daher dringend, das Argument `get_all` auf `FALSE` zu setzen. Dies gibt bis zu 50 Ergebnisse zurück.

```r
# Search Videos

res = yt_search("Barack Obama", get_all = F) # type default -> video

glimpse(res)
```
# Übungsaufgaben

## Übungsaufgabe I

1. Erstellen Sie einen API-Schlüssel in Ihrer [Google API Console](https://console.cloud.google.com/apis/).

2. Mit Hilfe dieses Schlüssels: 

   * Suchen Sie nach 10 Videos (und **nur Videos!**) über Corona, die für Deutschland (d.h. zugänglich aus Deutschland, ISO Alpha 2: DE) nach dem 1.12.2021 veröffentlicht wurden (lesen Sie die [Dokumentation](https://developers.google.com/youtube/v3/docs) von YouTube!)   

  * Sammeln Sie alle Kommentare (ohne Replies) zu dem [Tutorial](https://www.youtube.com/watch?v=4YyoMGv1nkc) von Kasper Welbers (*Tipp: CommentThreads*). Erstellen Sie eine Tibble mit allen relevanten Spalten (Sie können diese selbst bestimmen). 
  
```r
# 10 Videos 


# Kommentare sammeln (Tipp: CommentThreads)

```

## Übungsaufgabe II

Führen Sie die `tuber`-Authentifizierung durch. 

# Übungsaufgabe III


*   Wie viele `views`, `subscribers`, und `videos` hat [Tagesschau](https://www.youtube.com/user/tagesschau) aktuell?
*   Wie viele `views`, `likes`, and `comments` hat das Musikvideo ["Data Science"](https://www.youtube.com/watch?v=uHGlCi9jOWY) von Baba Brinkman?
*   Sammeln Sie alle Kommentare (inklusive Replies) für die Folge von [heute show](https://www.youtube.com/watch?v=7pImpckYDP0) von 3.12. 


```r
# Wie viele views, subscribers, und videos hat Tagesschau aktuell?


# "Data Science" von Baba Brinkman


# Kommentare (heute show)
```


# Lösungen

## Übungsaufgabe I

```r
# 10 Videos über Corona

response = GET("https://youtube.googleapis.com/youtube/v3/search?maxResults=10&publishedAfter=2021-12-01T00%3A00%3A00Z&q=corona&regionCode=DE&type=video&key=xxxxxxxxxxxxx") # key ersetzen
status_code(response)
respone
```

```r
# Comments

response = GET("https://youtube.googleapis.com/youtube/v3/commentThreads?part=snippet&videoId=4YyoMGv1nkc&key=xxxxxxxxxxxxx") # key ersetzen
status_code(response)
response

d = response %>%
    content(as = "text") %>% 
    fromJSON()

glimpse(d)
```
```r
df = d$items %>%
  as_tibble() %>%
  mutate(
    text = snippet$topLevelComment$snippet$textOriginal,
    commenter = snippet$topLevelComment$snippet$authorDisplayName,
    publishedAt = snippet$topLevelComment$snippet$publishedAt,
  ) %>%
  glimpse()
```

## Übungsaufgabe III

```r
# Wie viele views, subscribers, und videos hat Tagesschau aktuell?

get_channel_stats("UC5NOEUbkLheQcaaRldYW5GA")

# "Data Science" von Baba Brinkman

get_stats("uHGlCi9jOWY")

# Kommentare (heute show)

comments_heute_show = get_all_comments("7pImpckYDP0")

```
