Bitte lösen Sie diesen Aufgabenblatt 1 in zweier-Gruppen und laden Sie Ihre Lösung (eine **R.**-Datei) bis 16.11 auf Stud.IP hoch. Dieser Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. Happy Coding! 

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontakrieren Sie daria.kravets@uni-passau.de.  

## 1. Variablen (5 Pkt.)

Erstellen Sie eine Character-Variable `x` und geben Sie ihr den Wert 100. Schreiben Sie den Code, der: 

* `x` in einen numerischen Wert transformiert 
* `x` mit 2 multipliziert 

## 2. Vektoren/Logicals (10 Pkt.)

Sie erhalten einen numerischen Vektor `age`, der das Alter von 10 Personen enthält, der bequemerweise von 15 bis 24 hochzählt. Als erstes, geben Sie den Personen beliebige Namen (denken Sie sich welche aus!). Danach, verwenden Sie Logische Operatoren, um einen Vektor mit Personen zu erstellen, der zeigt:

* Personen älter als 18
* Personen junger als 21
* Personen älter als 18 und junger als 21
* Personen junger als 18 und älter als 21

```r 
age = c(15,16,17,18,19,20,21,22,23,24)

## Beispiel Ausgabe: 
## Anna Peter Karl Anton
##   20    21   22    23
```

## 3. Dates (5 Pkt.)

Füllen Sie den `format`-Argument in der Funktion `strptime()`, um das Datum korrekt einzulesen. 

```r
strptime('1961-12-24', format='%Y-%m-%d')   ## Beispiel 
strptime('25 12, 1961', format='')
strptime('1961-12-26T19:00:00', format='')
```

## 4. Indexing (10 Pkt.)

Mit Hilfe von Index-Slicing (Tipp: `[]`) geben Sie die folgenden Teilmengen des gegebenen Zeichenvektors `x` zurück: 

* Alle Elemente in den Positionen drei bis zwanzig
* Alle Elemente außer denen in den Positionen drei bis zwanzig
* Die Elemente in umgekehrter Reihenfolge

```r
x = letters   ## built-in Vektor mit Buchstaben des Alphabets
x[1:5]        ## Beispiel
```
## 5. Funktionen aufrufen und Dokumentation konsultieren (10 Pkt.)

Informieren Sie sich wie die Funktion seq() funktioniert. Dafür lesen Sie sich die Dokumentationsseite der Funktion durch. Mit Hilfe von `seq()` erstellen Sie einen Vektor, der:

* Mit 2 anfängt und alle geraden Zahlen von 2 bis 50 enthält.  
* ???

## 6. Schleifen (15 Pkt.)

Mit Hilfe von `for` und `while`-Schleifen und `if-else`-Abfragen, schreiben Sie eine Programm, die: 

* Fünf mal "Ich liebe Programmieren mit R" ausgibt (bitte schreiben Sie jeweils eine Schleife mit `for` und `while`). Zum Ausgeben in der Konsole verwenden Sie die Funktion `print()`
* Alle Zahlen von 1 bis 20 ausgibt.
* Nur die gerade Zahlen von 1 bis 20 ausgibt.  

## 7. Funktionen-1 (10 Pkt.)

Schreiben Sie eine Funktion, die einen Zeichenvektor als Argument nimmt und einen Zeichenvektor zurückgibt, der die ersten Buchstaben jedes Elements im ursprünglichen Vektor enthält. Um zu zeigen, dass es funktioniert, testen Sie es mit dem unten definierten Vektor.

```r
sentence <- c('you', 'only', 'understand', 'data', 'if', 'data', 'is', 'tidy')
```

## 8. Funktionen-2 (10 Pkt.)

Erstellen Sie eine Funktion (`gerade_oder_ungerade`), die eine ganze Zahl als Argument nimmt und "Gerade" für gerade Zahlen oder "Ungerade" für ungerade Zahlen zurückgibt (Tipp: verwenden Sie den Modulo-Operator).

## 9. Funktionen-3 (15 Pkt.)

Erstellen Sie eine Funktion `fahrenheit_to_celsius`, die eine Temperaturangabe in Grad Fahrenheit (als numerischen Wert, also z. B. 80) in Grad Celsius umrechnet und diesen Wert zurückgibt. Bitte bauen Sie eine `if-else`-Abfrage ein, die prüft, ob der eingegebene Wert tatsächlich numerisch (numeric oder integer) ist und gibt einen Fehler aus, falls es nicht so sein sollte.  

Die Formel zur Umrechnung von Fahrenheit in Celsius lautet: °C=(°F−32)×5/9.

## 10. Funktionen-4 (10 Pkt.)

Erstellen Sie eine Funktion `get_middle_character`, die von einem beliebigen Wort die mittleren Buchstaben zurückgibt. Wenn die Länge des Wortes ungerade ist, geben Sie den mittleren Buchstaben zurück. Wenn die Länge des Wortes gerade ist, geben Sie die zwei mittleren Buchstaben zurück.

Beispiele: 
```r
get_middle_character("test") #soll "es" zurückgeben. 
get_middle_character("middle") #soll "dd" zurückgeben. 
get_middle_character("liebe") #soll "e" zurückgeben. 
```
