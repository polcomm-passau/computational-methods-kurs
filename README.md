# Automatisierte Datensammlung und Analyse mit R

*Lehrstuhl für Politische Kommunikation, Universität Passau* 

Dozenten: Prof. Florian Töpfl (<florian.toepfl@uni-passau.de>), Daria Kravets (<daria.kravets@uni-passau.de>)

Syllabus für den Kurs im WS21/22 @UniPassau finden sie [hier (Stand 28.11.2021)](https://github.com/polcomm-passau/computational-methods-kurs/files/7614495/2021_11_03_Seminarplan_Datensammlung%2BUebung_neu.pdf).

  
Dies ist ein ***Work-in-Progress*** und wird laufend aktualisiert.

Themen & Materialien 
---------------

Hier finden Sie diverse Kursmaterialien für die Lehre von Automatisieren Datensammlung und Analyse mit R. Wir freuen uns sehr über Ihr Feedback oder Verbesserungsvorschläge!

## Einführung in R  

| Nr.  | Thema       | Folien    |R-Code  |
| -----|:------------| :---------|:-------|
| 1    | [Installation von R & RStudio](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/installation.md)| |
| 2    | [Einführung ins R und RStudio](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/basics_R_woche1.md)| [Folien 1](https://github.com/polcomm-passau/computational-methods-kurs/files/7390878/Sitzung.1_.WU.Programmieren.fur.KoWi.pdf)| |
| 3    | [Variablen und Variablentypen in R](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/variablen.md) |  [Folien 2](https://github.com/polcomm-passau/computational-methods-kurs/files/7441299/Sitzung.2_.WU.Programmieren.fur.KoWi.pdf) | [R-Code 2.R](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/r_code/variables.R) | [Basics R Cheatsheet](https://github.com/rstudio/cheatsheets/blob/main/base-r.pdf)              |
| 4    | [Schleifen und Funktionen](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/loops_and_functions.md) | [Folien 3](https://github.com/polcomm-passau/computational-methods-kurs/files/7503813/Sitzung.3.-.R_Schleifen.Bedingungen.Funktionen.pdf)| [R-Code 3.Rmd](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/r_code/Illustration_Programmieren%20von%20Schleifen%20%26%20Funktionen.Rmd)| 
| 5    | [Packages](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/packages.md) | [Folien 4](https://github.com/polcomm-passau/computational-methods-kurs/files/7520889/Sitzung.3_.WU.Programmieren.fur.KoWi.pdf)| [R-Code 4.R](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/r_code/%C3%BCbung_3.R)  | 
| 6    | [Fehlersuche und Best Practices](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/debugging.md) | | |

* [R Basics CheatSheet](https://github.com/rstudio/cheatsheets/blob/main/base-r.pdf)

## Data Wrangling

| Nr.  | Thema| Folien | Funktionen |
| -----|:------------| :------|:-------|
| 1    | [Daten laden und speichern](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/loading_data.md) |        | `readr()`, `readxl()`   |
| 2    | [Datensätze bearbeiten](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/data_wrangling1.md)| [Folien 2](https://colab.research.google.com/drive/1zxPN0jXArKoqhEXK-oebTKmA0_0QxFA_?usp=sharing)| `select()`, `filter()`, `mutate()`, `rename()` | 
| 3    | [Arbeiten mit Texten](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/data_wrangling2.md)| [Google Colab Folien 3](https://colab.research.google.com/drive/1qkkMRthvHTQphZ2Akk-yYiaMue5als-0?usp=sharing)|Regex und `stringr`|

## Datensammlung

| Nr.  | Thema       | Folien | Beispiel  |
| -----|:------------| :------|:----------|
| 1    | [APIs](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/api.md)  | [Folien 1](https://colab.research.google.com/drive/1bxOfODWV5d5oiV6Y5KKTFpiI5gJ3qbUG?usp=sharing)| Twitter API |
| 2    | [Youtube API](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/youtube_api.md)    | [Folien 2](https://colab.research.google.com/drive/1cfUwBQAGPuhrlWeEvQwMkNPv__5dl7ne?usp=sharing)       | Youtube API  |
| 3    | [Web Scraping](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/web_scraping.md)| [Folien 3](https://colab.research.google.com/drive/1bIJ7fU5KzvDCDAc0Fiqmp5PaP_wNg_Qc?usp=sharing)     |           |
| 4    | [RSelenium](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/tutorials/RSelenium.md)| [Folien 4](https://colab.research.google.com/drive/1Uoj-Jdjg0IWrhcVHDD2VbgLvcKBNCWis?usp=sharing)     | Dynamische Webseiten          |

## Scaling Up

| Nr.  | Thema       | Folien | Beispiel  |
| -----|:------------| :------|:----------|
| 1    | Datenbanken |        |           |
| 2    | Aufgabenautomatisierung |        |     Crontab (Linux/MacOS), Windows Task Scheduler      |
| 3    | Server Setup |       | AWS EC2 Instance |


## Übungen 

| Nr.  | Aufgabenblatt     | Abgabe|
| -----|------------------:|------:|
|    1 | [Aufgabenblatt 1](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/exercises/aufgabenblatt_1.md)| 16.11.2021|
|    2 | [Aufgabenblatt 2](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/exercises/aufgabenblatt_2.md)| 23.11.2021|
|    3 | [Aufgabenblatt 3](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/exercises/aufgabenblatt_3.md)| 30.11.2021|
|    4 | [Aufgabenblatt 4](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/exercises/aufgabenblatt_4.md)| 14.12.2021|
|    5 | [Aufgabenblatt 5](https://github.com/polcomm-passau/computational-methods-kurs/blob/main/exercises/aufgabenblatt_5.md)| 21.01.2022|

