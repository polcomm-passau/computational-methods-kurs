# Web Scraping mit `RSelenium`

## Was sind dynamische Webseiten? 

> **Dynamische** Internetseiten werden auf Basis von Datenbanken generiert. Das bedeutet, dass die Inhalte (Texte, Bilder etc.) getrennt von technischen Elementen (Layout- Vorlagen, Programmierung, Skripte) aufbewahrt werden. Wenn ein Besucher die Website besucht, werden die Inhalte aus den Datenbanken gelesen und zu einer Internetseite zusammengefügt. Erst dann erscheinen alle Inhalte auf der Seite. 

> **Statische** Webseiten werden dagegen gleich vollständig als einzelne Dateien auf dem Webserver gespeichert. Wenn ein Besucher also die Website besucht, werden die Seiten direkt zu ihm übertragen. Ein Zugriff auf Datenbanken erfolgt nicht. 

![static_dynamic](https://user-images.githubusercontent.com/17723168/148783601-63611263-d364-47a4-94ac-ab7304773270.jpg)


## Wie erkennt man dynamische Webseiten?


Die Häufigsten Indikatoren: 

*   `php`-Endung
*   `iframe`-Tag
* `script`- Tag

Ein anderer Indikator -> ihr versucht was zu scrapen, aber es ist nicht in dem HTML drin. 

## Übungsaufgabe I

Versucht den Speiseplan von der [Mensa-Webseite](https://stwno.de/de/gastronomie/speiseplan/uni-passau/uni-passau-mensa) zu scrapen.  

```r
library(rvest)

# Tipp:

read_html() # liest die URL
html_nodes() # Wählt die Elemente
html_text2() # Extrahiert die Texte
```

```r
# Warum funktioniert das nicht? 

# Mensa

mensa = read_html("https://stwno.de/de/gastronomie/speiseplan/uni-passau/uni-passau-mensa") %>% 
  html_nodes('.speiseplan') %>%
  html_text2()

mensa
```


Andere Beispiele: 

*   https://de.rt.com/europa/128523-ukraine-als-aufmarschplatz-nato-schon-10000-soldaten-der-westlichen-allianz-land/
*   https://www.sueddeutsche.de/bayern/covid-kids-bavaria-studie-bayern-1.5491443?reduced=true
* https://de-de.facebook.com/


# `RSelenium`


Arbeiten mit RSelenium ist ein ziemlich kompliziertes Verfahren, die sehr Fehleranfällig ist. Es gibt auch unterschiedliche Möglichkeiten wie man mit RSelenium arbeitet: (1) Remote Driver von `RSelenium` (2) Docker-Sessions (empfohlen, aber komplizierter), oder (3) durch einen eigenen manuellen Server (ganz kompliziert!).  Ich zeige Euch heute die einfachste (1) Variante. 


> ***Warnung:*** Schon die einfachste Ausführung von `RSelenium` ist aber kompliziert und benögt oft Installation von externen Software (z.B. Java!). Ihr könnt auch Probleme mit Administratorenrechten, Anti-Virus Programmen oder Firewall bekommen.


Mehr zu `RSelenium` [hier](https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html) oder hier ist ein praktischer Cheat Sheet: https://github.com/yusuzech/r-web-scraping-cheat-sheet/blob/master/README.md 

```r
install.packages("RSelenium")
```

Wenn Probleme schon bei der Installation auftauchen, versucht RSelenium von GitHub herunterzuladen:

```r
devtools::install_github("ropensci/RSelenium")
```
```r
library(RSelenium)

# Öffnet den Firefox-browser

rD <- rsDriver(browser="firefox", port=49695L, verbose=F) # Falls nicht öffnet: Port ändern 
remDr <- rD[["client"]]
```

Falls ihr ein Fehler bekommt: 
```r
rD <- rsDriver() # Öffnet per Default Chrome-Browser 
remDr <- rD[["client"]]

# Weitere Fehler: 

Selenium message:session not created: This version of ChromeDriver only supports Chrome version 97
Current browser version is 96.0.4664.110 with binary path C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

# Alle mögliche Versionen anzeigen: 

binman::list_versions("chromedriver")

# Bestimmen welche Version von Chromedriver zu nutzen: 

rD <- rsDriver(chromever = "96.0.4664.45", verbose=F) 
remDr <- rD[["client"]]

```

## Was kann man mit `RSelenium` machen?

Zur Webseite navigieren: 

```r
remDr$navigate("http://www.google.de/")
```

Irgendwas machen: (z.B. Text eingeben und auf Knöpfe drücken)

```r
webElem <- remDr$findElement(using = "css", value = "input") # using = "xpath", "css", "id", "name", "tag name", "class name", "link text", "partial link text"
webElem$sendKeysToElement(list("RStudio", key = "enter")) # Text einfügen und Enter drücken
```

Verfügbare Keys: 

```r
 [1] "null"         "cancel"       "help"         "backspace"    "tab"          "clear"        "return"       "enter"        "shift"        "control"     
[11] "alt"          "pause"        "escape"       "space"        "page_up"      "page_down"    "end"          "home"         "left_arrow"   "up_arrow"    
[21] "right_arrow"  "down_arrow"   "insert"       "delete"       "semicolon"    "equals"       "numpad_0"     "numpad_1"     "numpad_2"     "numpad_3"    
[31] "numpad_4"     "numpad_5"     "numpad_6"     "numpad_7"     "numpad_8"     "numpad_9"     "multiply"     "add"          "separator"    "subtract"    
[41] "decimal"      "divide"       "f1"           "f2"           "f3"           "f4"           "f5"           "f6"           "f7"           "f8"          
[51] "f9"           "f10"          "f11"          "f12"          "command_meta"
```

Einloggen: 

```r
# Log In
remDr$navigate("http://quotes.toscrape.com/login")
#enter username
element <- remDr$findElement(using = "css","#username")
element$sendKeysToElement(list("myusername"))
#enter password
element <- remDr$findElement(using = "css","#password")
element$sendKeysToElement(list("mypassword"))
#click login button
element <- remDr$findElement(using = "css", 'input[type="submit"]')
element$clickElement()
```


Auf irgendwas klicken: 

```r
webElem$clickElement()
```

Nach Unten/Oben scrollen: 

```r
element <- remDr$findElement("css", "body")
element$sendKeysToElement(list(key = "page_down")) 
```

Navigation mit `RSelenium`:

```r
remDr$goBack()
remDr$goForward()
remDr$refresh()
remDr$getTitle()
remDr$getCurrentUrl()
remDr$getStatus()
remDr$getAllCookies()
remDr$deleteCookieNamed("PREF")
```


Zu iframes wechseln:  

```r
remDr$navigate("https://scrapethissite.com/pages/frames/")
# select iframe element
element <- remDr$findElement(using = "css","#iframe")
#switch to the iframe
remDr$switchToFrame(element)
```

HTML Extrahieren und mit `rvest` bearbeiten

```r
#Scrape HTML

remDr$navigate("http://quotes.toscrape.com")

# get parsed page source
parsed_pagesource <- remDr$getPageSource()[[1]]

# using rvest to extract information
quotes = read_html(parsed_pagesource) %>%
  html_nodes("[itemprop = text]") %>%
  html_text2()

quotes

Codezelle <runyIqWFhyHY>
#%% [code]
#Remote Driver stoppen

remDr$close()

rD[["server"]]$stop()
```

# Übungsaufgabe II


Sammelt jetzt den Speiseplan für heute von der [Mensa-Webseite](https://stwno.de/de/gastronomie/speiseplan/uni-passau/uni-passau-mensa). Natürlich mit Hilfe von RSelenium
