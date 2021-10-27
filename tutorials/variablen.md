# Variablen und Variablentypen in R

- [Variablentypen](#Variablentypen)
  - [Einfache Variablentypen](#Einfache-Variablentypen)
  - [Komplexere Variablentypen](#Komplexere-Variablentypen)
- [Logische Operatoren](#Logische-Operatoren)
- [Variablenbenennung](#Variablenbenennung)
- [Übungen](#Übungen)

# Variablentypen

## Einfache Variablentypen
## Komplexere Variablentypen

# Logische Operatoren

# Variablenbenennung

# Übungen

### 1. Vektoren
1.1. Erstellen Sie einen Vektor mit den durchschnittlichen Höchsttemperaturen im Januar für Peking, Lagos, Paris, Rio de Janeiro, San Juan und Toronto. Die entsprechenden Temperaturen sind 35, 88, 42, 84, 81 und 30 Grad Fahrenheit. Nennen Sie die Variable `temp_january`.  
 
1.2. Erstellen Sie nun einen Vektor mit den Städtenamen und nennen Sie die Variable `city`.  

1.3. Verwenden Sie die Namensfunktion, um die Temperaturdaten der entsprechenden Stadt zuzuordnen.  

1.4. Verwenden Sie die Operatoren `[` und `:`, um auf die Temperatur der ersten drei Städte in dem Vektor zuzugreifen.  

1.5. Verwenden Sie den Operator `[`, um auf die Temperatur von Paris und San Juan zuzugreifen.  

1.6. Was ist die größte Zahl in dem Vektor `temp_januar`?

***
### 2. Strings
2.1. Erstellen Sie eine Zeichenkette/String `greeting`, die den folgenden Text enthällt: 

```r
greeting = "Mein Name ist... Ich mag Käse."
```
2.2. Ändern sie die String zu Großbuchstaben. 

2.3. Kürzen Sie die String zu "Mein Name ist" (Tipp: `substr()`) und fügen Sie ihren Namen hinzu (Tipp: `paste()`). 

2.4. Nun teilen Sie die Begrüßung in einzele Wörter und speichern Sie die Ausgabe in der Variable `greeting_split`. 

***
### 3. Dates
3.1. Sie erhalten einen Vektor mit Daten im String-Format (s. unten). Ändern Sie den Format zu Datum. 

```r
daten_als_string = c("01.03.2021", "28.10.2021", "21.10.2021", "11.11.2021")
```

3.2. Speichern Sie die Daten in einer Variable `dates` im Format mit ausgeschribenen Monat und abgekürztem Jahr: z.B. "May-21" 

***
### 4. Dataframes  
4.1. Laden Sie den Datensatz `mtcars` (`mtcars` ist in R automatisch dabei)

4.2. Wie viele Zeilen und wie viele Spalten hat der Datensatz? (Tipp: schauen Sie nicht im Environment nach, sondern verwenden Sie eine Funktion)

4.3. Wie viele Zylinder haben die enthaltenen Fahrzeuge im Durchschnitt? (Zylinder: cyl)

4.4. Erstellen Sie einen neuen Datensatz cars_short, der lediglich die Variablen mpg und hp enthält.

***
### 5. EXTRA 

5.1. Beschreiben Sie in eigenen Worten, was unten in jeder Zeile passiert. 

5.2. Was bedeutet das Resultat der letzten Codezeile? 

5.3. Schauen Sie sich hierzu an, was passiert, wenn Sie above_average in einen numerischen Vektor umwandeln.

```r
values = c(1.2, 1.3, 0.8, 0.7, 0.7, 1.5, 1.1, 1.0, 1.1, 1.2, 1.1)
average = mean(values)
above_average = values > average
sum(above_average) / length(values)
```

## Happy coding! 
