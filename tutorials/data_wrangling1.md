* Willkommen in *tidyverse*-Universum 
* `select()`, `filter()`, `rename()`, `mutate()`, 
* `group_by()`, `summarize()`, `arrange()`
* Der Pipe-Operator `%>%`: Verketten mehrerer Operationen
* Fehlende Werte
* Long vs. Wide Data
* Daten zusammenfügen


## Willkommen in Tidyverse-Universum 

![tidyverse-default](https://user-images.githubusercontent.com/17723168/142609665-47266669-99a0-48cb-bb8c-392950b5df54.png)

## Was ist `tidyverse`?

Tidyverse beschreibt sich selbst:

> The tidyverse is an opinionated **collection of R packages** designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

![data-science-workflow](https://user-images.githubusercontent.com/17723168/142609726-df3c439d-5e75-471b-b2b1-797d594996a6.png)

## Relevante Packages aus dem *tidyverse*-Package:

* `tibble` : Dataframes
*   `readr`/`readxl`: Daten einlesen
*   `tidyr` : Fehlende Werte und Umstrukturierung von Daten 
*   `dplyr` : Datenbereinigung und Manipulation 
* `stringr`: Arbeiten mit Strings
*   `ggplot2` : Visualisierung
* `lubridate`: Arbeiten mit Datum 
* und viele mehr...


```r
# install.packages("tidyverse")

library(tidyverse)
```

# Wiederholung: `select()`, `filter()`, `rename()`, `mutate()`

Wir arbeiten heute mir zwei Datensätzen: 




```r
d1 # Titanic Datensatz -> alle meine Beispiele 

d2 # Fiktiver Datensatz mit 50 Studierenden und deren Medienzufriedenheit -> Datensatz für Eure Übungen in der Sitzung
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

## Wichtigsten Funktionen für Datenmanagment


*   `select()` : Auswählen von Variablen (spaltenweise)
*   `filter()` : Filtern von Variablen (zeilenweise)
* `rename()` : Spalten Umbenennen
* `mutate()` : Erzeugen neuer Variablen
* `group_by()` : Gruppieren von Variablen
* `summarize()` : Zusammenfassen von Variablen  
* `arrange()` : Sortieren des Datensatzes
 
> Alle Funktionen aus dem *tidyverse*-Package bekommen eine Tibble-Dataframe als erstes Argument und geben eine Tibble-Dataframe zurück. 

### `select()`

![select](https://user-images.githubusercontent.com/17723168/142610091-e06bebdd-8bf6-42e5-bf0c-63a1fd5d9908.png)

```r

```
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
![filter](https://user-images.githubusercontent.com/17723168/142610264-84cdcbbe-1121-4639-b3cc-02a7d6460ea3.png)

```r
filter(d, col_name == "col-content")
filter(d1, Sex == "female" & Survived == 1) # Wähle nur bestimmte Zeilen
```

### `rename()`

```r
rename(d, new_name = old_name)
```
Theoretisch geht Variablen umbenennen auch mit der Funktion `select()`, aber übersichtlicher ist `rename()`.

```r
rename(d1, Class = Pclass)
```


### `mutate()`

Neue Varibalen (Spalten) aus anderen Variablen erzeugen (oder vorhandene Variablen verändern):

```r
mutate(d, 
      new_column1 = old_column1 + old_column2,
      new_column2 = str_replace_all(old_column3, "string_old", "string_new")
      )

```
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

```r
group_by(d, column)
```

```r
groups = group_by(d1, Survived)
summarize(groups, 
          mean_age = mean(Age, na.rm = TRUE), 
          sd_age = sd(Age, na.rm = TRUE),
          mean_class = mean(Pclass, na.rm = TRUE)
          )
```
Wir können auch nach mehreren Variablen gruppieren:

```r
groups = group_by(d1, Survived, Sex)
summarize(groups, 
        mean_age = mean(Age, na.rm = TRUE),
        number_people = n() # Zähle wie viele Fälle in jeder Gruppe
        )
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
 
