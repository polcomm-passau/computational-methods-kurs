# Daten in R laden und speichern

* [CSV-Dateien](#CSV-Dateien)
* [Excel-Dateien](#Excel-Dateien)
* [SPSS-Dateien](#SPSS-Dateien)
* [Dateien aus dem Internet](#Dateien-aus-dem-Internet)
* [Pfad zu Dateien richtig angeben](#Pfad-zu-Dateien-richtig-angeben)



## CSV-Dateien: `readr`

Um CSV-Dateinen in R zu laden eignet sich am besten das externe Package [readr](https://readr.tidyverse.org/) aus dem *tidyverse*-Universum. 

`readr` Installieren/ Aktivieren:

```r
install.packages("readr") # Installieren
library("readr") # Aktivieren
```
Eine CSV-Datei laden: 

```r
# CSV-Datei laden: 
read_csv("file.csv")
```

`readr` unterstützt sieben Einlese-Dateiformate mit sieben `read_` Funktionen:

* `read_csv()`: comma separated (CSV) files
* `read_tsv()`: tab separated files
* `read_delim()`: general delimited files
* `read_fwf()`: fixed width files
* `read_table()`: tabular files where columns are separated by white-space.
* `read_log()`: web log files

#### Nutzvolle `read_`-Argumente

* **Keine Spaltennamen laden:** `read_csv("file.csv", col_names = FALSE)`
* **Neue Spaltennamen vergeben:** `read_csv("file.csv", col_names = c("x", "y", "z"))`

### CSV-Dateien speichern

```r
# CSV-Datei speichern:
write_csv(df, "file.csv") 
```

## Excel-Dateien: `readxl` 

`readxl` Installieren/ Aktivieren:

```r
install.packages("readxl") # Installieren
library("readxl") # Aktivieren
```

Eine Excel-Datei (.xls und .xlsx) laden: 

```r
read_excel("file.xls")
```
## CheetSheet

[data-import.pdf](https://github.com/rstudio/cheatsheets/blob/main/data-import.pdf)

## SPSS-Dateien: `haven`

```r
library(haven)
```

## Pfad zu Dateien richtig angeben

Beim Einlesen von Dateien benötigt R genaue Angaben, wo oder in welchem Ordner es nach der Datei suchen soll. Jede Datei auf dem Computer liegt an einem Ort in der Ordner-Baum-Struktur, identifiziert über den sogenannten *Pfad*.
 
```r
pfad  = "Der/Pfad/zu/meiner/Datei"
```

Von Ordner zu Ordner springen geht mit `/` bei Windows und `\` bei Mac OS und Linux. 

```r
getwd() # Aktuelles Arbeitsverzeichnis prüfen

#Auf meinem Computer wäre die Ausgabe: 

#"C:/Users/kravet01/Documents/Teaching/Programmieren für KoWi/Teachning_R_WS21"
```

Falls der Datensatz sich in dem aktuellen Arbeitsverzeichnis (Ordner) befindet, kann lediglich der Name der Datei angegeben werden. 

```r
read_csv("Studenten_Datensatz.csv") # Beispiel Datensazt "Studenten_Datensatz.csv"
```

Falls die Datei sich aber nicht in dem aktuellen Arbeitsverzeichnis befindet, muss der genaue Pfad zu der Datei angegeben werden (entweder absolut oder relativ): 

* *Absoluter* Pfad fängt auf dem Hauptlaufwerk an (üblicherweise, Laufwerk C://)
* Bei *Relativer* Pfad nimmt R das aktuelle Arbeitsverzeichnis
und geht von dort aus weiter
    - Falls Sie mit Projekten arbeiten, fängt R immer in dem Root-Projektordner zu suchen. 

```r
# Absoluter Pfard Windows: 

read_csv("C:/Users/kravet01/Documents/Teaching/Programmieren für KoWi/datasets/Studenten_Datensatz.csv")

# Mac OS und Linux:

#read_csv("C:\Users\kravet01\Documents\Teaching\Programmieren für KoWi\datasets\Studenten_Datensatz.csv")
```
```r
# Relativer Pfad aus dem Projekt:

read_csv("woche 4/Studenten_Datensatz.csv")
```

*Tipp:* Man kann den Pfad zu jeder Datei sich auch ganz einfach anzeigen lassen. 


Man kann das Arbeitsverzeichnis auch manuell ohne Verwendung von Projekten setzten: 

```r
setwd("Der/Pfad/zu/dem/gewünschten/Arbeitsverzeichnis")
```
