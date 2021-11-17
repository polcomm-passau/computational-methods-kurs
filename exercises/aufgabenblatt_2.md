Bitte lösen Sie dieses Aufgabenblatt 2 in Zweier-Gruppen und laden Sie Ihre Lösung (eine R.-Datei) bis 23.11 auf Stud.IP hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. Happy Coding!

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.

## Aufgabe 1: Daten laden (5 Pkt)

Laden Sie die Datei `RT_D_Small.xlsx` von Stud.IP in Ihr Projektverzeichnis herunter und lesen Sie den Datensatz in R ein. Bei dieser Datei handelt es sich um Posts von der Facebook-Seite RT Deutsch.  

Lassen Sie sich die Anzahl an Posts sowie die Anzahl der erhobenen Variablen über die entsprechenden Befehle in R ausgeben. 

Gucken Sie sich die Daten mittels `glimpse()` an. 

## Aufgabe 2: Daten modifizieren und speichern (20 Pkt)

Erstellen Sie einen Teildatensatz, der:

* die Variable id nicht enthält 
* nur Posts ohne Video enthält (video = 0)
* nur die Variablen date, post_link, video, text sowie alle Facebook-Metriken enthält
* eine neue Variable total_emotions enthält, in der für jeden Post die Gesamtzahl der aller Reactions (hahas, likes, sads, etc.) angegeben ist
* nur Posts mit mehr als 50 Likes enthält
* wo die Variable text in post_text umcodiert wird
* keine fehlenden Werten bei den Shares enthällt (wähle zwischen einer der besprochenen Strategien für die Behandlung von fehlenden Werten)

Speichern Sie diesen Teildatensatz als CSV-Datei.


## Aufgabe 3: Daten umstrukturieren (10 Pkt) 

Verwenden Sie wieder den Datensatz aus der Datei `RT_D_Small.xlsx`. 

* Berechnen Sie die durchschnittliche Anzahl an Kommentaren und die Standardabweichung für Posts mit Video und ohne Video. Verwenden Sie dafür `group_by()`
* Wie viele Fälle hat jede Gruppe? 
* Wählen Sie nur Variablen (Spalten), die den Buchstaben i in den Namen enthalten. 


## Aufgabe 4: Der Pipe-Operator `%>%` (10 Pkt)

Lösen Sie die Übungsaufgabe 2 erneut, aber verwenden Sie Pipes, um den Code lesbarer und mit weniger redundanten Zwischenobjekten zu gestalten.

## Aufgabe 5 (20 Pkt)

Hier ist ein Datensatz, der etwas Bereinigung braucht.

Nutzen Sie die bisher erlernten Fähigkeiten, um aus den Daten einen *tidy*-Datensatz zu machen.

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

Wenn Sie fertig sind, wandeln Sie den bereinigten Datensatz in das *Long*-Format um.

