### Wichtigsten Datenquellen im Computational Research:


*   APIs
*   Web Scraping
* Data Crowdsourcing, Data Donations


# APIs

*APIs* (**A**pplication **P**rogramming **I**nterface, auf Deutsch Anwendungsprogrammierschnittstelle oder nur Programmierschnittstelle) sind Schnittstellen, mit denen Software-Anwendungen mit anderen Anwendungen kommunizieren und Daten austauschen können. 

In anderen Wörtern, APIs sind Programme, die auf eine HTTP-Anfrage mit definierten Parametern Daten zurückgeben. 


Jede *API* funktioniert anders, nimmt eigene Parameter an, gibt die Daten eigens strukturiert zurück und erfordert die Einarbeitung in die jeweilige Dokumentation der API; zugleich ist das Grundprinzip aber gleich:

* wir senden eine HTTP-Anfrage (GET/POST/PUT/DELETE) an die URL der API, wobei wir mittels Query-Parametern spezifieren, was wir wissen oder machen möchten
* die API greift auf den Datenbank und erfüllt unsere Anfrage
* und gibt uns als Antwort die Daten in einem Textformat (häufig JSON, XML oder CSV) zurück.
  
  ![restapi](https://user-images.githubusercontent.com/17723168/144586803-79824616-92d2-43b9-a0dd-edbb65ca12d6.png)
  

### Wichtigsten APIs für sozialwissenschaftliche Zwecke: 


*   [Twitter API](https://www.programmableweb.com/api/twitter-rest-api-v2)
*   [YouTube API](https://www.programmableweb.com/api/youtube-rest-api)
*   [Wikipedia API](https://www.programmableweb.com/api/wikipedia-rest-api)
* [Telegram API](https://www.programmableweb.com/api/telegram-rest-api-v10)
* [Reddit API](https://www.programmableweb.com/api/reddit-rest-api)
* [Guardian API](https://www.programmableweb.com/api/guardian-rest-api-v1)
* [The New York Times](https://www.programmableweb.com/api/new-york-times-article-search-rest-api)


Einen umfassenden Überblick über alle verfügbaren APIs finden Sie auf [ProgrammableWeb](https://www.programmableweb.com/category/all/apis#). 


## JSON


JSON (**J**ava **S**cript **O**bject **N**otation) ist ein gängiges Format fürs Datenaustausch zwischen Anwendungen. Es hat sich als universales, leichtgewichtiges (benötigt wenig Speicherplatz), menschen- und maschinenlesbares Datenformat etabliert.

Ein JSON Dokument beginnt und endet immer mit `{` und `}`. Innerhalb den geschweiften Klammen werden Inhalte (Objekte) plaziert. Jedes Objekt wird mit einem Namen definiert gefolgt von einem Doppelpunkt und den Wert (z.B. Objekt *Vorname* hat den Wert *Ronald*). Ein Objekt kann dann wieder ein Objekt sein. 

```r
#JSON-Format
{
  "Vorname": "Ronald",
  "Nachname": "Reagan",
  "Geburtsdatum": "1911-02-06",
  "Nationalitaet": "US-amerikanisch",
  "Partei":
  {
    "Name": "Republican Party",
    "Hauptsitz": "Washington, D.C.",
    "Gründungsdatum": "1854-03-20",
    "Gründungsort": "Ripon"
  },
  "Amt": "US-Präsident"
}
```

JSON Dateien haben die Dateiendung `.json`.


## Rate Limiting

Jede *API* ist anders aufgebaut, unterliegt eigenen Regeln (z.B. zur Authentifizierung oder Preis) und Struktur. Was viele *API*s aber gemeinsam haben ist sogenanntes *Rate Limiting*.

Rate Limiting bedeutet, dass wir in einem bestimmten Zeitintervall nur eine bestimmte Anzahl an Anfragen stellen dürfen (z.B. 15 Anfragen alle 15 Minuten). Das wird implementiert um eine Überlastung des Servers oder missbräuchlichen Datenabruf zu verhindern.

Falls *API*s Rate Limits überschritten werden, bekommen wir die Fehlermeldung `429 Too Many Requests`. 

# API-Anfragen in R ausführen


Um eigene API-Anfragen in R zu stellen, benötigen wir vor allem die Packages `httr` und `jsonlite`. Diese Packages gehören zum erweiterten *tidyverse*, sollten also bereits installiert sein, müssen aber separat geladen werden:

```r
library(tidyverse)
library(httr) 
library(jsonlite) # erleichtert den Umgang mit JSON-Dateien in R
```
  
Wir versuchen eine einfache API-Anfrage an [Datamuse API](https://www.datamuse.com/api/) - eine einfache **Word-Finding** API - zu stellen: 

Die Dokumentation zur API finden Sie auf deren Webseite. 

```r
response = GET("https://api.datamuse.com/words?rel_rhy=funny") # rel_rhy findet Wörter die rhymen, in dem Fall zu dem Wort "funny" 
status_code(response)
```

```r
response #Datentyp der Ausgabe
```
  
```r
response = content(response, as = "text") #Ergebnis -> eine Liste mit einem Textstring im JSON-Format 
response
```
Hier kommt nun das Package `jsonlite` ins Spiel, mit dessen Funktion `fromJSON()` wir JSON-Textdateien in R-Objekte umwandeln können (man nennt dies auch Parsing):

```r
parsed_content = fromJSON(response) # Ergebnis -> Dataframe 
glimpse(parsed_content) # Struktur
d = as_tibble(parsed_content)
head(d)
```
  
```r
# Alles in einem Schritt: 

d = GET("https://api.datamuse.com/words?rel_rhy=funny") %>%
    content(as = "text") %>% 
    fromJSON() %>%
    as_tibble()

glimpse(d)
```
  
Erneut gilt: jede *API* ist anders aufgebaut und erfordert daher spezifische Einarbeitung. Die Grundschritte sind aber immer nahezugleich: Dokumentation lesen -> Anfrage mit `httr` stellen -> dann schrittweise vorarbeiten, bis die gewünschten Daten vorhanden sind.



# Twitter API

Die gute Nachricht: in vielen Fällen müssen wir uns nicht die Mühe machen, unsere eigenen Anfragen von Grund auf selbst zu schreiben. Für viele größere APIs gibt es sogenannte Wrapper-Packages, die die gängigen API-Anfragen in simplere Funktionen “verpacken”. Um die Twitter-APIs zu nutzen, können wir beispielsweise auf das Package `rtweet` zurückgreifen.
 
  
![rtweet](https://user-images.githubusercontent.com/17723168/144586951-55e426e4-f91d-4628-a2bd-331da0d69c0b.png)

```r
install.packages("rtweet")
#devtools::install_github("mkearney/rtweet")
```
  
```r
library(rtweet) # Aktivieren
```
  
Um `rtweet` zu nutzen benötigen wir nur einen Twitter-Account (für eine einfache Anwendung keinen Developer Account) und müssen bei der ersten Verwendung einmalig eine Twitter-App authorisieren (hierzu öffnet sich automatisch ein Pop-Up-Fenster). 

**Tipp:** Falls kein Pop-Up-Fenster sich öffnet, versuchen Sie `httpuv` zu installieren: 

```r
install.packages("httpuv")
```

Wenn das immer noch nicht klappt, lesen Sie die Fehlermeldung aufmerksam. Sagt sie, dass Sie was ausführen müssen? (Oft blockiert Firewall Pop-Up Fenster) -> Dann führen Sie es in R aus.   


Oder falls Sie doch mit Authentifizierung arbeiten möchten, würde das so gehen: 
  
```r
api_key = "xxxxxxx" #Ersetzen durch eigenes Key, dass Sie von Twitter bekommen haben  
api_secret_key = "xxxxxxx"
access_token = "xxxxxxx"
access_token_secret = "xxxxxxx"
  
  
## authenticate via web browser
token <- create_token(
  app = "xxxxxxxx", # Name von der Twitter App (ersetze durch eigenen Namen)
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)

get_token()
```

## Was kann man mit `rtweet` machen? 


*   `search_tweets()` : Tweets aus der letzten 7 Tagen extrahieren 
*   `get_timeline()` : Posts (Tweets) von bestimmten Nutzern sammeln 
* `get_followers()`, `get_friends()`: Followers und Freunde von Nutzern sammeln
* `get_trends()` : entdecken was gerade *trending* ist
* `get_favorites()` : analysieren was bestimmte Nutzer liken

... und [vieles mehr](https://cran.r-project.org/web/packages/rtweet/rtweet.pdf) (lesen Sie die Dokumentation!). 

### `search_tweets()` :


Wahrscheinlich die meistbenutze Funktion - nach Tweets mit bestimmten Stichwörtern (z.B. Hashtags) suchen:   

```r
## search for a keyword
d = search_tweets(q = "impfung")
## search for a hashtag
d = search_tweets(q = "#impfung")
## search for a phrase
d = search_tweets(q = "impfpflicht protesten")
## search for multiple keywords
d = search_tweets(q = "impfung AND afd")
```
         
Standardmäßig gibt `search_tweets()` genau 100 Tweets zurück. Um mehr (max 18.000 pro 15 Minuten) oder weniger Tweets zu bekommen, muss man `n` auf eine höhere/kleinere Zahl setzen:

```r
## search tweets (q = Suchbegriff; n = gewünschte Anzahl an Tweets)

d = search_tweets(q = "impfung", n = 50)

glimpse(d)
```
         
Man kann auch die gewünschte **Sprache** von Tweets bestimmen und **Retweets** ausschließen:

```r
## search for tweets in english that are not retweets
d = search_tweets("impfung", lang = "de", include_rts = FALSE)
```
         
Man könnte auch die **Rate Limits** mit `retryonratelimit = TRUE` automatisch überschreiten: 

```r
d = search_tweets("impfung", n = 50000, retryonratelimit = TRUE) # würde ~42 Minuten dauern 
```
         
Weitere nutzvolle Query-Parameter (werden zur `q`-Parameter eingefügt):

* Exclude retweets via "-filter:retweets"
* Exclude quotes via "-filter:quote"
* Exclude replies via "-filter:replies"
* Filter (return only) verified via "filter:verified"
* Exclude verified via "-filter:verified"
* Get everything (firehose for free) via "-filter:verified OR filter:verified"
* Filter (return only) tweets with links to news articles via "filter:news"
* Filter (return only) tweets with media "filter:media"

```r
# Zum Beispiel -> Filtere nur verifizierte Nutzer aus:

d = search_tweets("OlafScholz filter:verified") 

# Alternative: 

d = search_tweets("OlafScholz", "filter" = "verified")

glimpse(d)
```
  

### `get_timeline()` :

Entdecken was Nutzer posten (max 3.200):

```r
get_timelines("cnn", n = 10)
```
  
**Tipp:** Falls die Funktion `get_timeline()` nicht funktioniert, versuchen Sie die aktuellste Version von `rtweet` direkt von GitHub herunterzuladen:


```r
devtools::install_github("mkearney/rtweet")
```


### `get_followers()` und `get_friends()` :

```r
# Followers & Friends (max 75.000)

scholz_followers = get_followers("OlafScholz", n = 5)
scholz_friends = get_friends("OlafScholz", n = 5) # Following 
```
  
### `get_favorites()` : 

Entdecken was Nutzer liken (max 3.000): 

```r
get_favorites("OlafScholz", n = 100) # Die letzten 100 Tweets die Olaf Scholz geliked hat
```

### `get_trends()` :

Entdecken was derzeit auf einem Ort/in einem Land *trending* ist:

```r
get_trends("germany")
```
  
... und vieles anderes. 

Mehr zur Möglichkeiten von `rtweet`:

```r
# Lesen Sie die Vignette: 

vignette("intro", package = "rtweet")
```
    
# Twitter API v2


Falls man nicht mit `rtweet` arbeiten möchte (z.B. `rtweet` unterschtützt aktuell nur die alte Twitter API v1 Version, d.h. hat keinen Zugriff auf historische Daten) oder man möchte die Rate Limits erhöhen, muss man direkt mit Twitter API v2 arbeiten und/oder einen Developer Account bei Twitter erstellen.  

Neue **Twitter API v2** wurde am 12. August 2020 veröffentlicht. 

Die Anleitung dazu können Sie hier nachlesen: https://developer.twitter.com/en/docs/twitter-api 

Um einen Developer-Account für `rtweet` zu erstellen oder für die direkte (d.h. ohne `rtweet`) Verwendung von Twitter API v2:

1.   Melden Sie sich bei Ihrem [twitter.com](https://twitter.com)-Konto an
2.   Beantragen Sie Developer-Rechte (am besten für [akademische Zwecke](https://developer.twitter.com/en/products/twitter-api/academic-research))
3. Gehen Sie zu [apps.twitter.com](https://apps.twitter.com) und erstellen Sie eine Neue App
4. Folgen Sie weitere Schritte, um Ihre Zugangsdaten in R zu speichern:
    - für direkte API: 
    - für `rtweet`: https://cran.r-project.org/web/packages/rtweet/vignettes/auth.html  

## Developer Accounts Twitter API

Das besondere an der neuen API sind die unterschiedlichen Zugänge mit verschiedenen Limits, Zugrifferlaubnisen. Aktuell für uns (aber die Registrierung dauert): 


> **Academic Research**
>
> If you qualify for our Academic Research access level, you can get access to even more data and advanced search endpoints.
> - Retrieve 10 million Tweets per month
> -Access to full-archive search and full-archive Tweet counts
> - Access to advanced search operators
> -Streaming rates: 50 requests / 15 minutes, per app


Alternative (schneller, aber schlecterer Zugang):

> **Essential**  
>   
> With Essential access, you can now get access to Twitter API v2 quickly and for free! 
>
> * Retrieve 500,000 Tweets per month
> * 1 Project per account
> * 1 App environment per Project
> * No access to standard v1.1, premium v1.1, or enterprise

# Übungen 

## Übungsaufgabe I 

1. Lesen Sie die Anleitung von [Datamuse API](https://www.datamuse.com/api/).

2. Mit Hilfe von Datamuse API finden Sie alle Synonyme zum Wort "old" und speichern sie diese in einem Tibble. 

3. Wie müssen Sie die Parameter anpassen, um maximal 10 Synomyne zu bekommen? 

```r
# Alle Synonyme zu "old"

# Max 10 Synonyme
```

## Übungsaufgabe II

Nehmen wir an wir möchten den Twitter-Account von RT (https://twitter.com/RT_com) analysieren. 

1. Extrahieren Sie die letzten 100 Posts (Tweets) von RT. 

  	1.1. Wie lang im Durchschnitt sind RTs Tweets (`display_text_width`)?

  1.2. Welcher Tweet wurde am häufigsten geliked (`favorite_count`) und welcher am häufigsten retweeted (`retweet_count`)?

  1.3. Filtern sie nur Tweets aus, die Hashtags haben. 

```r
# Extrahieren Sie die letzten 100 Posts (Tweets) von RT.

# Wie lang im Durchschnitt sind RTs Tweets (display_text_width)?

# Welcher Tweet wurde am häufigsten geliked (favorite_count) und welcher am häufigsten retweeted (retweet_count)?

# Filtern sie nur Tweets, die Hashtags haben.
```
  
2. Gucken Sie sich die Followers (n=50) von RT an. 

3. Suchen Sie nach Tweets (n=100) von verifizierten Nutzern, die RT erwähnen (*Tipp:* `search_tweets()`). 

4. Suchen Sie nach Tweets (n=100), die RT erwähnen, aber keine Replies sind. 

```r
# Gucken Sie sich die Followers (n=50) von RT an.

# Suchen Sie nach Tweets (n=100) von verifizierten Nutzern, die RT erwähnen (Tipp: search_tweets()).

# Suchen Sie nach Tweets (n=100), die RT erwähnen, aber keine Replies sind.
```

# Lösungen

## Übungsaufgabe I

```r
# Alle Synonyme zu "old"

d = GET("https://api.datamuse.com/words?rel_syn=old") %>%
    content(as = "text") %>% 
    fromJSON() %>%
    as_tibble()

glimpse(d)

# Max 10

d = GET("https://api.datamuse.com/words?rel_syn=old&max=10") %>%
    content(as = "text") %>% 
    fromJSON() %>%
    as_tibble()

glimpse(d)
```
  

## Übungsaufgabe II

```r
# Extrahieren Sie die letzten 100 Posts (Tweets) von RT.

d = get_timelines("RT_com", n = 100)

# Wie lang sind im Durchschnitt RTs Tweets (display_text_width)?

mean(d$display_text_range)

# Welcher Tweet wurde am häufigsten geliked (favorite_count) und welcher am häufigsten retweeted (retweet_count)?

d[d$favorite_count == max(d$favorite_count),]
d[which.max(d$retweet_count),] #Alternative

# Filtern sie nur Tweets, die Hashtags haben.

#names(d)
filter(d, str_detect(full_text, "^#(\\w)+\\b"))
filter(rt_tweets, !is.na( hashtags))
```
  
```r
# Gucken Sie sich die Followers (n=50) von RT an.

get_followers("RT_com", n = 50)

# Suchen Sie nach Tweets (n=100) von verifizierten Nutzern, die RT erwähnen (Tipp: search_tweets()).

search_tweets(q = "RT_com filter:verified", n=100)

# Suchen Sie nach Tweets (n=100), die RT erwähnen, aber keine Replies sind.

d = search_tweets("RT_com -filter:replies", n=100)
glimpse(d)
```
