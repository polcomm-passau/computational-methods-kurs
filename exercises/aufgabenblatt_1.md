Dieser Aufgabenblatt wird benotet. Die maximale Punktenzahl ist 100 Punkte. 

# 1. Variablen (5 Pkt.)

Erstellen Sie eine Character-Variable `x` und geben Sie ihr den Wert 100. Schreiben Sie den Code, der: 

* Transformiert `x` in einen numerischen Wert
* Multipliziert `x` mit 2

# 2. Vektoren/Logicals (10 Pkt.)

Sie erhalten einen numerischen Vektor `age`, der das Alter von 10 Personen enthält, der bequemerweise von 15 bis 24 hochzählt. Als erstes, geben Sie den Personen beliebige Namen (denken Sie sich welche aus!). Danach, verwenden Sie Logische Operatoren, um einen Vektor mit Logischen Werten zu erstellen, der zeigt:

* Personen älter als 18
* Personen junger als 21
* Personen älter als 18 und junger als 21
* Personen junger als 18 und älter als 21

```{r} 
age = c(15,16,17,18,19,20,21,22,23,24)
age >= 20  ## Beispiel
```

# 3. Dates (5 Pkt.)

Füllen Sie den `format`-Argument in der Funktion `strptime()`, um das Datum korrekt zu parsen. 

```{r}
strptime('1961-12-24', format='%Y-%m-%d')   ## Beispiel 
strptime('25 12, 1961', format='')
strptime('1961-12-26T19:00:00', format='')
```

# 4. Indexing (10 Pkt.)

Mit Hilfe von Index-Slicing (Tipp: `[]`) geben Sie die folgenden Teilmengen des gegebenen Zeichenvektors `x` zurück: 

* Alle Elemente in den Positionen drei bis zwanzig
* Alle Elemente außer denen in den Positionen drei bis zwanzig
* Die Elemente in umgekehrter Reihenfolge

```{r}
x = letters   ## built-in Vektor mit Buchstaben des Alphabets
x[1:5]        ## Beispiel
```
# 5. Funktionen aufrufen und Dokumentation konsultieren: – seq() (10 Pkt.)

Informieren Sie sich wie die Funktion seq() funktioniert. Dafür  Lesen Sie sich die Dokumentationsseite der Funktion durch. Mit Hilfe von seq() erstellen Sie einen Vektor, der:

* Mit 2 anfängt und alle geraden Zahlen von 2 bis 50 enthält.  


# 6. Schleifen (10 Pkt.)
???
If, while, for

# 7. Funktionen (10 Pkt.)

Schreiben Sie eine Funktion, die einen Zeichenvektor als Argument nimmt und einen Zeichenvektor zurückgibt, der die ersten Buchstaben jedes Elements im ursprünglichen Vektor enthält. Um zu zeigen, dass es funktioniert, testen Sie es mit dem unten definierten Vektor.

```{r}
sentence <- c('you', 'only', 'understand', 'data', 'if', 'data', 'is', 'tidy')
```

# 8. Funktionen (10 Pkt.)

Erstellen Sie eine Funktion (`gerade_oder_ungerade`), die eine ganze Zahl als Argument nimmt und "Gerade" für gerade Zahlen oder "Ungerade" für ungerade Zahlen zurückgibt.

