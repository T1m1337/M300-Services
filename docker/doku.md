# LB2 Docker

# Einleitung

In der LB2 ist das Ziel, dass ich einen Service mit Docker aufsetzen und betreiben kann. 

# Was ist Docker?

Docker ist eine Virtualisierungsplattform, die benutzt werden kann um Services als Container zu deployen. Die Images dafür können auf einer Plattform namens Docker Hub bezogen werden. Docker ist kostenlos und kann [hier](https://www.docker.com/get-started) heruntergeladen werden.

# Mein Service
Ich möchte als Service phpmyadmin realisieren. Da phpmyadmin benutzt wird, um Datenbanken zu administrieren, ist es mein Ziel auch noch gleich eine MySQL-Datenbank einzubinden. Da Docker bei mir in einer VM gestartet wird, muss ich zusätzlich noch einige Ports forwarden, um das GUI von phpmyadmin auf meinem eigenen Rechner zu benutzen. 

So sieht das GUI von phpmyadmin aus, welches ich dann von meinem Host aus verwenden will:
