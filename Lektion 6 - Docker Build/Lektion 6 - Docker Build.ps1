#============================================================================
#	Datei:		Lektion 6 - Docker Build.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man mit Docker Build
#               ein eigenes Image bauen kann
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
# 0. Docker Image erstellen lassen
#    Digest der erzeugt wird merken
#----------------------------------------------------------------------------
docker image build C:\temp

#----------------------------------------------------------------------------
# 1. Docker Container laufen lassen
#    Auskommentierten Digest mit eigenem Digest ersetzen.
#----------------------------------------------------------------------------
docker container run #2a1a5abca6b2#

#----------------------------------------------------------------------------
# 2. Docker Images anzeigen lassen
#----------------------------------------------------------------------------
docker image ls

#----------------------------------------------------------------------------
# 3. Docker Image mit Tag versehen
#    Auskommentierten Digest mit eigenem Digest ersetzen.
#----------------------------------------------------------------------------
docker image tag #2a1a5abca6b2# hellodocker

#----------------------------------------------------------------------------
# 4. Docker Images noch einmal anzeigen lassen. Das Image hat nun das
#    Tag hellodocker
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 5. Man kann auch beim Erstellen des Docker Images ein Tag vergeben.
#----------------------------------------------------------------------------
docker image build C:\temp -t basichelloworld

#----------------------------------------------------------------------------
# 6. Wenn man nun noch mal die Images anzeigt sieht man, dass das Image
#    helloworld nun auch unter basichelloworld verfügbar ist
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 7. Aufräumen
#----------------------------------------------------------------------------
docker image rm basichelloworld wordpress ubuntu mysql 

#----------------------------------------------------------------------------
# 8. Docker Image ls zeigt, dass es noch ein Image mit dem Namen
#    hellodocker gibt
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 9. Image löschen - schlägt fehl weil es noch einen Container gibt der auf 
#    dem Image beruht
#----------------------------------------------------------------------------
docker image rm hellodocker

#----------------------------------------------------------------------------
# 10. Um den Container zu sehen müssen wir -a angeben, da der Container
#     gerade nicht ausgeführt wird.
#----------------------------------------------------------------------------
docker container ls -a 

#----------------------------------------------------------------------------
# 11. Container löschen.
#     An die Stelle des auskommentierten Digest kommt der Digest des
#     Containers aus Befehl 10
#----------------------------------------------------------------------------
docker container rm #4a583817f7c5#

#----------------------------------------------------------------------------
# 12. Nun kann das Image auch gelöscht werden
#----------------------------------------------------------------------------
docker image rm hellodocker 