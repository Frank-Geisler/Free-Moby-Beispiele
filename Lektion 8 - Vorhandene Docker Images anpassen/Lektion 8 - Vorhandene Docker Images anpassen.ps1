#============================================================================
#	Datei:		Lektion 8 - Vorhandene Docker Images anpassen.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man ein vorhandenes Docker 
#               Image anpassen und um weitere Funktionen erweitern kann.
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
# 0. Docker Image aus dem Dockerfile bauen
#----------------------------------------------------------------------------
docker image build -t wordpress-custom . 

#----------------------------------------------------------------------------
# 1. Überprüfen ob das Image da ist
#----------------------------------------------------------------------------
docker image ls

#----------------------------------------------------------------------------
# 2. Docker Image noch mal entfernen, weil wir das Image gleich über
#    Docker Compose noch mal erzeugen lassen
#----------------------------------------------------------------------------
docker image rm wordpress-custom 

#----------------------------------------------------------------------------
# 3. Überprüfen dass das Docker Image nicht mehr da ist
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 4. Umgebung mit docker-compose hochfahren
#----------------------------------------------------------------------------
docker-compose up -d 

#----------------------------------------------------------------------------
# 5. Auf Wordpress zugreifen - aber nicht konfigurieren
#----------------------------------------------------------------------------
http://localhost:8080

#----------------------------------------------------------------------------
# 6. Im Docker Container wp core ausführen
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core version

#----------------------------------------------------------------------------
# 7. Docker über wp core konfigurieren
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core install --url=http://localhost:8080 --title=“PASS“ --admin_user=admin --admin_password=password --admin_email=frank_geisler@geislers.net

#----------------------------------------------------------------------------
# 8. Noch mal auf die Website zugreifen - Wordpress ist konfiguriert
#----------------------------------------------------------------------------
http://localhost:8080

#----------------------------------------------------------------------------
# 9. Mit docker-compose aufgebaute Umgebung wieder beenden
#----------------------------------------------------------------------------
docker-compose stop 

#----------------------------------------------------------------------------
# 10. docker-compose Umgebung entfernen
#----------------------------------------------------------------------------
docker-compose rm 