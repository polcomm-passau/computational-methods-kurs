# Variablen und Variablentypen in R

- [Variablenzuweisung](#Variablenzuweisung)
- [Variablentypen](#Variablentypen)
  - [Einfache Variablentypen](#Einfache-Variablentypen)
    - [Integer](#Integer)
    - [Numeric](#Numeric)
    - [Character/String](#Character-String)
    - [Logical/Boolean](#Logical/Boolean)   
  - [Komplexere Variablentypen](#Komplexere-Variablentypen)
    - [Vektoren](#Vektoren)
    - [Listen](#Listen)
    - [Matrizen](#Matrizen)
    - [Dataframe](#Dataframe)
    - [Date/POSIXct](#Date/POSIXct)
- [Variablentyp ändern](#Variablentyp-ändern)
- [Logische Operatoren](#Logische-Operatoren)
- [Variablenbenennung](#Variablenbenennung)
- [Übungsaufgaben](#Übungsaufgaben)

# Variablenzuweisung

In R gibt es grundsätzlich zwei Wege, um einer Variable einen Wert zuzuweisen: `<-` und `=`.

```r
#Zuweisungsoperatoren
x = 10 #oder
x <- 10
```

Was ist richtiger? Beides ist möglich, aber die R Community und das R Styling Guide empfehlen, `<-` zu verwenden. Warum?  

+ Es gibt tatsächlich Fälle, wo `<-` die einzige richtige Möglichkeit ist, einen Wert einer Variable zuzuweisen ([hier](https://www.r-bloggers.com/2018/09/why-do-we-use-arrow-as-an-assignment-operator/) können Sie die Beispiele angucken, wenn das der Fall wäre). Das sind aber nicht viele und die begegnet man im "Freien Leben" nicht oft. 

+ **Historische Gründe:**
  + Bis 2001 was `<-` die einzige Möglichkeit in R einer Variable einen Wert zuzuweisen. Also sind viele einfach konservativ. 
  + Früher war `<-` nur ein Klick, da die APL Tastaturen an den R entwickelt wurde hatten eine Taste `<-`.  
 
+ **Mathematische Gründe:** 
  + Aus mathematischer Sicht ist der Pfeil schöner, denn er macht die Richtung der Zuordnungsrichtung klar. Übringens, der Pfeil nach rechts `->` würde in R auch funktionieren, aber bitte benutzt das nicht. Das Shortcut für den Linkspfeil in R-Studio ist übrigens `Alt` + `–`.
   
+ **ABER:** `=` ist lesbarer für andere Programmiersprachen. Deswegen entscheiden sich viele R-Nutzer, die zur R aus anderen Programmiersprachen wechseln für `=`.
+ FUN FACT: Package [formatR](https://yihui.org/formatr/) ändert automatisch `=` zu `<-`.


# Variablentypen

## Einfache Variablentypen

### Integer
```r
x = 10L
class(x) # class() spuckt den Variablentyp() aus
## [1] "integer"
```
Übringes, L steht für Long (32-bit integer in C). 

### Numeric

*Numeric* ist der Standardtyp für Zahlen in R. Dieser Variablentyp ist für Zahlen mit Bruchkommastellen reserviert, aber oft erkennt R ganze Zahlen auch als Numeric. 

```r
x = 10.5
class(x)
## [1] "numeric"
```
### Character/String

*Character*-Variablen sind ein sehr interessanter und wichtiger Datentyp für uns und wir werden damit sehr viel in der Zukunft arbeiten.

```r
x = "Hello 'Daria'" # "" oder ''. In "kann man '' verwenden"
class(x)
## [1] "character"
```

#### Praktische Funktionen mit Strings

```r
a = "Hello"
substr(a, 1, 2) #String a verkürzen
## [1] "He"
toupper(a) 
## [1] "HELLO"
tolower(a)
## [1] "hello"
strsplit(a, NULL) #String a in Buchstaben aufteilen
## [1] "H" "e" "l" "l" "o"
paste(a, "Du da") #Zum String einfügen 
## [1] "Hello Du da"
paste(a, "Du da", sep= ", ")
## [1] "Hello, Du da"
```

### Logical/Boolean

*Logical* können nur zwei Ausprägungen haben: `TRUE` oder `FALSE`. Übrigens, im Computer Science ist TRUE = 1 und FALSE = 0. 

```r
x = TRUE
y = FALSE # Achtung! Die Schreibweise! Alles groß.
class(x)
## [1] "logical"
```

## Komplexere Variablentypen

### Vektoren 

Vektoren sind Objekte, die mehrere Werte desselben Typs beinhalten. Wir erzeugen Vektoren über die Funktion `c()` (von concatenate, also verketten). Die einzelnen Elemente des Vektors werden durch Kommas , getrennt.

```r
gerade_zahlen <- c(2, 4, 6, 8)
ungerade_zahlen <- c(1, 3, 5, 7, 9)
string_vector = c("Ich", "bin", "ein", "String", "Vektor")
zahlen = c(gerade_zahlen, ungerade_zahlen) #die Zahlen werden nicht sortiert, sondern nacheinander eingefügt.
## [1] 2 4 6 8 1 3 5 7 9
```
####  Vektorelemente auswählen 

Um auf Vektorenelemente zuzugreifen, benutzen wir eckige Klammen `[]`. Ein anderer Name dafür ist Index-Slicing. Anders als bei anderen Programmiersprachen, fängt R bei `1` statt bei `0` zu zählen.  

```r
zahlen = c(2, 4, 6, 8, 1, 3, 5, 7, 9)
zahlen[2] # 2 Element -> ## [1] 4
zahlen[2:5] # Alle Elemente zwischen 2 und 5. -> ## [1] 4  6  8  1  3
zahlen[c(1,4,6)] #gibt das 1, 4 und 6 Element aus -> ## [1] 2 8 3
zahlen[-1] #Löscht das 1. Element 
```

#### Vektoren Namen vergeben

```r
country_codes <- c(germany = 0049, australia = 0061, italy = 0039)
class(country_codes) #Immer noch numerischer Vektor
names(country_codes) #aber mit namen
country_codes["italy"]

codes = c(55, 44, 66)
names(codes) = c("china", "russia", "us")
codes
```

#### Praktische Funktionen mit Vektoren

Das besondere an Vektoren in R ist, dass man sehr einfach Ausrechnungen mit den ausführen kann. 

```r
zahlen + 1 #Addiert 1 zu jedem Element des Vektors 
## [1] 3  5  7  9  2  4  6  8 10
zahlen[zahlen > 3] #gibt nur Zahlen > 3 aus
## [1] 4 6 8 5 7 9
sum(zahlen)
## [1] 45
min(zahlen)
## [1] 1
max(zahlen)
## [1] 9
mean(zahlen)
## [1] 5
sd(zahlen) # Standardabweicherung
## [1] 2.738613
length(zahlen) # Länge des Vektors 
## [1] 9
```

### Listen

Listen in R sind Vektoren, die mehrere Werte unterschiedlichen Typs beinhalten. Wir erzeugen Listen über die Funktion `list()`. Wie bei Vektoren werden die einzelnen Elemente des Listes durch Kommas , getrennt.

```r
l = list(10L, 3.14, "Text")
class(l)
## [1] "list"
```

### Matrizen

```r
mat = matrix(1:12, 3,4)
mat
##        [,1] [,2] [,3] [,4]
##  [1,]    1    4    7   10
##  [2,]    2    5    8   11
##  [3,]    3    6    9   12
```

### Dataframe

*Dataframes* sind ein wichtiges Format für uns und man kann sie sich wie ganz normale Excel-Tabellen vorstellen.   

```r
df = mtcars
df$cyl + 1 # mit $ greift man auf einzelne Spalten eines Dataframes
dim(df) # Dimensionen eines Dataframes 
length(df) #Zahl der Variablen
names(df)
summary(df)

new_df = df[df$cyl >5 ,] #Subset -> Alle Autos mit mehr als 5 Zylinder (cyl)
new_df
```



### Date/POSIXct

*Date* (Datum) und *POSIXct* (Zeitstempel: Datum + Uhrzeit) sind besondere Variablentypen in R mit den wir in den Sozialwissenschaften oft arbeiten. Datum in Date-Format in R zu haben lohnt sich besonders wenn man Zeitverläufe analysieren möchte oder bestimmte Ausrechnungen mit Daten durchführen möchte (z.B. Daten aggregieren pro Woche). 

Standardgemäß möchte R Daten in `yyyy-mm-dd`-Format haben. Wenn die Daten aber in einem anderen Format vorliegen (was ziemlich oft der Fall ist), kann man das Format mit Hilfe von dem `format`-Parameter und einem entsprechenden Format-Kürzel ändern (das geht mit der Funktion `as.Date(str, format)`).     

```r
d = Sys.Date() # gibt heutiges Datum aus
d
## [1] "2021-10-29"
format(d,"%m-%Y") #Änderung des Formats mit Hilfe von Format-Kürzel (fangen immer mit % an)
## [1] "10-2021"
## Oft liegen uns aber Daten im String-Format vor: 
as.Date("2020-03-11") #Ein String im Standardformat (yyyy-mm-dd) ins Date umwandeln 
as.Date("11.03.2020", format = "%d.%m.%Y") # Daten mit anderen Formaten (z.B. dd.mm.yyy) in Date umwandeln. 
```

#### Wichtigsten Format-Kürzel für Date und POSIXct

| Kürzel   | Bedeutung                                |
| -------- | ---------------------------------------- |
| %d       | Tag (1-31) |
| %m       | Monat (1-12)|
| %B       | Monat buchstabiert (Mai, Juni) |
| %b oder %h| Monat kurz (Jun, Dez)|
| %y       | Jahr kurz (20, 19) |
| %Y       | Jahr lang (2020, 2019) |
| %H       | Stunden (00-23) |
| %l       | Stunden (00-12) |
| %M       | Minuten (00-59) |
| %S       | Sekunden (00-59)|

  
Es gibt aber auch andere Formate wie Tag der Woche, Jahrhundert, usw. Hier findet ihr eine ausführlichere Liste: https://databraineo.com/ki-training-resources/r-programmierung/datum-und-zeitstempel-in-r-lubridate/


# Variablentyp ändern

```r
x = "3"
class(x)
## [1] "character"
# Zum Integer:
x = as.integer(x)
as.integer(3.14)
as.integer("3.14")
# Zum Character/String:
as.character(3)
# Zum Numeric:
as.numeric("3.14")
# Zum Datum:
as.Date("2021-10-29")
```

# Logische Operatoren

| Operator   | Vergleich          | Beispiele                     |
| ---------- | -------------------|------------------------------ |
|`==`        | ist gleich | `1 == 1` ergibt `TRUE`   |
|`!=`        | ist ungleich | `1 != 1` ergibt `FALSE` |
|`<`        | ist kleiner | `1 < 2` ergibt `TRUE`|
|`>`        | ist größer   | `1 > 2` ergibt `FALSE` |
|`<=`       | ist kleiner/gleich| `1 <= 1` ergibt `TRUE`|
|`>=`       | ist größer/gleich| `2 >= 2` ergibt `TRUE`|

# Variablenbenennung

<img src="https://user-images.githubusercontent.com/17723168/141303326-c6edf25d-e1e2-4362-ad3a-455b36d9f737.png" width="50%" >

Bis jetzt haben unseren Variablen immer nur `x`, `y` oder einfache Wörter als Namen vergeben. Aber man könnte und sollte die Variablen immer sinnvoll benennen und zwar danach was sie machen oder beinhalten. Und Absurd wie es am Anfang klingt, Variblenbenennung ist echt ein komplixiertes Thema beim Programmieren. Einen sinnvollen und passenden Namen für eine Variable zu finden kann schwer sein - Sie werden das schon selbst merken!  

Es gibt eigentlich nicht viel was ihr bei der Variablenbenenung beachten solltet:

### 1) Feste Regeln

Variablen:
  * können Groß- und Kleinbuchstaben, Ziffern sowie Punkte . und Unterstriche _ beinhalten. Andere Sonderzeichen, Umlaute und Leerzeichen sind nicht gestattet.
  * können mit einem Buchstaben oder einem `.` beginnen, nicht jedoch mit Ziffern oder `_` (bei `.` muss das zweite Zeichen ein Buchstabe sein).
  * sind case-sensitive, d.h. unterscheiden zwischen Groß- und Kleinschreibung. `myVar` und `myvar` sind also unterschiedliche Objekte.
  * können nicht eine von diesen Wörtern sein: *if, else, repeat, while, function, for, in, next, break, TRUE, FALSE, NULL, Inf, NaN, NA, NA_integer_, NA_real_, NA_complex_, NA_character_*

### 2) Styling-Konventionen

*snake_case* (`ich_bin_eine_Variable`) und *camelCase* (`ichBinEineVariable`) sind die zwei gängigsten Schreibweisen beim Programmieren. 

![image](https://user-images.githubusercontent.com/17723168/141304262-19876c32-ff29-404a-8cb4-3fea43495a5d.png)


### 3) Muss sinnvoll/nachvollziehbar sein

```r
# Gute Variablennamen: 

mittelwert = 1.5
alter = 29
name = "Daria" 

# Schlechte Variablennamen: 

x1 = 1.5
var = 29
aklasls = "Daria" 

```
<span style="color:red">Wichtig</span> bei der Variablenbenennung - Einheitlich bleiben! 

<img src="https://user-images.githubusercontent.com/17723168/141305178-4ac7cbda-bb22-40d6-bfa7-cc07b46bddaa.png" width="70%" >

# Übungsaufgaben

### 1. Vektoren  

  1.1. Erstellen Sie einen Vektor mit den durchschnittlichen Höchsttemperaturen im Januar für Peking, Lagos, Paris, Rio de Janeiro, San Juan und Toronto. Die entsprechenden    Temperaturen sind 35, 88, 42, 84, 81 und 30 Grad Fahrenheit. Nennen Sie die Variable `temp_january`.  

  1.2. Erstellen Sie nun einen Vektor mit den Städtenamen und nennen Sie den Vektor `city`.  

  1.3. Verwenden Sie die Namensfunktion, um die Temperaturdaten der entsprechenden Stadt zuzuordnen.  

  1.4. Verwenden Sie die Operatoren `[` und `:`, um auf die Temperatur der ersten drei Städte in dem Vektor zuzugreifen.  

  1.5. Verwenden Sie den Operator `[`, um auf die Temperatur von Paris und San Juan zuzugreifen.  

  1.6. Was ist die größte Zahl in dem Vektor `temp_januar`?

***
### 2. Strings  
  2.1. Erstellen Sie eine Zeichenkette/String `greeting`, die den folgenden Text enthällt: 

  ```r
  greeting = "Mein Name ist... Ich mag Käse."
  ```
  2.2. Ändern sie die String zu Großbuchstaben. 

  2.3. Kürzen Sie die String zu "Mein Name ist" (Tipp: `substr()`) und fügen Sie ihren Namen hinzu (Tipp: `paste()`). 

  2.4. Nun teilen Sie die Begrüßung in einzele Wörter und speichern Sie die Ausgabe in der Variable `greeting_split`. 

***
### 3. Dates  
  3.1. Sie erhalten einen Vektor mit Daten im String-Format (s. unten). Ändern Sie den Format zu Datum. 

  ```r
  daten_als_string = c("01.03.2021", "28.10.2021", "21.10.2021", "11.11.2021")
  ```

  3.2. Speichern Sie die Daten in einer neuen String-Variable `dates` im Format mit ausgeschribenen Monat und abgekürztem Jahr: z.B. "Mai-21" 

***
### 4. Dataframes  
  4.1. Laden Sie den Datensatz `mtcars` (`mtcars` ist in R automatisch dabei)

  4.2. Wie viele Zeilen und wie viele Spalten hat der Datensatz? (Tipp: schauen Sie nicht im Environment nach, sondern verwenden Sie eine Funktion)

  4.3. Wie viele Zylinder haben die enthaltenen Fahrzeuge im Durchschnitt? (Zylinder: cyl)

  4.4. Erstellen Sie einen neuen Datensatz `cars_short`, der lediglich die Variablen mpg und hp enthält.

***
### 5. EXTRA 

  5.1. Beschreiben Sie in eigenen Worten, was unten in jeder Zeile passiert. 

  5.2. Was bedeutet das Resultat der letzten Codezeile? 

  5.3. Schauen Sie sich hierzu an, was passiert, wenn Sie `above_average` in einen numerischen Vektor umwandeln. Warum passiert das? 

```r
values = c(1.2, 1.3, 0.8, 0.7, 0.7, 1.5, 1.1, 1.0, 1.1, 1.2, 1.1)
average = mean(values)
above_average = values > average
sum(above_average) / length(values)
```

## Happy coding!  

[Lösungen](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/r_code/l%C3%B6sungen_variablen.md)
