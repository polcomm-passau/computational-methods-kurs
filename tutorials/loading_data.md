# Daten in R laden und speichern

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

