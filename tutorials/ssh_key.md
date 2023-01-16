# Serverbenutzung 

Für Lernzwecke, haben wir einen separaten Server (eine Virtual Machine) für Studierende eingerichtet. Der Server hat den Namen **"polcomm-lehre.uni-passau.de"**. Sie können ihn sowohl für die Abschlusprojekte in diesem Kurs als auch später im Studium (z.B. für die Masterarbeit) nutzen. Jede/r Student/in erhält einen eigenen Zugang und einen eigenen Ordner. Der Zugang zum Server ist nur über die Uni-Netzwerk oder VPN möglich. Falls Sie Ihren Laptop wechseln, müssen Sie einen neuen Zugang beantragen (dazu wenden Sie sich an daria.kravets@uni-passau.de).  

## Verwendung der SSH-Authentifizierung

Um sich in dem "polcomm-lehre.uni-passau.de"-Server einzuloggen, müssen Sie eine SSH (Secure Shell) Verbindung benutzen. Wenn Sie sich zum ersten Mal anmelden möchten, müssen zuerst einen SSH-Key generieren. Dieser muss von mir danach freigeschaltet (bitte schicken Sie mir den dafür per E-Mail). 

Um einen SSH-Key zu generieren, befolgen Sie bitte folgende Schritte: 

1. Als erstes, rufen Sie die Befehlszeile auf (CMD/Eingabenaufforderung bei Windows oder Terminal bei Mac). Wenn Sie nicht wissen, wie Sie die Befehlszeile öffnen, lesen Sie [hier nach](https://www.lifewire.com/how-to-open-command-prompt-2618089). Bei Windows sieht die Befehlszeile so aus (bei Mac ähnlich): 

![image](https://user-images.githubusercontent.com/17723168/212761805-b3ee91d7-a07a-4cb2-bbbc-c7e7b677bcd1.png)


2. Navigieren Sie nun zu dem Ordner, in dem Sie Ihren Schlüssel speichern möchten. In meinem Fall (s. Bild) nach dem Eröffnen der Befehlszeile befinde ich mich in dem Ordner "C:\WINDOWS\system32>": 

![image](https://user-images.githubusercontent.com/17723168/212762327-f4df1f26-6568-49e2-ac60-a015a2bc08f7.png)

 Navigieren zwischen Ordner geht mit dem Befehl "cd" (change directory). Zum Beispiel, wenn ich zu dem Ordner Downloads gehen möchte, gebe ich zuerst den Behefl "cd\"
 ein. Das bringt mich dem Path-Baum nach oben zu dem Ordner "C:\": 
 
 ![image](https://user-images.githubusercontent.com/17723168/212763157-b1137dcf-13f6-4cc4-ada2-02d4887d1cba.png)

Nun möchte ich zu meinem Downloads Ordner wechseln. Der Ordner befindet sich auf meinem Rechner unter C:\Users\kravet01\: 

![image](https://user-images.githubusercontent.com/17723168/212763445-d68fae4b-4e33-43ae-9f68-bdab049d88fe.png)

Sie können einen beliebigen Ordner für die Speicherung des Schlüssels auf Ihrem Rechner wählen. Sie müssen nur den Ordner später auch finden können. 

3. Um nun einen Schlüssel zu erzeugen, geben Sie folgenden Befehl in Ihre Befehlszeile ein:

ssh-keygen

![image](https://user-images.githubusercontent.com/17723168/212763774-aa3fad06-dc48-4414-a1aa-3d879dac975f.png)


