Bitte lösen Sie dieses Aufgabenblatt 3 in Zweier-Gruppen und laden Sie Ihre Lösung (eine R.-Datei) bis 14.12 auf Stud.IP hoch. Dieses Aufgabenblatt wird benotet und die maximale Punktenzahl beträgt 100 Punkte. Happy Coding!

Falls Sie Fragen zu diesem Aufgabenblatt haben, kontaktieren Sie daria.kravets@uni-passau.de.

# Aufgabe I - Guardian API (100 Pkt)

Machen Sie sich mit der Dokumentation von [Guardian API](https://open-platform.theguardian.com/) vertraut und beantragen Sie einen Zugansschlüssel zu der API.

* Sammeln Sie die letzten 100 Artikel (mit Volltexten), die die neue Corona-Virusvariante "Omicron" in deren Texten erwähnen. Speichern Sie diese in einem Tibble.
* Nun sammeln Sie nur solche Artikel (keyword = "omicron"),  die seit 1.12.2021 bei der Sektion "politics" publiziert wurden (max = 150). Speichern Sie diese erneut in einem Tibble, bereinigen Sie den Tibble (keine nested-Listen sollten drin sein) und löschen Sie alle überflüssigen Spalten (Sie können diese selbst bestimmen).

Führen Sie ein paar einfache Analysen durch: 

* Teilen Sie die Spalte mit dem Datum und Uhrzeit der Publikation in zwei Spalten (publicationDate, publicationTime). 
* Wie lang sind die Artikel im Durchschnitt? D.h. (1) wie viele Wörter haben sie im Durchschnitt? (2) Wie viele Zeichen haben sie im Durchschnitt? 
* Vergleichen Sie diese mit dem Durchschnitt der letzten 100 Artikel mit einem beliebigen keyword (denken Sie sich ein interessantes und passendes Keyword aus!) aus der Sektion "culture" (Sie müssen dafür eine neue API-Anfrage stellen).


Vielen Dank!
