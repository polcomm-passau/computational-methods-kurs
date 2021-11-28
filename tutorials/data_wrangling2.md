## `stringr`

`stringr` ist ein wichtiger Package aus dem *tidyverse*-Universum für die Arbeit mit Textdaten.  
  
Alle Funktionen aus dem `stringr`-Package beginnen mit `str_`.

Zum Beispiel: 

*   `str_sub()` : Teile von Strings auswählen
*   `str_length()` : Länge des Strings
*   `str_replace_all()` : Alle Treffer ersetzen 
*   `str_extract_all()` : Alle Treffer extrahieren
*   `str_trim()` : Löscht Leerzeichen am Anfang und Ende
* `str_squish()` : Entfernt mehrfache Leerzeichen innerhalb eines Strings 
*   `str_count()` : Zählt wie oft ein Pattern im Vektor/in einer Spalte vorkommt
*   `str_subset()` : Wählt nur Strings, die bestimmte Bedignungen erfüllen
* `str_c()` : Strings zusammenfügen
* `str_detect()` : TRUE/FALSE ob ein String den Pattern enthält
* `str_split()` : Strings aufteilen


Diese Liste ist auf keinen Fall vollständig. Mehr Informationen zu `stringr` und mehr Beispiele finden Sie unter https://stringr.tidyverse.org/articles/from-base.html 

`stringr` ist ein Teil von *tidyverse*-Universum. Deswegen, um `stringr` zu installieren oder aktivieren, muss man: 

```r
#install.packages("tidyverse")

library(tidyverse)
```

### `_all()` vs. not 


Viele der Funktionen aus dem `stringr`-Package bieten die Möglichkeit sich entweder nur auf den ersten Treffer in einem String zu beziehen oder auf alle. Zum Beispiel:

*   `str_extract()` vs `str_exctract_all()`
*   `str_replace()` vs `str_replace_all()`
* `str_locate()` vs `str_locate_all()`
* `str_match()` vs `str_match_all()`

Was ist der Unterschied? Schauen wir uns die Funktion `str_replace()` an:

```r
text = c("Ich bin ein Vektor mit viel Text", "Ich bin ziemlich nutzlos", "Aber ich diene als Beispiel")

str_replace(text, " ", "_") # Ersetzt nur die erste Übereinstimmung in einem String

#Ausgabe:
#		[1] "Ich_bin ein Vektor mit viel Text" "Ich_bin ziemlich nutzlos"        
#		[3] "Aber_ich diene als Beispiel"
```

c
str_replace_all(text, " ", "_") # Ersetzt alle Übereinstimmungen in einem String
#Ausgabe:
		[1] "Ich_bin_ein_Vektor_mit_viel_Text" "Ich_bin_ziemlich_nutzlos"        
		[3] "Aber_ich_diene_als_Beispiel"
```

## Übungsaufgabe II

Wir benutzen den Datensatz aus der Datei `dirty_schlagzeilen.csv`. Wie Sie sehen ist der Datensatz *tidy* (jede Variable hat eine eigene Spalte, jede Beobachtung hat eine eigene Zeile). ABER die Spalte `schlagzeilen` braucht Bereinigung. 

In der Spalte `schlagzeilen`:


*   Löschen Sie alle überflüssigen Leerzeichen
*   Löschen Sie alle HTML-Tags 
*   Extrahieren Sie die Autoren der Publikation in eine eigene Spalte `Author`
* Löschen Sie danach die Autoren aus den Schlagzeilen

```r
# Löschen Sie alle überflüssigen Leerzeilen

# Löschen Sie alle HTML-Tags (<b> und </b>)

# Extrahieren Sie die Autoren der Publikation in eine eigene Spalte author (Tipp: separate() oder komplizierter - str_split_fixed() )
```

## Regex

*Regex* ist eine sehr effiziente Methode um mit Textdaten zu arbeiten und Daten zu extrahieren, bereinigen und filtern. Ihr werdet es lieben! (und gleichzeitig hassen)


> *Some people, when confronted with a problem, think "I know, I’ll use regular expressions." Now they have two problems* (Jamie Zawinski)

Mit Hilfe von `stringr` und *Regex* kann man **detect**, **subset**, **locate**, **extract**, **match**, **replace** und **split** Textdaten nach bestimmten Patterns. 


Im einfachsten Fall suchen wir nach einer exakten Zeichenkette – etwa um festzustellen, ob der Name `Trump` in aktuellen Schlagzeilen zur USA auftaucht:

```r
schlagzeilen = c(
  "Was hinter Trumps Obama-Obsession steckt",
  "Trump droht US-Staaten mit Finanzstopp bei 1 Billion Dollar",
  "USA verbieten Einreisen aus Brasilien ab 20. Januar",
  "trump droht impeachment "
)

str_extract_all(schlagzeilen, "Trump")
```

```r
# Im RStudio:

install.packages("htmlwidgets")

str_view(schlagzeilen, "Trump") #str_view() ist cooler, aber funktioniert nicht in Google Colab
```

Oft sind aber die Aufgaben (und die Daten) etwas komplizierter. Hier kommt Regex ins Spiel:  

```r
str_extract_all(schlagzeilen, "(T|t)rump") # klein- und großschreibung Trump. 

# Achtung: Alternative Abfragen mit Hilfe von | sollen in Klammern angegeben werden. 

```

Alle Zeichen *Wildcard* `.`:

```r
str_extract_all(schlagzeilen, ".r.mp") # Trump, trump, tramp, trimp, usw.
```

Oder wenn man nur die Schlagzeilen haben möchte, die mit dem Wort "Trump" anfangen oder enden. Das würde man mit Hilfe von Regex-Anker machen. 

Anker (das Wort befindet sich am):

*   `^` : Anfang des Strings
*   `$` : Ende des Strings


```r
str_extract_all(schlagzeilen, "^Trump") # Schlagzeilen die mit Trump anfangen
```
```r
str_extract_all(schlagzeilen, "Trump$") # Schlagzeilen die mit Trump enden
```

Zahlen `\\d`:

```r
str_extract_all(schlagzeilen, "\\d")
```

```r
# Alle Strings in einem Vektor ausgeben, die den gewünschten Muster enthalten:

str_subset(schlagzeilen, "\\d")

#Alternative

schlagzeilen[str_detect(schlagzeilen, "\\d")]

#Ausgabe: 
		[1] "Trump droht US-Staaten mit Finanzstopp bei 1 Billion Dollar"
		[2] "USA verbieten Einreisen aus Brasilien ab 20. Januar"

```

```r
# Nach Zeilen in einem Tibble filtern 

tibble_schlagzeilen = as_tibble(schlagzeilen)

tibble_schlagzeilen %>%
  filter(str_detect(value, "\\d"))
#Ausgabe:                                                     
		1 Trump droht US-Staaten mit Finanzstopp bei 1 Billion Dollar
		2 USA verbieten Einreisen aus Brasilien ab 20. Januar

```r
# Daten aus Spalten extrahieren: 

tibble_schlagzeilen %>%
  mutate(zahlen = str_extract_all(value, "\\d")) %>%
  mutate(trump_mentions = str_count(value, ".rump"))
```


Mit dem ODER-Symbol `|` können wir nach dem Vorkommen mehrerer Zeichenketten suchen:

```r
str_extract_all(schlagzeilen, "(Trump|USA|Vereinige Staaten)")

```

## Kompliziertere Muster suchen und extrahieren

* `.` : Alle Zeichen (*Wildcard*) 
* `\\d` : Alle Ziffern (und `\D` das Gegenteil, also alles außer Ziffern)
* `\\w` : Alle alphanumerischen Zeichen (Klein- und Großbuchstaben, Ziffern, Unterstrich; `\W` das Gegenteil)
* `\\s` : Whitespace (Leerzeichen, Umbrüche; `\S` das Gegenteil)
* `\\b` : Wordendung
* `[abc]` : a, b, oder c
* `[^abc]` : alles außer a, b, oder c


Alternative Schreibweise: 

* `[a-z]` : Buchstaben (kleingeschrieben)
* `[A-Z]` : Buchstaben (großgeschrieben)
* `[0-9]` : Alle Zahlen
* `[:punct:]` : Punktuation
* `[:alpha:]` : Buchstaben (klein- und großgeschrieben)
* `[:lower:]` : Buchstaben (kleingeschrieben)
* `[:upper:]` : Buchstaben (großgeschrieben)
* `[:digit:]` : Zahlen
* `[:alnum:]` : Buchstaben und Zahlen
* `[:graph:]` : letters, numbers, and punctuation.


Um Zeichen mit Sonderbedeutungen darzustellen müssen diese mit doppeltem Backslash *escaped* werden:

+ `\\.` : `.`
+ `\\+` : `+`
+ `\\?` : `?`
+ `\\)` : `)`
+ `\\(` : `(`  
+ `\\|` : `|`
+ `\\\\` : `\`


Auf dieser Webseite können Sie Regex prüfen: https://regexr.com/


## Übungsaufgabe III

Wir arbeiten mit dem eingebauten Datensatz `words`:
```r
length(words)
words[1:20]

#Ausgabe:
		[1] 980
		[1] "a"         "able"      "about"     "absolute"  "accept"    "account"  
		 [7] "achieve"   "across"    "act"       "active"    "actual"    "add"      
		[13] "address"   "admit"     "advertise" "affect"    "afford"    "after"    
		[19] "afternoon" "again"
```

Extrahieren Sie Wörter (benutzen Sie `str_subset()`), die: 

* Die Buchstabenkette (`ana`) enthalten 
*   Beginnen mit `y`
*   Enden mit `x`
* Sind genau drei Buchstaben lang (nicht `str_length()` benutzen!)
* Beginnen nicht mit einem Vokal (*Tipp:* Vokale im Englischen sind a, e, i, o, u).
* Enden mit `ing` oder `ise`.
* Extra: Enden mit `ed`, aber nicht mit `eed`.


## Quantoren

Sogenannte Quantoren (auf Englisch *Quantifiers*) können dazu genutzt werden, um festzulegen, wie oft das zuvor angebene Muster in dem String vorkommen muss.

Quantoren:

* `?` : 0 oder 1
* `+` : 1 oder mehr
* `*` : 0 oder mehr
* `{n}` : genau n
* `{n, }` : n oder mehr
* `{n,m}` : n bis m

```r
aufrufe = c("aaaaaaahhhhh!", "ah", "ahahaha", "haaaayyy")
str_extract_all(aufrufe, "ah")
```
```r
str_extract_all(aufrufe, "a+h*")
```

```r
str_extract_all(aufrufe, "ah{2}")
```
```r
str_extract_all(aufrufe, "ah{1,3}")
```

Quantoren müssen nicht nur auf einen Element (z.B. Buchstabe) angewendet werden. Mit Hilfe von runden `()` und eckigen `[]` Klammern  können wir längere Ausdrücke zu einem Element zusammengefassen.

```r
str_extract_all(aufrufe, "(ah)+")
```

## Übungsaufgabe IV

1. Lösen Sie die Aufgabe erneut, aber diesmal mit Verwendung von Quantoren:

```r
# Extrahieren Sie Wörter die genau drei Buchstaben lang sind: 

str_subset(words, "\\b\\w\\w\\w\\b")

# Neue Lösung: 

str_subset()
```

2. Sie erhalten einen Vektor `spiderman`. Versuchen Sie alle Schreibweisen von Spiderman aus dem Vektor zu extrahieren:

```r
spiderman = c("Spiderman", "Spider man", "Spider-man")
```

3. Sie erhalten einen Vektor mit Telefonnummern: 

```r
numbers = c(
  "(0176) 576 6418",
  "(0151)281-0208",
  "Zuhause: 0176-707-5568",
  "01795052205",
  "Ich habe kein Handy"
)
```

Schreiben Sie eine Regex-Abfrage, die alle Telefonnummern erkennt und extrahiert.

## Übungsaufgabe V (Extra)

Sie erhalten einen Zungenbrecher: 

```r
zungenbrecher = "Bierbrauer Bauer braut braunes Bier, braunes Bier braut Bierbrauer Bauer"
```

*   Wie oft kommt das Wort "Bier" for? 
*  Zählen Sie nur das Wort "Bier" und nicht das Wort "Bierbrauer"
* Extrahieren Sie alle Wörter, die "brau", aber nicht mit "braun" enthalten
* Ersetzen Sie alle Vokale mit "-"


# Lösungen

## Übungsaufgabe I

```r
d = read_csv("dirty_schlagzeilen.csv")
```

## Übungsaufgabe II

```r
d %>%
  #Bessere Übersicht:
  select(-teaser)%>%
  #Leerzeichen: 
  mutate(
    schlagzeilen = str_squish(schlagzeilen),
    schlagzeilen = str_trim(schlagzeilen)
  ) %>%
  #HTML-Tags: 
  mutate(
    schlagzeilen = str_replace_all(schlagzeilen, "<b>", " "), 
    schlagzeilen = str_replace_all(schlagzeilen, "</b>", " ")
  ) %>%
  # Authoren extrahieren: 
  separate(schlagzeilen, sep = "von:", into = c("schlagzeilen", "author"))
```

```r
# Alternative
# Authoren extrahieren (str_split_fixed()):
d %>%
  mutate(
    author = str_split_fixed(schlagzeilen, "von:", 2)[ ,2], # Indexierung von Matrizen
    schlagzeilen = str_split_fixed(schlagzeilen, "von:", 2)[ ,1]
    )
```

## Übungsaufgabe III

```r
#Die Buchstabenkette (ana) enthalten:
str_subset(words, "ana") # 

#Beginnen mit y:
str_subset(words, "^y")

#Enden mit x:
str_subset(words, "x$")

#Sind genau drei Buchstaben lang (nicht str_length() benutzen!):
str_subset(words, "\\b\\w\\w\\w\\b")
#str_subset(words, "^([a-zA-Z][a-zA-Z][a-zA-Z])$") #Alternative 

#Beginnen nicht mit einem Vokal:
str_subset(words, "^[^aeiou]")

#End with ing or ise:
str_subset(words, "ing$|ise$")

#Extra: End with ed, but not with eed.
str_subset(words, "[^e]ed$")
```
