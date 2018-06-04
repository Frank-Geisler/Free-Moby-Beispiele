#============================================================================
#	Datei:		Lektion 5 - Docker Compose.ps1
#
#	Summary:	Nachmal dieselbe Wordpress / MySQL Umgebung wie in Lektion 4,
#               Dieses Mal aber mit einer Docker Compose Datei.
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
# 0. Verzeichnis wechseln
#----------------------------------------------------------------------------
cd C:\temp

#----------------------------------------------------------------------------
# 1. Schauen ob die yml auch wirklich in dem Verzeichnis liegt.
#----------------------------------------------------------------------------
dir *.yml

#----------------------------------------------------------------------------
# 2. Lädt alle Images vom Docker Hub herunter die benötigt werden.
#----------------------------------------------------------------------------
docker-compose pull 

#----------------------------------------------------------------------------
# 3. Umgebung mit docker-compose up bereitstellen
#    -d - Detach: Löst Prozess vom PowerShell Fenster so dass man 
#                 weiterarbeiten kann.
#----------------------------------------------------------------------------
docker-compose up -d 

#----------------------------------------------------------------------------
# 4. Alle Docker Compose Container anzeigen lassen
#----------------------------------------------------------------------------
docker-compose ps 

#----------------------------------------------------------------------------
# 5. Natürlich funktioniert auch docker container ps
#----------------------------------------------------------------------------
docker container ps

#----------------------------------------------------------------------------
# 6. Mit docker-compose logs die gesammelten log-Dateien der beiden Container
#    anzeigen lassen
#----------------------------------------------------------------------------
docker-compose logs 

#----------------------------------------------------------------------------
# 7. Wordpress Seite anzeigen
#----------------------------------------------------------------------------
http://localhost:8080

#----------------------------------------------------------------------------
# 8. Docker-Compose Umgebung wieder beenden
#----------------------------------------------------------------------------
docker-compose stop 

#----------------------------------------------------------------------------
# 9. Docker-Compose Umgebung entfernen
#----------------------------------------------------------------------------
docker-compose rm