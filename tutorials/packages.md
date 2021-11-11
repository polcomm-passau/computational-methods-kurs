# Packages 

* [Installieren](#Installieren)
* [Nutzen](#Nutzen)
* [Deinstalieren](#Deinstalieren)

Packages sind das Herzstück von R:  
* R-Packages sind im Grunde eine Sammlung von fertigen Funktionen, die Sie verwenden können. Die bekanntesten und wichtigsten Packages für den sozialwissenschaftlichen Gebrauch sind *tidyverse*, *quanteda*, *tibble*, *ggplot2*, usw.
* Auf [CRAN](https://cran.r-project.org/) (*The Comprehensive R Archive Network*) haben Sie Zugriff auf mehr als 15.000 Packages
* Es gibt ein Package für ziemlich alles was man machen möchte! 
  

## Installieren

Packages müssen nur einmal installiert werden. 

```r
install.packages("package_name")
```

## Nutzen

Hingegen um ein Package in einem Skript zu nutzen, muss es immer wieder neu aktiviert werden. 

```r
library(package_name) 
#ODER
library("package_name")

#Alternative, wenn man nur eine Funktion aus dem Package einmalig nutzen möchte: 

tibble::as_tibble(mtcars) # as_tibble ist eine Funktion aus dem Package Tibble 

```

## Deinstallieren

**1) `remove.packages()`**

Ein Package deinstallieren geht mit `remove.packages()`:

```r
remove.packages("affycoretools")

```
**2) Manuell** 

Gehen Sie zu *Packages* in der rechten unteren Ecke von Rstudio, wählen Sie das Package, das Sie löschen möchten und klicken auf das nebenstehende **X**-Symbol, um es zu entfernen.

![Packages_delete](https://user-images.githubusercontent.com/17723168/140925876-b7a7622e-9e6e-4505-b423-cb61c9a388a9.png)


