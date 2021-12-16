* [Willkommen in *tidyverse*-Universum](#Willkommen-in-Tidyverse-Universum)
    * [`select()`, `filter()`, `rename()`, `mutate()`](#`select()`,-`filter()`,-`rename()`,-`mutate()`)
    * [`group_by()`, `summarize()`, `arrange()`](#Wichtigsten-Funktionen-für-Datenmanagment)
* [Der Pipe-Operator `%>%`](#Der-Pipe-Operator-%>%)
* [Fehlende Werte](#Fehlende-Werte)
* [Long vs. Wide Data](#Long-vs-Wide-Data)
* [Datensätze zusammenfügen](#Datensätze-zusammenfügen)
* [Übungsaufgaben](#Übungsaufgaben) 
* [Lösungen](#Lösungen) 


## Willkommen in Tidyverse-Universum 

![tidyverse-default](https://user-images.githubusercontent.com/17723168/142609665-47266669-99a0-48cb-bb8c-392950b5df54.png)

## Was ist `tidyverse`?

Tidyverse beschreibt sich selbst:

> The tidyverse is an opinionated **collection of R packages** designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

![data-science-workflow](https://user-images.githubusercontent.com/17723168/142609726-df3c439d-5e75-471b-b2b1-797d594996a6.png)

Das schöne an `tidyverse`:

> Alle Funktionen aus dem *tidyverse*-Package bekommen eine Tibble-Dataframe als erstes Argument und geben eine Tibble-Dataframe zurück. 

## Relevante Packages aus dem *tidyverse*-Package:

* `tibble` : Dataframes
*   `readr`/`readxl`: Daten einlesen
*   `tidyr` : Fehlende Werte und Umstrukturierung von Daten 
*   `dplyr` : Datenbereinigung und Manipulation 
* `stringr`: Arbeiten mit Strings
*   `ggplot2` : Visualisierung
* `lubridate`: Arbeiten mit Datum 
* und viele mehr...

Tidyverse installieren (einmalig) und aktivieren (für jeden Sktipt): 

```r
# install.packages("tidyverse")

library(tidyverse)
```

# `select()`, `filter()`, `rename()`, `mutate()`

Wir arbeiten mit zwei Datensätzen: 

```r
d1 # Titanic Datensatz -> alle meine Beispiele 

d2 # Fiktiver Datensatz mit 50 Studierenden und deren Medienzufriedenheit -> Datensatz für Eure Übungen
```

Den Titanic-Datensatz einlesen:
```r
d1 = read_csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv") 
```

Erste Schritte mit einem Datensatz: 

* `nrow()` 
* `ncol()`
* `dim()`
* `glimpse()`
* `head()`
* `tail()`

```r
nrow(d1) # Anzahl Zeilen
ncol(d1) # Anzahl Spalten
dim(d1) # Dimensionen (Spalten x Zeilen)
glimpse(d1) # Struktur des Datensatzes
head(d1) # 6 erste Werte 
tail(d1) # 6 letzte Werte
```

## Wichtigsten Funktionen für Datenmanagment:

*   `select()` : Auswählen von Variablen (spaltenweise)
*   `filter()` : Filtern von Variablen (zeilenweise)
* `rename()` : Spalten Umbenennen
* `mutate()` : Erzeugen neuer Variablen
* `group_by()` : Gruppieren von Variablen
* `summarize()` : Zusammenfassen von Variablen  
* `arrange()` : Sortieren des Datensatzes
 

### `select()`

Wähle die Daten spaltenweise. 

![select](https://user-images.githubusercontent.com/17723168/142610091-e06bebdd-8bf6-42e5-bf0c-63a1fd5d9908.png)

```r
select(d, column1, column2) # keeps columns 1 & 2
select(d, column1:column3)
select(d, -column1) # keeps all columns except for 1
select(d, column1=col1) # renames column1 to col1
```

*Extra:* Um Spalten basierend auf Namensbestandteilen auszuwählen, sind einige Hilfsfunktionen - z. B. `starts_with()`, `ends_with()` und `contains()` - verfügbar.

```r
select(d1, PassengerId, Pclass, Survived, Name, Sex, Age) # Wähle nur bestimmte Spalten
```

### `filter()`

Wähle die Daten zeilenweise.

![filter](https://user-images.githubusercontent.com/17723168/142610264-84cdcbbe-1121-4639-b3cc-02a7d6460ea3.png)

`filter(d, col_name == "col-content")`

```r
filter(d1, Sex == "female" & Survived == 1) # Wähle nur bestimmte Zeilen
```

### `rename()`

Variablen (Spalten) umbenennen. 

`rename(d, new_name = old_name)`

Theoretisch geht Variablen umbenennen auch mit der Funktion `select()`, aber übersichtlicher ist `rename()`.

```r
rename(d1, Class = Pclass)
```


### `mutate()`

Neue Varibalen (Spalten) aus anderen Variablen erzeugen (oder vorhandene Variablen verändern):


`mutate(d, 
      new_column1 = old_column1 + old_column2,
      new_column2 = str_replace_all(old_column3, "string_old", "string_new")
      )`

```r
mutate(d1, 
      Age_Today = Age + 108, # Titanic ist genau vor 108 Jahren versunken
      Survived = str_replace_all(as.character(Survived), "1", "yes"), # Vorhandene Variable Survived verändern -> s. auch Funktionen recode() und ifelse()
      Survived = str_replace_all(as.character(Survived), "0", "no"),
      Sex = toupper(Sex),       
      )
 ```
 
 # Der Pipe-Operator `%>%`
 
Der `%>%` Operator wird zum Verketten von mehreren Befehlen oder Funktionen als Abkürzung verwendet. Wenn man die Funktionsweise von `%>%` einmal verstanden hat, ist die Verwendung ganz einfach. 

Nehmen wir an `f()`, `g()` und `h()` seien Funktionen, dann gilt:

```r
x %>% f() 

# ist äquivalent zu

f(x)
```

Wenn die Funktion `f()` mehrere Argumente einnimmt, dann gilt:
```r
x %>% f(y)

# ist äquivalent zu

f(x, y) # x auf erster Stelle
```

Wenn wir der Reihe nach `f()`, `g()` und `h()` anwenden, dann gilt:
```r
x %>% f() %>% g() %>% h()

# oder schöner

x %>%
  f() %>%
  g() %>%
  h()

# ist äquivalent zu

h(g(f(x))) # verschachtelte Befehle sehen nicht gut aus!
```
Wir müssen das Objekt x nicht immer als erstes Argument weitergeben; wir können es an einer beliebigen Stelle verwenden. Dafür brauchen wir den Argument-Platzhalter `.` :

```r
x %>% f(y, .)

# ist äquivalent zu

f(y, x)
```

```r
#Beispiel Titanic-Datensatz

d1 %>%
  select(PassengerId, Pclass, Survived, Name, Sex, Age) %>%
  filter(Pclass <= 2) %>%
  rename(Class = Pclass) %>%
  mutate(Age_Today = Age + 108)
```

> Der `%>%`-Operator in R ist so beliebt, dass er ein eigenes Shortcut im RStudio hat: `Cmd` + `Shift` + `M` (Mac) und `Strg` + `Shift` + `M` (Windows und Linux)

### `group_by()` und `summarize()`

Wenn Sie Ihre Daten (nach Gruppen) aggregieren möchten: 

`group_by(d, column)`


```r
groups = group_by(d1, Survived)
summarize(groups, 
          mean_age = mean(Age, na.rm = TRUE), 
          sd_age = sd(Age, na.rm = TRUE),
          mean_class = mean(Pclass, na.rm = TRUE)
          )
```
```r
# Ausgabe: 

A tibble: 2 × 4
Survived	mean_age	sd_age	    mean_class
<dbl>	<dbl>	<dbl>	<dbl>
0	        30.62618	14.17211	2.531876
1	        28.34369	14.95095	1.950292

```

Wir können auch nach mehreren Variablen gruppieren:

```r
groups = group_by(d1, Survived, Sex)
summarize(groups, 
        mean_age = mean(Age, na.rm = TRUE),
        number_people = n() # Zähle wie viele Fälle in jeder Gruppe
        )
```

```r
# Ausgabe: 

A grouped_df: 4 × 4
Survived	Sex	mean_age	number_people
<dbl>	<chr>	<dbl>	<int>
0	female	25.04688	81
0	male	31.61806	468
1	female	28.84772	233
1	male	27.27602	109

```

### `arrange()`

Datensatz sortieren mit `arrange()`: 

```r
arrange(d, column) # Aufsteigend
arrange(d, desc(column)) # Absteigend
```


```r
arrange(d1, Pclass) 
```

## Andere wichtige Funktionen aus dem *tidyverse*-Package:

* `separate()`

Wir können die `separate()`-Funktion verwenden, um eine Variable in mehrere aufzuteilen:

Dafür sind drei Argumente wichtig:
  - `col` : gibt an, welche Variable (Spalte) aufgeteilt werden soll
  - `sep`: gibt an, durch welches Zeichen die Werte in der Variable geteilt werden sollen
  - `into`: welche Namen sollen die neuen Variablen bekommen

`separate(d, old_column, sep = " ", into = c("column1", "column2"))`

*   `recode()`
*   `count()`

# Fehlende Werte 

Fehlende Werte (Missing Values) werden in R mittels `NA` (not available) markiert. 

```r
mean(c(3,4,NA,6))
```

Fehlende Werte zählen:
```r
sum(is.na(c(3,4,NA,6)))
```

Fehlende Werte ignorieren mit `na.rm=TRUE`:
```r
mean(c(3,4,NA,6), na.rm =TRUE)
```

```r
# Beispiel Titanic-Datensazt: 

#Fehlende Werte in der Variable Age zählen
sum(is.na(d1$Age))

#Übersicht aller fehlenden Werten in allen Variablen (Spalten)
colSums(is.na(d1))

```

Datensätze haben oft fehlende Werte. Beim Behandeln von fehlenden Werten haben wir drei Optionen: 

1. Alle Zeilen entfernen, die `NA` enthalten: `drop_na()`
2. `NA` mit dem letzten oder nächsten vorhandenen Eintrag füllen: `fill()`
3. `NA` durch den Spaltenduchschnitt ersetzen: `replace_na()`

```r
d$column = drop_na(column) # Lösche alle Zeilen mit fehlenden Werten
d$column = fill(column) # default -> nehme den letzten vorhandenen Eintrag ("down"). Alternativen: .direction = "up",  "downup", "updown"
d$column = replace_na(column, mean(column, na.rm=TRUE) # Spaltendurchschnitt

```

# Long vs. Wide Data

Einer der häufigsten Fälle der Umstrukturierung von Datensätzen betrifft das Konvertieren von Wide Data in Long Data und umgekehrt.

*   **Wide Data:**

    -  Mehrere Beobachtungen desselben Wertetyps stehen in einer Zeile in unterschiedlichen Spalten.


Zum Beispiel, betrachten wir einen fiktiven Datensatz, der die Auflagezahlen verschiedener politischer Wochenmagazine beinhaltet: 

```r
wide_tibble = tibble(
  medium       = c("Spiegel", "Stern", "Focus"),
  auflage_2018 = c(708077, 701095, 799999),
  auflage_2019 = c(606037, 603833, 659999),
  auflage_2020 = c(503033, 656565, 520202)
)
wide_tibble 

#Die Auflagen für jedes Magazin und Jahr stehen in einer Zeile, aber unterschiedlichen Spalten. Jedes Magazin kommt nur einmal vor. 
```

```r
# Ausgabe: 

A tibble: 3 × 4
medium	auflage_2018	auflage_2019	auflage_2020
<chr>	<dbl>	<dbl>	<dbl>
Spiegel	708077	606037	503033
Stern	701095	603833	656565
Focus	799999	659999	520202

```

*   **Long Data:**

    - Jede Beobachtung hat eine eigene Zeile.

Der selbe Datensatz mit politischen Wochenmagazinen im *Long*-Format würde so aussehen: 

```r
long_tibble = tibble(
  medium       = c("Spiegel", "Spiegel","Spiegel","Stern", "Stern","Stern","Focus","Focus","Focus"),
  jahr         = c(2018, 2019, 2020,2018, 2019, 2020, 2018, 2019, 2020),
  auflage      = c(708077,606037,503033, 701095,603833, 656565,799999,659999,520202)
)
long_tibble # Jede Auflage hat eine eigene Zeile. 
```
```r
# Ausgabe: 

A tibble: 9 × 3
medium	jahr	auflage
<chr>	<dbl>	<dbl>
Spiegel	2018	708077
Spiegel	2019	606037
Spiegel	2020	503033
Stern	2018	701095
Stern	2019	603833
Stern	2020	656565
Focus	2018	799999
Focus	2019	659999
Focus	2020	520202
```

### Long Data ins Wide transformieren und umgekehrt:

*   `pivot_longer()`
*   `pivot_wider()`


```r
#Wide Data in Long transformieren: 

pivot_longer(wide_tibble, c(auflage_2018, auflage_2019, auflage_2020))

#Schöner ist

pivot_longer(wide_tibble, starts_with("auflage"), names_to = "jahr", values_to = "auflage", names_prefix = "auflage_")

```


```r
# Long Data in Wide transformieren: 

pivot_wider(long_tibble, names_from = jahr, values_from = auflage)

# Schöner ist 

pivot_wider(long_tibble, names_from = jahr, values_from = auflage, names_prefix = "auflage_")

```

# Datensätze zusammenfügen

Datensätze in R zusammenfügen geht mittels `join()`. 

Es gibt mehrere Möglichkeiten Datensätze zusammenzufügen:

*   `full_join(d1, d2)`
*   `inner_join(d1, d2)`
*   `left_join(d1, d2)`
*   `right_join(d1, d2)`

![dplyr-left-join-inner-join-full-join-right-join-cheatsheet-1024x768](https://user-images.githubusercontent.com/17723168/142611502-e08e2802-d390-4095-9f4f-ea4fa858bce1.jpg)

# Übungsaufgaben
## Übungsaufgabe I

Laden Sie den Studenten-Datensatz in R. Gucken Sie sich den Datensatz, deren Werte und Variablen an.

## Übungsaufgabe II

Aus dem Studenten-Datensatz `d2`:
  * Löschen Sie die Spalte X
  * Wählen Sie alle Studenten über 20 Jahre
  * Gucken Sie sich die Variable ??? an und geben Sie ihr einen sinnvollen Namen
  * Fügen Sie eine neue Variable `Durchschnittliches_Vertrauen` hinzu. Die Variable soll als Durchschnitt `Vertrauen_TV`, `Vertrauen_Print`, `Vertrauen_Internet` ausgerechnet werden. 

## Übungsaufgabe III

Lösen Sie die Übungsaufgabe II erneut, aber verwenden Sie Pipes, um den Code lesbarer und mit weniger redundanten Zwischenobjekten zu gestalten.

## Übungsaufgabe IV

Mit Hilfe von `arrange()`, `group_by()` und `summarize()`:

*   Sortieren Sie den Studenten-Datensatz `d2` nach Semester. 
*   Gruppieren Sie die Studierenden nach Studiengang und Geschlecht.
  - Wie viele Studierenden gibt es in jeder Gruppe? 
  - Rechnen Sie den durchschnittlichen Alter für jede Gruppe. 


# Lösungen



```r
#Übungsaufgabe 1
d2 = read_csv("https://raw.githubusercontent.com/polcomm-passau/computational-methods-kurs/main/datasets/Studenten_Datensatz.csv")
```
```r
#Übungsaufgabe 2

# Löschen Sie die Spalte X: select()
select(d2, -X)
# Wählen Sie alle Studenten über 20 Jahre : filter()
filter(d2, Alter > 20)
# Gucken Sie sich die Variable ??? an und geben Sie ihr einen sinnvollen Namen: rename()
rename(d2, Geschlecht = "???")
# Fügen Sie eine neue Variable Durchschnittliches_Vertrauen dazu: mutate()

mutate(d2, 
  Durchschnittliches_Vertrauen = (Vertrauen_TV + Vertrauen_Print + Vertrauen_Internet)/3)
```
```r
#Übungsaufgabe 3
d2 %>%
  select(-X) %>%
  filter(Alter > 20) %>%
  rename(Geschlecht = "???") %>%
  mutate(Durchschnittliches_Vertrauen = (Vertrauen_TV + Vertrauen_Print + Vertrauen_Internet)/3)

```
```r
#Übungsaufgabe 4
# Sortieren Sie den Studenten-Datensatz `d2` nach Semester : arrange()

arrange(d2, Semester)

# Gruppieren Sie die Studierenden nach Studiengang und Geschlecht: group_by() und summarize()

groups = group_by(d2, Studiengang, Geschlecht)
summarize(groups, 
        mean_Alter = mean(Alter), #round extra
        number_Fälle = n() # Zähle wie viele Fälle in jeder Gruppe
        )
```
