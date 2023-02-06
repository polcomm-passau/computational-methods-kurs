Das Herunterladen von Bildern ist in R ziemlich einfach. Zum Beispiel, wird der folgende Code das Bild `y` auf Ihren Rechner herunterladen: 

```r
y = "http://upload.wikimedia.org/wikipedia/commons/5/5d/AaronEckhart10TIFF.jpg"
download.file(y,'y.jpg', mode = 'wb')
```

Nun müssen Sie den Code für Ihre Zwecke anpassen. 
