Bitte lösen Sie dieses Aufgabenblatt 2 in Zweier-Gruppen und laden Sie Ihre Lösung (eine R.-Datei) bis 23.11 auf Stud.IP hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. Happy Coding!

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.

## Aufgabe 1: Daten laden (10 Pkt)

Laden Sie die Datei `RT_D_Small.xlsx` von Stud.IP in Ihr Projektverzeichnis herunter und lesen Sie den Datensatz in R ein. Bei dieser Datei handelt es sich um Posts von der Facebook-Seite RT Deutsch.  

Lassen Sie sich die Anzahl an Posts sowie die Anzahl der erhobenen Variablen über die entsprechenden Befehle in R ausgeben. 

Gucken Sie sich die Daten mittels `glimpse()` an. 

## Aufgabe 2: Daten modifizieren und speichern (30 Pkt)

Erstellen Sie einen Teildatensatz, der:

* die Variable `id` nicht enthält 
* nur Posts ohne Video enthält (`video = 0`)
* nur die Variablen `date`, `post_link`, `video`, `text` sowie alle Facebook-Metriken enthält
* eine neue Variable `total_emotions` enthält, in der für jeden Post die Gesamtzahl aller Reactions (hahas, likes, sads, etc.) angegeben ist
* nur Posts mit mehr als 50 Likes enthält
* wo der Variablenname `text` in `post_text` umcodiert wird
* keine fehlenden Werte bei den Shares enthällt (wählen Sie zwischen einer der besprochenen Strategien für die Behandlung von fehlenden Werten)
* wo die Posts nach Likes aufsteigend sortiert sind 

Als letztes, speichern Sie bitte diesen Teildatensatz als CSV-Datei.

## Aufgabe 3: Daten analysieren und umstrukturieren (10 Pkt) 

Verwenden Sie wieder den Datensatz aus der Datei `RT_D_Small.xlsx`. 

* Wie viele Likes haben die Posts aus dem Datensatz im Durchscnitt bekommen? Wie sieht es mit dem Median aus? 
* Welches Post hat die meisten Likes bekommen?
* Welches Post mit Video (`video = 1`) hat die meisten Likes bekommen?
* Berechnen Sie die durchschnittliche Anzahl an Kommentaren und die Standardabweichung für Posts mit Video und ohne Video. Verwenden Sie dafür `group_by()`
* Wie viele Fälle hat jede Gruppe? 
* Wählen Sie nur die Variablen (Spalten) aus, die den Buchstaben "i" in den Namen enthalten. 


## Aufgabe 4: Der Pipe-Operator `%>%` (10 Pkt)

Lösen Sie die Übungsaufgabe 2 erneut, aber verwenden Sie Pipes, um den Code lesbarer und mit weniger redundanten Zwischenobjekten zu gestalten.

## Aufgabe 5: Datensätze zusammenfügen (20 Pkt)

Sie haben zwei Datensätze `born` und `died`: 

```r
born <- tibble(
  name = c("Moe", "Larry", "Curly", "Harry"),
  year_born = c(1887, 1902, 1903, 1964),
  place_born = c("Bensonhurst", "Philadelphia", "Brooklyn", "Moscow")
)

died <- tibble(
  name = c("Curly", "Moe", "Larry"),
  year_died = c(1952, 1975, 1975)
)
```

Fügen Sie die zwei Datensätze mit Hilfe von `inner_join()`, `full_join()`, `left_join()` und `right_join()` zusammen und beschreiben Sie die Unterschiede in den Datensätzen nach der Methode der Zusammenfügung. 

## Aufgabe 6: Daten bereinigen (20 Pkt)

Hier ist ein Datensatz, der etwas Bereinigung braucht.

* Nutzen Sie die bisher erlernten Fähigkeiten, um aus den Daten einen *tidy*-Datensatz zu machen (wenden Sie mindestens 5 Veränderungen an).

```r
animal_friends <- tibble(
  Names = c("Francis", "Catniss", "Theodor", "Eugenia"),
  ich_brauche_einen_namen = c("Dog", "Cat", "Hamster", "Rabbit"),
  Sex = c("m", "female", "m", "f"),
  VaCCinated = c("yes", "0", "0", "yes"),
  a_opterr = c("me", "me", "me", "me"), # lösche mich
  `Age/Adopted/Condition` = c("8/2020/Very Good", "13/2019/Wild", "1/2021/Fair", "2/2020/Good") # benutze separate()
) 
```

* Als nächstes, wandeln Sie den bereinigten Datensatz in das *Long*-Format um.

