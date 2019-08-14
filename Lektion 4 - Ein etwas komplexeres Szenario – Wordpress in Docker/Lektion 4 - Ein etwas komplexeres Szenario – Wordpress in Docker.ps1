#============================================================================
#	Datei:		Lektion 4 - Ein etwas komplexeres Szenario – Wordpress in Docker.ps1
#
#	Summary:	In diesem Script wird ein komplexeres Szenario gebaut bei dem
#               eine Wordpress Umgebung, bestehend aus einem mysql Container und
#               einem WordPress Container, erstellt wird.
#
#	Datum:		2018-06-04
#
#	PowerShell Version: 5.1
#   Docker Version: 18.03.1-ce
#------------------------------------------------------------------------------
#	Geschrieben von  
#       Frank Geisler, GDS Business Intelligence GmbH
#
#   Dieses Script ist nur zu Lehr- bzw. Lernzwecken gedacht
#  
#   DIESER CODE UND DIE ENTHALTENEN INFORMATIONEN WERDEN OHNE GEWÄHR JEGLICHER 
#   ART ZUR VERFÜGUNG GESTELLT, WEDER AUSDRÜCKLICH NOCH IMPLIZIT, EINSCHLIESSLICH, 
#   ABER NICHT BESCHRÄNKT AUF FUNKTIONALITÄT ODER EIGNUNG FÜR EINEN BESTIMMTEN 
#   ZWECK. SIE VERWENDEN DEN CODE AUF EIGENE GEFAHR.
#============================================================================*/

#----------------------------------------------------------------------------
# 0. mysql image besorgen
#----------------------------------------------------------------------------
docker image pull mysql:5.5 

#----------------------------------------------------------------------------
# 1. Einen Container auf Basis des MySQL Images erstellen
#    -d - Detach : Man kann mit der PowerShell weiterarbeiten
#    --name : Name des Containers
#    -e übergibt Environment Variablen
#   MYSQL_ROOT_PASSWORD=wordpress : Root-Kennwort für den MySQL Server
#   MYSQL_DATABASE=wordpress : Name der MySQL Datenbank
#   mysql - Image von dem der Docker Container erstellt werden soll.
#----------------------------------------------------------------------------
docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress mysql:5.5

#----------------------------------------------------------------------------
# 2. Überprüfen das der MySQL Container läuft
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 3. Die Log-Datei des Docker Containers überprüfen
#    Erst wenn da irgendwo "mysql: ready for connections" steht läuft der
#    Container
#----------------------------------------------------------------------------
docker container logs mysql 

#----------------------------------------------------------------------------
# 4. Wordpress Image holen
#----------------------------------------------------------------------------
docker image pull wordpress

#----------------------------------------------------------------------------
# 5. Docker WordPress Container starten
#    --link mysql:mysql : Mit dem MySQL Server verbinden. Wordpress erwartet
#                         einen anderen Server auf dem mysql läuft und der
#                         mysql heißt
#    -p 8080:80 : Portmapping. Externer Port 8080 auf internen Port 80
#    -e WORDPRESS_DB_PASSWORD=wordpress : Kennwort mit dem Wordpress auf den 
#       MySQL Server zugreifen kann
#----------------------------------------------------------------------------
docker container run -d --name wordpress --link mysql:mysql -p 8080:80 -e WORDPRESS_DB_PASSWORD=wordpress wordpress

#----------------------------------------------------------------------------
# 6. Schauen ob beide Container laufen
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 7. Log des Wordpress Containers anschauen
#----------------------------------------------------------------------------
docker container logs wordpress 

#----------------------------------------------------------------------------
# 8. Auf WordPress zugreifen und Wordpress konfigurieren
#----------------------------------------------------------------------------
http://localhost:8080

#----------------------------------------------------------------------------
# 8. Beide Docker Container stoppen
#----------------------------------------------------------------------------
docker container stop wordpress mysql

#----------------------------------------------------------------------------
# 9. Beide Container mit rm löschen
#----------------------------------------------------------------------------
docker container rm wordpress mysql

#----------------------------------------------------------------------------
# 10. Beide Images löschen
#----------------------------------------------------------------------------
docker image rm wordpress mysql