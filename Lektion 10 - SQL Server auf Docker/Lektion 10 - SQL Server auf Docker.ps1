#============================================================================
#	Datei:		Lektion 10 - SQL Server auf Docker.ps1
#
#	Summary:	In dieser Datei wird gezeigt wie man einen SQL Server in 
#               Docker zur Verfügung stellt
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
# 0. Mal schauen was Microsoft so auf Docker Hub anbietet. 
#    Wichtig ist das Image microsoft/mssql-server-linux
#----------------------------------------------------------------------------
docker search microsoft 

#----------------------------------------------------------------------------
# 1. Das Linux SQL Server Image von Microsoft herunterladen
#----------------------------------------------------------------------------
docker pull microsoft/mssql-server-linux

#----------------------------------------------------------------------------
# 2. Docker Container basierend auf dem Image erstellen. 
#    -e "ACCEPT_EULA=Y" : Lizenzvertrag akzeptieren
#    -e "SA_PASSWORD=!test123" : sa Passwort setzen
#    -p 1433:1433 : Port 1433 (extern) auf Port 1433 (im Container) mappen
#----------------------------------------------------------------------------
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=!test123" -p 1433:1433 --name slq1 -d microsoft/mssql-server-linux

#----------------------------------------------------------------------------
# 3. Schauen ob der Docker Container läuft
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 4. Backup von AdventureWorksLT2012 in den Container kopieren
#----------------------------------------------------------------------------
docker cp c:\Temp\AdventureWorksLT2012_Data.mdf sql1:/var/opt/mssql/data/AdventureWorksLT2012_Data.mdf

#----------------------------------------------------------------------------
# 5. Mit dem lokalen SSMS mit dem  SQL Server verbinden und die 
#    Datenbank wiederherstellen
#----------------------------------------------------------------------------
CREATE DATABASE [AdventureWorksLT2012] ON 
(FILENAME=N'/var/opt/mssql/data/AdventureWorksLT2012_Data.mdf') FOR ATTACH;

#----------------------------------------------------------------------------
# 6. SQL Server abfragen
#----------------------------------------------------------------------------
SELECT * FROM saleslt.Address;