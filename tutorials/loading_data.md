# Daten in R laden

## CSV-Dateien

### `readr`

Um CSV-Dateinen in R zu laden eignet sich am besten der externe Package [readr](https://readr.tidyverse.org/) aus dem tidyverse Universum. 

Zuerst müssen Sie das Package *readr* einmal installiert haben und danach aktivieren:  

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

* `read_csv("file.csv", col_names = FALSE)` -> Keine Spalten-Namen
* `read_csv("file.csv", col_names = c("x", "y", "z"))` -> Neue Spaltennamen vergeben


## Excel-Dateien

### `readxl`

Eine Excel-Datei (xls und xlsx) laden: 

```r
read_excel()
```
