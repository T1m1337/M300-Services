# LB2 Docker

# Einleitung

In der LB2 ist das Ziel, dass ich einen Service mit Docker aufsetzen und betreiben kann. 

# Was ist Docker?

Docker ist eine Virtualisierungsplattform, die benutzt werden kann um Services als Container zu deployen. Die Images dafür können auf einer Plattform namens Docker Hub bezogen werden. Docker ist kostenlos und kann [hier](https://www.docker.com/get-started) heruntergeladen werden.

# Mein Service
Ich möchte als Service phpmyadmin realisieren. Da phpmyadmin benutzt wird, um Datenbanken zu administrieren, ist es mein Ziel auch noch gleich eine MySQL-Datenbank einzubinden. Da Docker bei mir in einer VM gestartet wird, muss ich zusätzlich noch einige Ports forwarden, um das GUI von phpmyadmin auf meinem eigenen Rechner zu benutzen. 

So sieht das GUI von phpmyadmin aus, welches ich dann von meinem Host aus verwenden will:
![phpmyadmin](https://github.com/T1m1337/M300-Services/raw/master/docker/Images/phpmyadmin.png)

# Benutzte Images

Datenbank: mysql:5.7
PHPMyAdmin: phpmyadmin/phpmyadmin:latest

Damit die zwei Container miteinander Kommunizieren können, wird im Code dann noch ein Netzwerk erstellt.

# Netzwerkplan

![Netzwerkplan](https://github.com/T1m1337/M300-Services/raw/master/docker/Images/Netzwerk.png)

Im Netzwerkplan ist zu sehen, dass die zwei VM's über das Netzwerk mit dem Namen "dockernetwork" über den Port 3306 miteinander kommunizieren. Der Container mit dem Namen phpmyadmin veröffentlicht seinen Port 80 per Portforwarding zur VM auf welcher er läuft. Diese VM exposed den Port 80 wiederum auf Port 8080 des Host-Systems auf welchem die Startseite von PHPMyAdmin schlussendlich aufgerufen werden kann.

# .yml-File
Ich habe für dieses Projekt ein yaml-File verwendet. Ein yaml-File eigente sich perfekt, um bereits vorhandene Images zu deployen und dabei letzte konfigurationen zu machen.

Hier ist der Code:
![code](https://github.com/T1m1337/M300-Services/raw/master/docker/Images/code.png)

# Service starten

## Container erstellen
Um die Container zu starten, muss nur im docker-Verzeichnis von meinem Repository dieser Befehl ausgeführt werden:
```
vagrant up
```
Dieser Befehl startet eine VM, forwardet die korrekten Ports, installiert auf dieser VM docker und docker-compose und startet die Container. Wie dies gemacht wird, kann im [Vagrantfile](https://github.com/T1m1337/M300-Services/blob/master/docker/Vagrantfile) eingesehen werden. 

## Zugriff
Nun kann auf dem Hostsystem im Browser diese Adresse eingetippt werden: http://127.0.0.1:8080

Danach sollte dieses Fenster erscheinen:
![loginpage](https://github.com/T1m1337/M300-Services/raw/master/docker/Images/phpmyadminlogin.png)

### Login
Nun kann man sich mit diese Login-Daten einloggen:
- Username: testuser
- Password: testpw

Nach dem Login kann man sehen, dass die in der Konfiguration angegebene Datenbank erstellt wurde:
![database](https://github.com/T1m1337/M300-Services/raw/master/docker/Images/database.png)

# Testing

| **Soll**                                      | **Ist**                                         | **Test** |
|:----------------------------------------------|:------------------------------------------------|:---------|       
Die Container werden per vagrant up installiert | Container wurden erstellt                       | Befehl vagrant up im docker-Verzeichnis meines Repository ausgeführt
Ports werden so geforwardet, dass auf dem Hostsystem auf Port 8080 auf phpmyadmin zugreifen kann. | Es kann auf Port 8080 auf phpmyadmin zugegriffen werden | Aufruf von http://127.0.0.1:8080 im Browser
Login ist mit dem erstellten User möglich | Login ist möglich | Der Login unter http://127.0.0.1:8080 mit den Anmeldedaten testen

# Quellenverzeichnis
[Docker Hub](https://hub.docker.com)

[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

[Repo von Marco Berger](https://github.com/mc-b/M300)
