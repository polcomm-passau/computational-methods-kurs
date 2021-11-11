######################################################
# Programmieren für KoWi
# Daria Kravets
# 11.11.2021
######################################################

#Funktionen, Schleifen, Konditionale-Abfragen

#Variablenbenennung Beispiele

i_use_snake_case
otherPeopleUseCamelCase
some.people.use.periods #richtig hässlich :) 
And_aFew.People_RENOUNCEconvention

this_is_a_very_long_assignment = 2+2

#-------

#Packages 

## Installieren

#von CRAN: 
install.packages("quanteda")
install.packages("glue")

#von GitHub:

devtools::install_github("hadley/emo") #devtools müssen separat installiert werden
emo::ji("poop")

## Nutzen
library(guanteda)
library(tibble)
library(glue)

# Wenn einmalig: 
tibble::as_tibble()

## Deinstallieren 

remove.packages("glue")

## Extra: Vignette -> Dokumentation

vignette("tibble")
browseVignettes("glue")

#-------
#Funktionen, Schleifen, Konditionale-Abfragen
#Übungen

# Übung 1: Warum funktioniert diese Funktion nicht? 

mul <- function(a, b) {
  a * c # try to figure out why it doesn't work!
}

mul(2,3)

#Übung 2: Greeting 

# Wie rufe ich diese Funktion auf? 

greeting <- function(name) {
  
  return(glue("Hallo, {name}"))
}

#Übung Extra: Schleifen

i = 1 

while (i <20){
  print(i)
}

#Übung 3: Drinking function


allowed_to_drink = function(name, age){
  
  if (age >= 18){
    glue("Whooho! {name} is free to drink, because they are {age}")
  }
  
  else if (age >= 16){
    print(glue("{name} can only drink beer, wine and sekt because they are {age}"))
  }
  
  else {
    print(glue("Sorry, {name} is not allowed to drink because they are only {age}"))
  }
}

allowed_to_drink("Tim", 10)


