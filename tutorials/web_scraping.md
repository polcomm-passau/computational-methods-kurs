# Web Scraping

Web Scraping bezeichnet allgemein Verfahren zur automatisierten Extraktion von Inhalten auf Webseiten.

Drei Schritte beim Web Scraping: 

1.   **Die HTML-Seite öffnen und einlesen.** 
2.   **HTML-Elementen auswählen.**
3.   **Daten aus diesen Elementen extrahieren.**

# Web Scraping mit `rvest`

![rvest](https://user-images.githubusercontent.com/17723168/148790713-496afbe3-c3d1-49ae-b2a0-c05443f62146.png)

`rvest` ist ein Teil von *tidyverse*-Universum, deswegen muss es nicht gesondert installiert werden. 

```r
install.packages("tidyverse") # Eine Tidyverse-Installation reicht aus

# ODER:

install.packages("rvest")

# Aktivieren: 

library(rvest)
```

Die vier wichtigsten Funktionen von `rvest` sind `read_html()`, `html_nodes()`, `html_text()`/`html_text2()` und `html_attr()`. 

## `read_html()` : Quellcode einlesen


Als erstes laden wir den Quellcode dieser [Webseite](https://raw.githack.com/ccs-amsterdam/r-course-material/master/miscellaneous/simple_html.html), die wir scrapen möchten, herunter:

![simple_html](https://user-images.githubusercontent.com/17723168/148791093-60c9768b-d6c3-4059-9107-0e604d17ed61.png)

simple_html = read_html("https://raw.githack.com/ccs-amsterdam/r-course-material/master/miscellaneous/simple_html.html")

## `html_nodes()` : Elemente auswählen 

Zur Auswahl von HTML-Elementen nutzen wir die Funktion `html_nodes()`, der wir einen CSS-Selector oder XPath als Argument übergeben. Nehmen wir an, wir möchten die alle Paragraphen (\<p>) sammeln: 

```r
simple_html %>% 
  html_nodes("p") 
  #html_node("p") würde nur den ersten Paragraph auswählen 

# Ergebnis: 
	text/plain
		{xml_nodeset (4)}
		[1] <p>This is a simple HTML document. Right click on the page and select <b> ...
		[2] <p>Alternatively, right click on a specific element on the page and selec ...
		[3] <p>Here's a stupid table.</p>
		[4] <p>Here's another column! The main purpose of this column is just to show ...
```


Oder nehmen wir an, wir möchten alle Paragraphen nur aus der linken Spalte auswählen: 

```r
simple_html %>% 
  html_nodes(".leftColumn") %>% # Wählt alle Elemente mit class = leftColumn 
  html_nodes("p") 
  
# Oder 

simple_html %>% 
  html_nodes("div.leftColumn") %>% # Wählt alle div-Elemente mit class = leftColumn 
  html_nodes("p") 

# Alternative Schreibweise: 

simple_html %>% 
  html_nodes(".leftColumn p")
```


### Wählen mit IDs. ID ist bei HTML unique, also man kriegt immer nur ein Element zurück. 

```r
simple_html %>% 
  html_nodes("#steve") # IDs können alles mögliche sein, in diesem Fall ist die ID = steve
  
# Ergebnis: 

	text/plain
		{xml_nodeset (1)}
		[1] <table class="someTable blue" id="steve">\n<tr class="headerRow">\n<th>nu ...

```

```r
# Mehrere Elemente wählen: 

simple_html %>% 
  html_nodes(".rightColumn, .leftColumn") # Zwei Spalten wählen

Ergebnis: 

	text/plain
		{xml_nodeset (2)}
		[1] <div class="leftColumn">\n    <h4>Left Column</h4>\n\n    <p>This is a si ...
		[2] <div class="rightColumn">\n    <h4>Right Column</h4>\n    \n    <p>Here's ...
```

## Daten aus Elementen extrahieren:

*   Text: `html_text()` und `html_text2()`
*   Tabellen: `html_table()`
*  Attributen: 
  - Links: `href`
  - Bilder : `src`
  - Datum : `datetime`



## `html_text()` und `html_text2()`: Text aus Elementen extrahieren

Zuerst versuchen wir die Funktion `html_text()` aus: 

```r
simple_html %>% 
  html_nodes("p") %>% 
  html_text()

# Ergebnis: 

	text/plain
		[1] "This is a simple HTML document. Right click on the page and select view page source \n       (or something similar, depending on browser) to view the HTML source code."                                                                                                                                                                                                                                                                                  
		[2] "Alternatively, right click on a specific element on the page and select inspect element. \n       This also shows the HTML code, but focused on the selected element. You should be able to fold \n       and unfold HTML nodes (using the triangle-like thing before the <tags>), and when you hover \n       your mouse over them, they should light up in the browser. Play around with this for a bit to get \n       a feel for exploring HTML code."
		[3] "Here's a stupid table."                                                                                                                                                                                                                                                                                                                                                                                                                                   
		[4] "Here's another column! The main purpose of this column is just to show that you can\n       use CSS selectors to get all elements in a specific column.\n    "
```

Das sieht schon fast schön aus. Was stört sind die unnötigen Whitespaces (`\n` steht für Newline, also einen Zeilenumbruch). Dagegen kann man die Funktion `str_squish()` anwenden (Sie kennen diese aus der Sitzung über [Arbeiten mit Texts](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/data_wrangling2.md)). 

```r
library(tidyverse)

simple_html %>% 
  html_nodes("p") %>% 
  html_text() %>% 
  str_squish()

# Ergebnis: 
	text/plain
		[1] "This is a simple HTML document. Right click on the page and select view page source (or something similar, depending on browser) to view the HTML source code."                                                                                                                                                                                                                                                       
		[2] "Alternatively, right click on a specific element on the page and select inspect element. This also shows the HTML code, but focused on the selected element. You should be able to fold and unfold HTML nodes (using the triangle-like thing before the <tags>), and when you hover your mouse over them, they should light up in the browser. Play around with this for a bit to get a feel for exploring HTML code."
		[3] "Here's a stupid table."                                                                                                                                                                                                                                                                                                                                                                                               
		[4] "Here's another column! The main purpose of this column is just to show that you can use CSS selectors to get all elements in a specific column."
```

Alternative ist die Funktion `html_text2()` zu nutzen. Disese Funktion ist langsamer, aber schneidet automatisch die unnötigen Leerzeichen oder Zeilenumbrüche aus:  

```r
texts = simple_html %>% 
  html_nodes("p") %>% 
  html_text2()
```

Ein Tibble mit Daten erstellen: 

```r
simple_tibble = tibble(

  texts = texts # Der Tibble wird nur eine Spalte "texts" haben, aber man kann mehr Spalten dazu tun.
  ) 

simple_tibble

# Ergebnis: 

	text/plain
		texts                                                                                                                                                                                                                                                                                                                                                                                                                
		1 This is a simple HTML document. Right click on the page and select view page source (or something similar, depending on browser) to view the HTML source code.                                                                                                                                                                                                                                                       
		2 Alternatively, right click on a specific element on the page and select inspect element. This also shows the HTML code, but focused on the selected element. You should be able to fold and unfold HTML nodes (using the triangle-like thing before the <tags>), and when you hover your mouse over them, they should light up in the browser. Play around with this for a bit to get a feel for exploring HTML code.
		3 Here's a stupid table.                                                                                                                                                                                                                                                                                                                                                                                               
		4 Here's another column! The main purpose of this column is just to show that you can use CSS selectors to get all elements in a specific column.
```

## `html_table()` : Tabellen als Dataframe extrahieren

```r
simple_html %>% 
  html_element('#exampleTable') %>%  # #id = 
  html_table() # Das Ergebnis ist ein Dataframe

# Ergebnis: 

	text/plain
		First column Second column Third column
		1 1            2             3           
		2 4            5             6
```

## `html_attr()` : Attribute aus HTML-Elementen extrahieren

Neben dem Text sind zudem Attribute der selektierten HTML-Elemente für uns von Interesse. Diese können wir mit der Funktion `html_attr()` extrahieren. 

Häufige Attribute, die uns interessieren: 

*   `href` : Links
*   `src` : Bilder 
*   `datetime` : Timestamp


Zum Beispiel, alle **Links** von [dieser](https://de.wikipedia.org/wiki/Hyperlink) Wikipedia-Seite extrahieren:

```r
read_html("https://de.wikipedia.org/wiki/Hyperlink") %>% 
  html_nodes("a") %>%       # Alle Links (<a>-Tag) auswählen
  html_attr("href") %>%     # Attribut "href" extrahieren
  length() # Wie viele Links sind drin? 

```

Alle **Bilder**: 

```r
read_html("https://de.wikipedia.org/wiki/Hyperlink") %>% 
  html_nodes("img") %>%       # Alle Links (<img>-Tag) auswählen
  html_attr("src")  # Alle Attribute "src" extrahieren  

# Ergebnis: 
		[1] "//upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Hyperlink-Wikipedia.svg/220px-Hyperlink-Wikipedia.svg.png"          
		[2] "//upload.wikimedia.org/wikipedia/commons/thumb/6/68/Hyperlinkstrukturen.png/220px-Hyperlinkstrukturen.png"              
		[3] "//upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Directed_graph%2C_cyclic.svg/220px-Directed_graph%2C_cyclic.svg.png"
		[4] "//upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Wiktfavicon_en.svg/16px-Wiktfavicon_en.svg.png"                     
		[5] "//upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Pictogram_voting_info.svg/15px-Pictogram_voting_info.svg.png"       
		[6] "//de.wikipedia.org/wiki/Special:CentralAutoLogin/start?type=1x1"                                                        
		[7] "/static/images/footer/wikimedia-button.png"                                                                             
		[8] "/static/images/footer/poweredby_mediawiki_88x31.png"
```


## Übungsaufgabe I 

1. Sammeln Sie alle Überschriften und die dazugehörigen Links von der Titelseite von [RT Deutsch](https://de.rt.com/) in einem Tibble `rt_tibble` (wir werden den Tibble später noch mal verwenden). 

```r
rt_tibble = 

```

2. Jetzt gehen Sie zu irgendwelchem Artikel von RT Deutsch (z.B. [hier](https://de.rt.com/international/128452-moskau-lehnt-klimawandel-resolution-ab/)) und extrahieren Sie den Überschrift, das Datum und die Uhrzeit der Publikation und den Text in einen Tibble. 


## XPath 

*XPath* ist mächtig, mächtiger als CSS, aber komplizierter. Mehr Infos über XPath: https://www.w3schools.com/xml/xpath_syntax.asp

```r
html_node(simple_html, xpath = ".//table[@class='t-chart']") # XPath-Schreibweise
```


# Effizientes Scraping mit Funktionen

Oft wollen wir aber mehrere Webseiten mit dem selben Layout (z.B. mehrere Artikel von einer Nachrichtenwebseite) sammeln. Das geht mit Hilfe von Funktionen (könnt ihr Euch noch dran errinern?) 

```r
# Funktionen (fun und ENTER in RStudio)

my_function_name = function(argument){
# function body
    output = argument # hier "hello"
    return(output) # beendet die Funktion
}

my_function_name("hello") #Funktion-Aufruf
```

Nehmen wir an wir wollen Beschreibungen von Spauspielern von imbd.com sammeln. Auf der imdb-Webseite befinden sich Tausende Beschreibungen, die den gleichen Layout haben. Zum Beispiel, so sieht die Beschreibung von den Schauspieler Bill Murray aus: 

![bill_murray](https://user-images.githubusercontent.com/17723168/148791031-fd895aeb-7845-492b-98af-7562bc1774c7.png)

