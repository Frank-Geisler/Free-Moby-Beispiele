#============================================================================
#	Datei:		Lektion 11 - Docker Netzwerke.ps1
#
#	Summary:	In dieser Datei wird ein wenig mit Docker Netzwerken 
#               experimentiert
#
#	Datum:		2018-06-05
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
# 0. Die Docker Netzwerke anzeigen
#----------------------------------------------------------------------------
docker network ls 

#----------------------------------------------------------------------------
# 1. Informationen für ein Docker Netzwertk anzeigen.
#    Der Digest der auskommentiert ist muss geändert werden in einen Digest
#    der oben angezeigt wird.
#----------------------------------------------------------------------------
docker network inspect #cf8# 

#----------------------------------------------------------------------------
# 2. Hilfe zu docker network create anzeigen
#----------------------------------------------------------------------------
docker network create --help 

#----------------------------------------------------------------------------
# 3. Ein neues Netzwerk anlegen
#----------------------------------------------------------------------------
docker network create my_new_network 

#----------------------------------------------------------------------------
# 4. Anschauen ob das neue Netzwerk vorhanden ist
#----------------------------------------------------------------------------
docker network ls 

#----------------------------------------------------------------------------
# 5. Das neue Docker Netzwerk anschauen
#----------------------------------------------------------------------------
docker network inspect my_new_network 

#----------------------------------------------------------------------------
# 6. Einen neuen nginx Container erstellen der im Netzwerk my_new_network
#    eingehängt wird.
#----------------------------------------------------------------------------
docker container run -d --name nginx –network my_new_network nginx

#----------------------------------------------------------------------------
# 5. Schauen ob der Container läuft
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 6. Den Docker Container anschauen und die Infos für das Netzwerk
#    anschauen.
#----------------------------------------------------------------------------
docker container inspect nginx

#----------------------------------------------------------------------------
# 7. Den Container am bridge Netzwerk anschließen
#----------------------------------------------------------------------------
docker network connect bridge nginx 

#----------------------------------------------------------------------------
# 8. Noch mal die Infos vom Container anschauen -> er hat jetzt zwei
#    Netzwerkkarten
#----------------------------------------------------------------------------
docker container inspect nginx 

#----------------------------------------------------------------------------
# 9. Container aus dem Netzwerk my_new_network entfernen
#----------------------------------------------------------------------------
docker network disconnect my_new_network nginx

#----------------------------------------------------------------------------
# 10. Noch mal die Infos zum Container anschauen. Jetzt hängt der Container
#     nur noch am default-Netzwerk.
#----------------------------------------------------------------------------
docker container inspect nginx 