Bitte lösen Sie dieses Aufgabenblatt 2 in Zweier-Gruppen und laden Sie Ihre Lösung (eine R.-Datei) bis 23.11 auf Stud.IP hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. Happy Coding!

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.

## Aufgabe 1: Daten laden (5 Pkt)

Laden Sie die Datei `facebook_europawahl.csv` von Stud.IP in Ihr Projektverzeichnis herunter und lesen Sie den Datensatz in R ein. Bei dieser Datei handelt es sich um ...

Lassen Sie sich die Anzahl an Posts sowie die Anzahl der erhobenen Variablen über die entsprechenden Befehle in R ausgeben. 

Then take a look a look at it using `glimpse`. 

## Aufgabe 2: Daten modifizieren und speichern (20 Pkt)

Erstellen Sie einen Teildatensatz, der:

* die Variable ID nicht enthält 
* nur Posts der aktuell im Bundestag vertretenen Parteien enthält (CDU, CSU, SPD, FDP, Linke, Grüne, AfD); Tipp: Betrachten Sie vorab die Schreibweise der Parteien (bzw. deren Facebook-Accounts)
* nur die Variablen party, timestamp, type sowie alle Facebook-Metriken enthält
* eine umbenannte Variable x enthält
* eine neue Variable total_count enthält, in der für jeden Post die Gesamtzahl der Kommentare, Shares und Reactions angegeben ist

Speichern Sie diesen Teildatensatz als CSV-Datei.

Danach: 

* Berechnen Sie das mittlere Alter und die Standardabweichung für beide Geschlechter. Verwenden Sie group_by()
* Viele viele Fälle hat jede Gruppe? 

## Aufgabe 3: Der Pipe-Operator `%>%` (10 Pkt)

Lösen Sie die Übungsaufgabe 2 erneut (ohne den Datensatz zu speichern), aber verwenden Sie Pipes, um den Code lesbarer und mit weniger redundanten Zwischenobjekten zu gestalten.

## Aufgabe 4

Only include columns that contain "mm" in the variable name.

## Aufgabe 5 (20 Pkt)

Below is a dataset that needs some cleaning.

Use the skills that you have learned so far to turn the data into a tidy dataset.

```r
animal_friends <- tibble(
  Names = c("Francis", "Catniss", "Theodor", "Eugenia"),
  TheAnimals = c("Dog", "Cat", "Hamster", "Rabbit"),
  Sex = c("m", "f", "m", "f"),
  Vaccinated = c("yes", "0", "0", "yes"),
  a_opterr = c("me", "me", "me", "me"),
  `Age/Adopted/Condition` = c("8/2020/Very Good", "13/2019/Wild", "1/2021/Fair", "2/2020/Good")    
) 
```

If you are done, turn the final data into long format.

