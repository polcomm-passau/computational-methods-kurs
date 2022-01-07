# R Einführung

-   [R und RStudio](#R-vs.-RStudio)
-   [4 Fenster von RStudio](#4-Fenster-von-RStudio )
    -   [Konsole](#konsole)
    -   [Skripte](#skripte)
    -   [Environment](#environment)
    -   [Files](#files)
-   [Übungsaufgaben](#übungsaufgaben)

# R vs. RStudio

Den Unterschied zwischen R und RStudio kann man sich so vorstellen, dass RStudio ein Auto und R der Motor drin ist. RStudio ist also eine IDE (**I**ntegrated **D**evelopment **E**vironment) oder eine graphische Benutzerobefläche, die die Arbeit mit R erleichert. RStudio hilft den R-Code zu schreiben, spreichern und öffnen. Es bietet Syntaxhervorhebungen, Autovervollständigungen und vieles mehr. 

# 4 Fenster von RStudio 

Die Benutzeroberfläche von RStudio ist in vier wichtigsten Fenster (auf English *Panes*) aufgeteilt - Konsole, Skripte, Environment und Files. 

![R_Layout](https://user-images.githubusercontent.com/17723168/138287411-4c42417f-b8b3-482f-b385-8a7bf72cd702.png)


## Konsole 

Die Konsole ist der Motor von RStudio. Hier wird der Code ausgeführt und hier kommen die Ergebnisse raus. Zum Beispiel, versuchen wir eine einfache Berechnung in R auszuführen. Dafür geben wir `2+2` in der Konsole ein und führen sie mit `ENTER` aus. Als Ergebniss kommt `4` raus. 

![Konsole_Ausgabe](https://user-images.githubusercontent.com/17723168/138288129-ceea9987-4c32-4a26-92f6-a8a6c5ec5c31.png)

Prinzipiell könnten wir alle unsere Arbeitsschritte über die Konsole ausführen. Das ist in der Praxis aber wenig sinnvoll, da wir normallerweise längere und mehrere Befehle hintereinander ausführen und diese auch festhalten möchten. Wir arbeiten daher mit Skript-Dateien.

## Skripte

Um eine neue Skript-Datei zu öffnen, clicken wir entweder auf *File - New File - R-Script*, gehen auf den Plus-Symbol in der linken Ecke ![Skript_Symbol](https://user-images.githubusercontent.com/17723168/138289753-b2d55725-330d-4883-bb5f-063251b0bb15.png) oder verwenden die Tastenkombination `Strg/Cmd + Shift + N`. 

Ein neuer Skript, der erstellt wird, heißt normallerweise *Untitled 1*. Hier können wir nun unseren R-Code schreiben und anschließend ausführen.

```r
2+2
3+3
```

Um eine einzelne Befehlstaste auszuführen, verwenden wir die Tastenkombination `Strg/Cmd + ENTER`. Um den ganzen Skript mit allen drin erhaltenen Zeilen auszuführen, drücken wir `Strg/Cmd + Shift + ENTER`.  

```r
#Eingabe: 
2+2
3+3
```

```r
#Ausgabe in der Konsole: 
[1] 4
[1] 6
```

Längere Skripte werden schnell unübersichtlich. Oft vergisst man auch, was der Code eigentlich macht oder machen sollte. Deswegen sollte man den geschriebenen Code immer mit sinvollen Kommentaren versehen. Ein Kommentar in R beginnt mit einem Hashtag `#`.

```r
#Ich bin ein Kommentar. 
```
Kommentarzeilen werden vom R nicht ausgeführt (sonst führt der Rechner den Code immer Zeile für Zeile aus und erwartet in jeder Zeile einen fehlerfreien R-Code. Sonst gibt es eine Fehlermeldung. Kommentarzeilen werden dabei ignoriert). 

Um einen Skript abschließend zu speichern, clicken wir entweder auf *File - Save* oder verwenden die Tastenkombination `Strg/Cmd + S`. R-Skripte können beliebig benannt werden und erhalten die Dateiendung `.R`.

## Environment 

*Environment* (oben rechts im Bildschirm) in RStudio ist der Ort, wo die Objekten (z.B. Variablen und Daten), mit denen wir aktuell arbeiten, gespeichert bleiben. In dem Beispiel unten haben wir eine Variable `x` angelegt und ihr den Wert `10` vergeben. Außerdem haben wir eine Tabelle (oder Datensatz) `tabelle_mit_autos` initialisiert. 

```r
x = 10
tabelle_mit_autos = mtcars 
```

Unser *Environment* sieht dann so aus: 

![Environment](https://user-images.githubusercontent.com/17723168/138297729-d76a19e4-30e5-49d0-821c-e6ea56368620.png)

## Files 

Der rechte untere Bildschirmbereich in RStudio zeigt einen Dateibrowser (*Files*) an, der das aktuelle Arbeitsverzeichnis zeigt. Standardmäßig wird `Home` als das aktuelle Arbeitsverzeichnis ausgewählt. Da das aber sehr unübersichtlich ist (und später unpraktisch), bietet es sich an (und das empfehlen wir sehr!) in RStudio mit Projekten zu arbeiten. 

Um einen neunen Projekt anzulegen, gehen wir auf *File - New Project..*. Danach erscheint das folgende Fenster: 

![New_project_create](https://user-images.githubusercontent.com/17723168/138303448-ffcd37d8-fe02-469d-89d4-eb797f5a2099.png)

Hier wählen wir *New Directory - New Project - (Wählen den Ordner wo wir das Projekt anlegen wollen und geben einen Namen für das Projekt ein) - Create Project*. In dem Beispiel lege ich das Projekt *Teaching_R* auf meinem *Desktop* an: 

![Create_new_project](https://user-images.githubusercontent.com/17723168/138305709-153f9490-8e80-4d47-bd4a-0be0bcc37004.png)


Man kann mehrere Projekte auf einem Rechner gleichzeitig haben und um zwischen Projekten zu springen kann man in der rechten oberen Ecke auf den Symbol ![Project_symbol](https://user-images.githubusercontent.com/17723168/138304896-d9b22ce3-1f3d-4c31-8116-dd73f66abbd4.png) gehen. Dort werden alle angelegten Projekte aufgelistet. 
 
# Übungsaufgaben

1. Öffnen Sie RStudio und führen Sie ein paar simple Berechnungen in der Konsole durch.
***
2. Erstellen Sie ein Projekt in dem Sie in diesem Semester arbeiten werden. Sie können das Projekt auch in Untersitzungen/Wochen gliedern. 
***
3. In dem Projekt erstellen Sie eine neue Skriptdatei und speichern Sie diese unter einem sinnvollen Namen. 
***
4. Rechnen Sie: 
    +   Wie viele Wochen hat ein Jahr mit 365 Tagen?  
    +   Wie viele Sekunden hat ein Tag? 
    +   Fügen Sie vier weitere beliebige Berechnungen (z.B., mit +, -, ^) hinzu. 
    Gliedern Sie die Skriptdatei durch einige Kommentare.





