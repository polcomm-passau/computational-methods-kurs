Bitte lösen Sie dieses Aufgabenblatt 1 in Zweier-Gruppen und laden Sie Ihre Lösung (eine **R.**-Datei) bis **16.11** auf *Stud.IP* hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. **Happy Coding!** 

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.  

## 1. Variablen (5 Pkt.)

Erstellen Sie eine Character-Variable `x` und weisen Sie ihr den Wert 100 (Integer) zu. Prüfen Sie den Variablentyp von `x` mit `class()`. Schreiben Sie Code, der: 

* `x` in einen numerischen Wert transformiert 
* `x` mit 2 multipliziert 

## 2. Vektoren/Logicals (10 Pkt.)

Sie erhalten einen numerischen Vektor `age`, der das Alter von 10 Personen enthält und von 15 bis 24 hochzählt. Geben Sie den Personen zuerst beliebige Namen (denken Sie sich welche aus!). Verwenden Sie dann Logische Operatoren, um einen Vektor mit Personen zu erstellen, der ausgibt:

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

Sie erhalten drei Character-Variablen `a`, `b` und `c`. Wandeln Sie die Varibalen jeweils ins Datum-Format so um, dass das gegebene Datum und ggf. die Uhrzeit korrekt eingelesen werden. 

```r
a = '1961-12-24'
b = '25 12, 1961'
c = '1961-12-26T19:00:00'
```

## 4. Indexing (10 Pkt.)

Benutzen Sie Index-Slicing (Tipp: `[]`), um sich folgende Teilmengen des gegebenen Zeichenvektors `x` ausgeben zu lassen: 

* Alle Elemente in den Positionen drei bis zwanzig
* Alle Elemente außer denen in den Positionen drei bis zwanzig
* Die Elemente in umgekehrter Reihenfolge

```r
x = letters   ## built-in Vektor mit Buchstaben des Alphabets
x[1:5]        ## Beispiel
```
## 5. Funktionen aufrufen und Dokumentation konsultieren (10 Pkt.)

Informieren Sie sich eigenständig wie die Funktion `seq()` funktioniert. Mit Hilfe von `seq()` erstellen Sie einen Vektor, der eine Zahlenfolge von 0 bis 100 in 5er-Schritten erzeugt.

## 6. Schleifen (15 Pkt.)

Mit Hilfe von `for` und `while`-Schleifen und `if-else`-Abfragen, schreiben Sie eine Programm, die: 

* Fünf mal "Ich liebe Programmieren mit R" ausgibt (bitte schreiben Sie jeweils eine Schleife mit `for` und `while`). Zum Ausgeben in der Konsole verwenden Sie die Funktion `print()`
* Alle Zahlen von 1 bis 20 ausgibt. (hier können Sie entweder `for` oder `while`-Schleifen verwenden. 
* Nur die gerade Zahlen von 1 bis 20 ausgibt.  

## 7. Funktionen-1 (10 Pkt.)

Schreiben Sie eine Funktion, die einen Zeichenvektor als Argument nimmt und einen Zeichenvektor zurückgibt, der die ersten Buchstaben jedes Elements im ursprünglichen Vektor enthält. Um zu zeigen, dass Ihre Funktion funktioniert, testen Sie sie mit dem unten definierten Vektor.

```r
sentence <- c('you', 'only', 'understand', 'data', 'if', 'data', 'is', 'tidy')
```

## 8. Funktionen-2 (10 Pkt.)

Erstellen Sie eine Funktion (`gerade_oder_ungerade`), die eine ganze Zahl als Argument nimmt und "Gerade" für gerade Zahlen oder "Ungerade" für ungerade Zahlen zurückgibt (Tipp: verwenden Sie den Modulo-Operator).

## 9. Funktionen-3 (15 Pkt.)

Erstellen Sie eine Funktion `fahrenheit_to_celsius`, die eine Temperaturangabe in Grad Fahrenheit (als numerischen Wert, also z. B. 80) in Grad Celsius umrechnet und diesen Wert zurückgibt. Bitte bauen Sie eine `if-else`-Abfrage ein, die prüft, ob der eingegebene Wert tatsächlich numerisch (numeric oder integer) ist und einen Fehler ausgibt, falls es nicht so sein sollte.  

Die Formel zur Umrechnung von Fahrenheit in Celsius lautet: °C=(°F−32)×5/9.

## 10. Funktionen-4 (10 Pkt.)

Erstellen Sie eine Funktion `get_middle_character`, die von einem beliebigen Wort die mittleren Buchstaben zurückgibt. Wenn die Länge des Wortes ungerade ist, geben Sie den mittleren Buchstaben zurück. Wenn die Länge des Wortes gerade ist, geben Sie die zwei mittleren Buchstaben zurück.

Beispiele: 
```r
get_middle_character("test") #soll "es" zurückgeben. 
get_middle_character("middle") #soll "dd" zurückgeben. 
get_middle_character("liebe") #soll "e" zurückgeben. 
```
