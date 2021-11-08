# Schleifen, Konditionen und Funktionen

* [Schleifen](#Schleifen)
  * [For-Schleifen](#For-Schleifen)
  * [While-Schleifen](#While-Schleifen)
* [Konditionen](#Konditionen)
* [Funktionen](#Funktionen)

 
# Schleifen 

## For-Schleifen

For-Schleifen 
* werden benutzt um eine Satz von Befehlen zu wiederholen
* werden ausgeführt: einmal, unendlich oft oder bis eine Bedingungen erfüllt ist

```r
for (value in sequence) {
  # statement1
  # statement2
  # statement3
  }
  
```
  
## While-Schleifen

```r
while (condition) {
# body
}

#Beispiel

i = 1
while (i < 5) {
  print(i)
  i = i + 1
}

```

# Konditionen (`if-else`-Abfragen) 

```r
if (condition) {
   # statement1
} 
else if (condition) {
   # statement2
} 
else {
   # statement3
}
```

# Funktionen

In R unterscheidet man zwischen:

* “eingebauten” R-Basis Funktionen wie `length()`, `class()`, `sum()`, `min()`, `max()`, …
* Funktionen, die man mit externen Packages importiert (z.B. die Funktion `as_tibble()` kommt zusammen mit dem Package *tibble*)
* eigenen Funktionen 

## Eigene Funktionen schreiben: 

Wir können unsere eigene Funktionen mit dem Aufruf `function()` erstellen. Das was die Funktion machen soll kommt in die `{}`-Klammen. 

```r
my_function_name = function(argument){
# function body
    output = argument
    return(output) # beendet die Funktion
}

my_function_name() #Funktion-Aufruf
```
