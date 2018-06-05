#============================================================================
#	Datei:		Lektion 7 - Ein komplexes Image bauen.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man mit Docker Build
#               ein komplexes Image bauen kann.
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
# 0. Ein neues Docker Image auf Basis des Dockerfiles bauen
#----------------------------------------------------------------------------
docker image build C:\temp\complexdocker -t webserver

#----------------------------------------------------------------------------
# 1. Einen neuen Container auf Basis des oben erstellen Images erstellen
#----------------------------------------------------------------------------
docker container run -d --name ws -p 8080:80 webserver

#----------------------------------------------------------------------------
# 2. Auf den Webserver zugreifen
#----------------------------------------------------------------------------
http://localhost:8080

#----------------------------------------------------------------------------
# 3. Container wieder beenden
#----------------------------------------------------------------------------
docker container stop ws 

#----------------------------------------------------------------------------
# 4. Container entfernen
#----------------------------------------------------------------------------
docker container rm ws

#----------------------------------------------------------------------------
# 5. Image entfernen
#----------------------------------------------------------------------------
docker image rm webserver 