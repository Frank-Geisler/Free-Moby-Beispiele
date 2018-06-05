#============================================================================
#	Datei:		Lektion 12 - Docker Netzwerke – Poor Mans Loadbalancer mit Round Robin.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man einfaches Load Balancing
#               mit Docker machen kann. 
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
# 0. Ein neues Netzwerk mit Namen round_robin anlegen
#----------------------------------------------------------------------------
docker network create round_robin 

#----------------------------------------------------------------------------
# 1. Vier nginx Webserver erstellen
#----------------------------------------------------------------------------
docker container run -d --network round_robin --net-alias web nginx
docker container run -d --network round_robin --net-alias web nginx
docker container run -d --network round_robin --net-alias web nginx
docker container run -d --network round_robin --net-alias web nginx

#----------------------------------------------------------------------------
# 2. Testcontainer im Netzwerk erstellen der nslookup ausführt und danach
#    direkt wieder entfernt wird. Befehl ein paar mal ausprobieren. IP
#    Adressen werden immer in anderer Reihenfolge ausgegeben.
#----------------------------------------------------------------------------
docker container run --network round_robin --rm alpine nslookup web
docker container run --network round_robin --rm alpine nslookup web
docker container run --network round_robin --rm alpine nslookup web
docker container run --network round_robin --rm alpine nslookup web

#----------------------------------------------------------------------------
# 3. Docker Container in bridge erstellen
#----------------------------------------------------------------------------
docker container run -d --name web nginx

#----------------------------------------------------------------------------
# 4. Schauen ob der Container da ist
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 5. Nslookup auf den Namen web. Geht nicht -> in bridge gibt es keinen 
#    DNS-Server!
#----------------------------------------------------------------------------
docker container run --rm alpine nslookup web