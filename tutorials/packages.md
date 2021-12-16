# Packages 

* [Installieren](#Installieren)
    - [von CRAN](#Installieren)
    - [von GitHub](#Packages-von-GitHub-installieren)  
* [Nutzen](#Nutzen)
* [Deinstalieren](#Deinstallieren)

Packages sind das Herzstück von R:  
* R-Packages sind im Grunde eine Sammlung von fertigen Funktionen, die Sie verwenden können. Die bekanntesten und wichtigsten Packages für den sozialwissenschaftlichen Gebrauch sind *tidyverse*, *quanteda*, *tibble*, *ggplot2*, usw.
* Auf [CRAN](https://cran.r-project.org/) (*The Comprehensive R Archive Network*) haben Sie Zugriff auf mehr als 15.000 Packages
* Es gibt ein Package für ziemlich alles was man machen möchte! 
  

## Installieren

Packages müssen nur einmal installiert werden. Am einfachsten ist und wird am häufigsten verwendet eine Installation von CRAN:   

```r
install.packages("package_name") #von CRAN
```

Als Alternative dazu können Packages über die Benutzeroberfläche von RStudio installiert werden: Dafür gehen Sie auf das *Packages*-Pane in der rechten Ecke von RStudio ->![install_button](https://user-images.githubusercontent.com/17723168/141771117-9a9846af-693f-4be4-8545-cd15eb08e904.png) -> und das richtige Package suchen.   

![install_packages](https://user-images.githubusercontent.com/17723168/141770887-41ea79ba-6826-49d1-9e3f-3b234570ff98.png)

Außerdem können so alle Packages aktualisiert werden (![Update](https://user-images.githubusercontent.com/17723168/141771260-9df25473-e0a7-4fa2-8e6e-049236124734.png)) - es empfiehlt sich, dies regelmässig zu tun.

![load-tidyverse](https://user-images.githubusercontent.com/17723168/141772040-7c23daf1-2b06-48a0-9e9e-f20b6590db46.png)


### Packages von GitHub installieren

Manche Packages sind nicht auf CRAN verfügbar oder manchmal möchte man die aktuelleste Version "in-der-Enwicklung" herunterladen. Dafür müssen Sie zuerst einmal `devtools` installieren (Windows-Nutzer müssen zudem [RTools](https://cran.r-project.org/bin/windows/Rtools/) auf Ihrem Rechner installiert haben vor dem sie `devtools` installieren): 

```r
install.packages("devtools")
```

Danach kann man Packages direkt von GitHub installieren, man muss nur den korrekten Pfad eingeben: 

```r
# Hier installieren wir das Package "dplyr", der von Hadley Wickham auf GitHub entwickelt wird. 
devtools::install_github("hadley/dplyr") # (user name + repository name)
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
remove.packages("package_name")

```
**2) Manuell** 

Gehen Sie zu *Packages* in der rechten unteren Ecke von Rstudio, wählen Sie das Package, dass Sie löschen möchten und klicken auf das nebenstehende **X**-Symbol, um es zu entfernen.

![Packages_delete](https://user-images.githubusercontent.com/17723168/140925876-b7a7622e-9e6e-4505-b423-cb61c9a388a9.png)


