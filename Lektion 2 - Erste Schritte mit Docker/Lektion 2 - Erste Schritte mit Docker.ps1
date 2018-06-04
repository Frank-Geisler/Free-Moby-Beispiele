#============================================================================
#	Datei:		Lektion 2 - Erste Schritte mit Docker.ps1
#
#	Summary:	In diesem Script 
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
# 0. Docker Version anzeigen
#----------------------------------------------------------------------------
docker version

#----------------------------------------------------------------------------
# 1. Das neuste nginx image vom Docker Hub abrufen
#----------------------------------------------------------------------------
docker image pull nginx

#----------------------------------------------------------------------------
# 2. Auf Basis des nginx images einen neuen Docker Container erstellen.
# 
#    -d : Detach - sorgt dafür, dass der Docker Prozess von PowerShell 
#                  abgekoppelt wird und man mit der Konsole weiterarbeiten
#                  kann
#    --name: Name des Docker Containers. Kann man auch weglassen, dann wird 
#            ein generischer Name erstellt
#    -p : Port Mapping. Der externe Port 8080 am Docker Host wird auf den
#         internen Port 80 im Container gemappt
#    nginx : Image von dem der Container erzeugt werden soll
#----------------------------------------------------------------------------
docker container run -d --name nginx-test -p 8080:80 nginx

#----------------------------------------------------------------------------
# 3. Alle Docker Container anzeigen die ausgeführt werden.
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 4. Den Docker Container nginx-test wieder stoppen
#----------------------------------------------------------------------------
docker container stop nginx-test 

#----------------------------------------------------------------------------
# 5. Den Docker Container nginx-test löschem (rm = remove)
#----------------------------------------------------------------------------
docker container rm nginx-test 

#----------------------------------------------------------------------------
# 6. Das Docker Image nginx löschen
#----------------------------------------------------------------------------
docker image rm nginx 