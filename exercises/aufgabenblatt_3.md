Bitte lösen Sie dieses Aufgabenblatt 3 in Zweier-Gruppen und laden Sie Ihre Lösung (**eine R.-Datei**) bis 30.11 auf Stud.IP hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. **Happy Coding!**

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.

## Aufgabe 1: Stringr (10 Pkt)

Sie erhalten einen Vektor `sentences` mit Texten:

```r
sentences = c("Climate change is a crisis all across the world - but how come we've not taken it serious?",
              "CLIMATE CHANGE - the world issue that strikes specifically the poorest 20% around the globe.",
              "Global warming is a problem, but we've known that for a while now.",
              "Climate scepticism under the microscope: A debate between scientists and scepticists across the world",
              "No one's safe? Why this might, after all, not be true when it comes to climate change",
              "We've failed: The climate crisis is dooming")
```

* Bitte ersetzen Sie alle Leerzeichen im Text durch das Wort "Leerzeichen" und speichern die manipulierten Sätze im Vektor `sentences_new` ab.
* Wie oft kommen die Wörter "climate change" (klein- und großgeschrieben) in dem Vektor `sentences` vor? 
* Ersetzen Sie die umgangssprachige Englische Schreibweise "we've" mit "we have"
* Welcher Regulärer Ausdruck wird die ganzen Sätze erkennen? D.h. im Fall des ersten Satzes soll der ganze Satz "Climate change is a crisis all across the world - but how come we've not taken it serious?" erkannt werden)(benutzen Sie `str_view()`).


## Aufgabe 2: Regex (10 Pkt)

Sie erhalten einen Vektor `imdb_urls` mit URLs zu Filmen aus der Internet Movie Database (https://www.imdb.com/). Jeder Link enthält eine eindeutige ID (im Format ".../title/tt[ID]"). Bitte extrahieren Sie diese IDs in einen neuen Vektor.    

```r
imdb_urls = c(
  "https://www.imdb.com/title/tt6751668/?ref_=hm_fanfav_tt_4_pd_fp1", # Zum Beispiel, die ID hier ist 6751668
  "https://www.imdb.com/title/tt0260991/",
  "www.imdb.com/title/tt7282468/reviews",
  "https://m.imdb.com/title/tt4768776/"
)
```

## Aufgabe 3: Datensätze mit Regex verändern (30 Pkt)

Laden Sie die Excel-Datei `RT_D_Small.xlsx` von Stud.IP in Ihr Projektverzeichnis herunter und lesen Sie den Datensatz in R ein. Bei dieser Datei handelt es sich um Posts von der Facebook-Seite RT Deutsch (diese Datei sollte Ihnen schon aus dem letzten Arbeitsblatt bekannt sein). Bitte benutzen Sie eine Funktion aus dem *tidyverse*-Package, um die Datei einzulesen.   

* Erstellen Sie eine neue Spalte `links_from_text`, die alle Links aus der Spalte `text` enthällt 
* Aus der Spalte `fulltext`, löschen Sie den wiederholenden Satz "AddThis Sharing Buttons"
* Fast jeder Post in der Spalte `fulltext` enthällt eine Quelle ("Quelle: [...]"). Erstellen Sie eine neue Spalte, die die Quellen enthällt.
* Extrahieren Sie alle Hashtags (#) und alle Mentions (@) aus der Spalte `fulltext` in jeweilige neue Spalten. 
* In allen Texten in der Spalte `fulltext` löschen Sie den gesamten Text nach dem Wort "Tags: " 
* Wählen Sie alle Zeilen, die in der Spalte `text` ein Plus-Zeichen (`+`) enthalten. 


## Aufgabe 4: Regex (Email) (20 Pkt)

Sie erhalten einen Vektor `emails`, der verschiedende Uni Passau-Emails enthällt. Schreiben Sie Code, der alle gegebenen Emails zu extrahieren schafft.

```r
emails = c("daria.kravets@uni-passau.de",
      "kravet01@ads.uni-passau.de",
      "florian.toepfl@uni-passau.de", 
      "toepf2@ads.uni-passau.de"
      )
```

## Aufgabe 5: Regex Daten extrahieren (30 Pkt)

Aus folgendem Vektor `adressen` extrahieren Sie folgende Adressbestandteile in einzelne Spalten in eine Tibble-Dataframe `adressen_tibble`:

* Straßenname
* Hausnummer
* Postleitzahl
* Stadt
* Land (ausgeschrieben, d.h. Deutschland für D, Österreich für A, usw.)

```r
adressen = c(
    "Platz der Republik 1, D-11011 Berlin",
    "Dr.-Hans-Kapfinger-Str 14c, D-94032 Passau",
    "Opernring 2, A-1010 Wien",
    "Bundesplatz 3, CH-3005 Bern"
  )
```

