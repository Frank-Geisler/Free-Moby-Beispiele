#============================================================================
#	Datei:		Lektion 3 - Mit Docker Containern arbeiten.ps1
#
#	Summary:	In diesem Script wird grundlegend gezeigt wie man Docker
#               Container erzeugt, löscht, stoppt, weitelaufen lässt
#               und wie man interaktiv per bash shell in einem Docker 
#               Container Befehle ausführen kann.
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
# 0. Einen neuen ubuntu Docker Container in Version 16.04 erzeugen und dann
#    in dem Docker Container eine Bash Shell starten
#    -i : Interaktiv - man kann dann interaktiv mit dem Container in der 
#                      PowerShell interagieren
#    -t : TTY Pseudo Shell
#    ubuntu:16.04 : Es wird ein Ubuntu in der Version 16.04 Container erstellt
#    /bin/bash : Es soll eine /bin/bash Shell gestartet werden 
#----------------------------------------------------------------------------
docker container run -i -t ubuntu:16.04 /bin/bash

#----------------------------------------------------------------------------
# 1. In der Bash Shell im Docker Container kann man nun Linux Befehle eingeben
#    z.B. ls
#----------------------------------------------------------------------------
ls

#----------------------------------------------------------------------------
# 2. Docker Container wieder stoppen. Da wo der Kommentar ist muss ein
#    eindeutiger Teil des Digest des Containers hin
#----------------------------------------------------------------------------
docker container stop #9fb5bb67adc6#

#----------------------------------------------------------------------------
# 3. Laufende Docker Container anzeigen. Da unser Docker Container nicht
#    mehr läuft wird er hier auch nicht angezeigt.
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 4. Alle Docker Container anzeigen
#    -a - ALL : mit dieser Option werden sowohl die laufenden wir auch die
#               gestoppten Docker Container angezeigt
#----------------------------------------------------------------------------
docker container ls -a 

#----------------------------------------------------------------------------
# 5. Einen weitere Docker Container mit Ubuntu und /bin/bash Shell starten
#----------------------------------------------------------------------------
docker container run -i -t ubuntu:16.04 /bin/bash

#----------------------------------------------------------------------------
# ACHTUNG!!! NEUES POWERSHELL FENSTER AUFMACHEN!  
# 6. Beide Docker Container anzeigen
#----------------------------------------------------------------------------
docker container ps -a 

#----------------------------------------------------------------------------
# 7. Im PowerShell Fenster mit der bash Shell den folgenden Code eingeben
#    Der Code liefert in einer Endlosschleife die aktuelle Uhrzeit zurück
#----------------------------------------------------------------------------
while true; do date; sleep 5; done

#----------------------------------------------------------------------------
# 8. Im zweiten PowerShell Fenster den folgenden Befehl eingeben.
#    An die Stelle des Kommentars muss ein eindeutiger Teil des Digest
#    des laufenden Docker Containers
#----------------------------------------------------------------------------
docker container pause #3635c4bc8aca#

#----------------------------------------------------------------------------
# 9. Mit docker container ps überprüfen dass der Container angehalten ist
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 10. Docker Container mit unpause weiterlaufen lassen. 
#     An die Stelle des Kommentars muss ein eindeutiger Teil des Digest
#     des pausierten Docker Containers
#     Man kann in der Ausgabe der bash Shell sehen dass Zeiteinträge
#     fehlen (da wo der Container pausiert war).
#----------------------------------------------------------------------------
docker container unpause #3635c4bc8aca#

#----------------------------------------------------------------------------
# 11. Docker Container stoppen.
#     An die Stelle des Kommentars muss ein eindeutiger Teil des Digest
#     des pausierten Docker Containers
#----------------------------------------------------------------------------
docker container stop #3635c4bc8aca#

#----------------------------------------------------------------------------
# 12. Aufräumen. man kann auch mehr als einen Container angeben. 
#     An die Stelle der Kommentare muss ein eindeutiger Teil des Digest
#     der beiden Docker Containers
#----------------------------------------------------------------------------
docker container rm #3635c4bc8aca# #9fb5bb67adc6#

#----------------------------------------------------------------------------
# 13. Das Ubuntu Image wieder löschen
#----------------------------------------------------------------------------
docker image rm ubuntu:16.04 

