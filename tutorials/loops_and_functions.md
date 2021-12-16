# Schleifen, Konditionen und Funktionen

* [Schleifen](#Schleifen)
  * [For-Schleifen](#For-Schleifen)
  * [While-Schleifen](#While-Schleifen)
* [Konditionen](#Konditionen-(if-else-Abfragen))
* [Funktionen](#Funktionen)

 
## Schleifen 

### For-Schleifen

*For*-Schleifen 
* werden benutzt um einen Satz von Befehlen zu wiederholen
* werden ausgeführt: einmal, unendlich oft oder bis eine Bedingungen erfüllt ist

```r
for (value in sequence) {
  # statement1
  # statement2
  # statement3
  }
  
```
  
### While-Schleifen

*While*-Schleifen werden ausgeführt bis eine oder mehrere bestimmte Bedignungen erfüllt sind. 

```r
while (condition) {
# body
}

#Beispiel
 
i = 1
while (i < 5) { # wird ausgeführt soweit i < 5 ist 
  print(i)
  i = i + 1 # i erhört sich um 1 mit jeder Runde 
} 

```

## Konditionen (`if-else`-Abfragen) 

```r
if (condition) {
   # statement1
} 
else if (condition) { # optional 
   # statement2
} 
else {
   # statement3
}
```
Durch die Kombination von `else` und `if` können wir auch beliebig viele Bedingungen hintereinander prüfen.


## Funktionen

In R unterscheidet man zwischen:

* “eingebauten” R-Basis Funktionen wie `length()`, `class()`, `sum()`, `min()`, `max()`, …
* Funktionen, die mit externen Packages importiert werden (z.B. die Funktion `as_tibble()` kommt zusammen mit dem Package *tibble*)
* eigenen Funktionen 

### Eigene Funktionen schreiben: 

Wir können unsere eigene Funktionen mit dem Aufruf `function()` erstellen. Das was die Funktion machen soll kommt in die `{}`-Klammen. 

```r
my_function_name = function(argument){
# function body
    output = argument
    return(output) # beendet die Funktion
}

my_function_name("hello") #Funktion-Aufruf
```

Tipp: wenn Sie in RStudio `fun` eingeben und mit ENTER bestätigen, erstellt RStudio automatisch eine Vorlage für eine Funktion. 
