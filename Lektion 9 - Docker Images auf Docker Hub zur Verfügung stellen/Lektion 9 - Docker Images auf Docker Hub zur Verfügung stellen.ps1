#============================================================================
#	Datei:		Lektion 9 - Docker Images auf Docker Hub zur Verfügung stellen.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man eigene Docker Images auf Docker
#               Hub veröffentlichen kann
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
# 0. Ein Konto bei Docker Hub erstellen soweit noch nicht vorhanden.
#----------------------------------------------------------------------------
https://hub.docker.com 

#----------------------------------------------------------------------------
# 1. Bei Docker Hub anmelden
#----------------------------------------------------------------------------
docker login

#----------------------------------------------------------------------------
# 2. Image bauen. Wichtig ist das Image mit dem Docker Hub Konto zu 
#    taggen
#----------------------------------------------------------------------------
docker image build -t frankgeisler/passwordpress 

#----------------------------------------------------------------------------
# 3. Schauen ob das Image auch wirklich angelegt wurde
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 4. Docker Image auf den Docker Hub hochladen
#----------------------------------------------------------------------------
docker image push frankgeisler/passwordpress

#----------------------------------------------------------------------------
# 5. Nachschauen ob das Image auf Docker Hub angekommen ist
#----------------------------------------------------------------------------
https://hub.docker.com

