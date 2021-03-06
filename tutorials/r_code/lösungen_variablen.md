### 1. Vektoren  

  1.1. Erstellen Sie einen Vektor mit den durchschnittlichen Höchsttemperaturen im Januar für Peking, Lagos, Paris, Rio de Janeiro, San Juan und Toronto. Die entsprechenden    Temperaturen sind 35, 88, 42, 84, 81 und 30 Grad Fahrenheit. Nennen Sie die Variable `temp_january`.  

```r
temp_january = c(35, 88, 42, 84, 81, 30)
  ```
  1.2. Erstellen Sie nun einen Vektor mit den Städtenamen und nennen Sie den Vektor `city`.  
```r
city = c("Peking", "Lagos", "Paris", "Rio de Janeiro", "San Juan","Toronto")
  ```
  1.3. Verwenden Sie die Namensfunktion, um die Temperaturdaten der entsprechenden Stadt zuzuordnen.  
```r
names(temp_january) = city
  ```
  1.4. Verwenden Sie die Operatoren `[` und `:`, um auf die Temperatur der ersten drei Städte in dem Vektor zuzugreifen.  
```r
temp_january[1:3]
  ```
  1.5. Verwenden Sie den Operator `[`, um auf die Temperatur von Paris und San Juan zuzugreifen.  
```r
temp_january[c("Paris", "San Juan")]
  ```
  1.6. Was ist die größte Zahl in dem Vektor `temp_januar`?
```r
max(temp_january)
  ```
***
### 2. Strings  
  2.1. Erstellen Sie eine Zeichenkette/String `greeting`, die den folgenden Text enthällt: 

  ```r
  greeting = "Mein Name ist... Ich mag Käse."
  ```
  2.2. Ändern sie die String zu Großbuchstaben. 
```r
toupper(greeting)
```

  2.3. Kürzen Sie die String zu "Mein Name ist" (Tipp: `substr()`) und fügen Sie ihren Namen hinzu (Tipp: `paste()`). 
```r
g_kurz = substr(greeting, 1,13)
g_kurz = paste(g_kurz, "Daria")
```
  2.4. Nun teilen Sie die Begrüßung in einzele Wörter und speichern Sie die Ausgabe in der Variable `greeting_split`. 
```r
greeting_split = strsplit(g_kurz, " ")
```

***
### 3. Dates  
  3.1. Sie erhalten einen Vektor mit Daten im String-Format (s. unten). Ändern Sie den Format zu Datum. 

  ```r
  daten_als_string = c("01.03.2021", "28.10.2021", "21.10.2021", "11.11.2021")
  daten_geändert = as.Date(daten_als_string, format = "%d.%m.%Y")
  ```

  3.2. Speichern Sie die Daten in einer neuen String-Variable `dates` im Format mit ausgeschribenen Monat und abgekürztem Jahr: z.B. "Mai-21" 
```r
daten  = as.character(daten_geändert, format = "%B-%y")
```
***
### 4. Dataframes  
  4.1. Laden Sie den Datensatz `mtcars` (`mtcars` ist in R automatisch dabei)

  4.2. Wie viele Zeilen und wie viele Spalten hat der Datensatz? (Tipp: schauen Sie nicht im Environment nach, sondern verwenden Sie eine Funktion)

  4.3. Wie viele Zylinder haben die enthaltenen Fahrzeuge im Durchschnitt? (Zylinder: cyl)

  4.4. Erstellen Sie einen neuen Datensatz `cars_short`, der lediglich die Variablen mpg und hp enthält.
```r
dim(mtcars)
mean(mtcars$cyl)
cars_short = mtcars[,c("mpg", "hp")]
cars_short <- data.frame(mtcars$mpg, mtcars$hp) #alternative
```
***
### 5. EXTRA 

  5.1. Beschreiben Sie in eigenen Worten, was unten in jeder Zeile passiert. 

  5.2. Was bedeutet das Resultat der letzten Codezeile? 

  5.3. Schauen Sie sich hierzu an, was passiert, wenn Sie `above_average` in einen numerischen Vektor umwandeln. Warum passiert das? 

```r
values = c(1.2, 1.3, 0.8, 0.7, 0.7, 1.5, 1.1, 1.0, 1.1, 1.2, 1.1) #Ein numerischer Vektor values wird erstellt
average = mean(values) # Mittelwert von dem Vektor ausgerechnet
above_average = values > average # above_average ist ein logischer Vektor, der für jedes Element in values die Prüfung enthällt ob das Element größer als der Mittelwert ist
sum(above_average) / length(values) # Wie viel % der Elemente aus dem Vektor values sind über den Durchschnitt?  
```
