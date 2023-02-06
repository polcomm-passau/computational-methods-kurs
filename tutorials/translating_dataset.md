Es gibt mehrere Möglichkeiten, einen Datensatz zu übersetzen. Hier werde ich zwei davon erklären: 
  1) eine Möglichkeit ist den Datensatz halb-manuell mit Hilfe von Google Tabellen zu übersetzen; 
  2) die andere Möglichkeit ist die API von DeepL zu benutzen. 

Der 1)-Weg benötigt weniger Programmierkenntnise, aber die Qualität der Übersetzung ist nicht optimal. Der 2)-Weg benötigt eine Anmeldung für die API mit einer Kreditkarte und ist limitiert in der kostenlosen Version bei 500,000 Wörter pro Monat (das sollte aber für unsere Zwecke reichen). 

## Google Tabellen-Übersetzung

Für diese Variante öffnen Sie [Google Tabellen](https://docs.google.com/spreadsheets/u/0/) in Ihrem Browser. Kopieren Sie alle Zeilen, die Sie übersetzen möchten in eine leere Tabelle rein. Anschließend kopieren Sie diese Funktion (ändern Sie die Daten in eckigen Klammen): =GOOGLETRANSLATE([Zelle zum Übersetzen];"[Ihre Sprache hier]"; "en"). 

## DeepL-Übersetzung

Für diese Variante benutzen Sie die kostenlose Version von DeepL-API: https://www.deepl.com/pro-api?cta=header-pro-api. Bitte prüfen Sie im Voraus ob Ihre Sprache verfügbar ist. Wenn eingerichtet, ist diese Variante schneller und besser. 
