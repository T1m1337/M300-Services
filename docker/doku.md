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

