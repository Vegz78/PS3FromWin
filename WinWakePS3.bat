@echo off
REM A script to remotely power on a PS3 from a Windows PC via a Linux device's Bluetooth radio, from https://github.com/Vegz78/PS3FromWin
REM This script requires https://github.com/Vegz78/WakePS3 to run on the Linux device
REM Remember to edit the global variables to fit your requirements before executing   


REM Gobal variables
SET "REMOTEUSER="	&REM The username to log on with to the remote device harboring the _WakePS3.sh script
SET "REMOTEPASSWORD="	&REM NB!: UNSAFE AND NOT RECOMMENDED, but you may use password here for disabling all interaction in script execution
SET "REMOTEHOST=192.168.0.1"	&REM IP address or host name of the remote device harboring the _WakePS3.sh script
SET "REMPATHCOMMAND=/../../_WakePS3.sh"	&REM The path and name of the script file to execute remotely
SET "PS3IP=192.168.0.2"	&REM The IP address of the PS3 if static and available
SET "PINGCOUNT=10"	&REM Number of times to try to ping the PS3 before exiting script


REM Check if PS3 already is on
ping -n 1 "%PS3IP%" | FINDSTR /R /C:"[0-9] *ms"

IF %ERRORLEVEL% == 0 (
	GOTO :FINISHSCRIPT
)


REM Turn on PS3 over Linux with the remotely executed script _WakePS3.sh
IF NOT "%REMOTEPASSWORD%"=="" (plink -batch %REMOTEUSER%@%REMOTEHOST% -pw %REMOTEPASSWORD% %REMPATHCOMMAND%) ELSE (plink %REMOTEUSER%@%REMOTEHOST% %REMPATHCOMMAND%)

REM Alternative without the plink no-spoofing interactive RETURN-prompt
REM NOT "%REMOTEPASSWORD%"=="" (plink -batch %REMOTEUSER%@%REMOTEHOST% -pw %REMOTEPASSWORD% %REMPATHCOMMAND%) ELSE (plink -no-antispoof %REMOTEUSER%@%REMOTEHOST% %REMPATHCOMMAND%)


REM Wait until PS3 is powered on and responds on the network
SET COUNTER=1
:PINGTHEPS3
ECHO Pinging the PS3...(%COUNTER%/%PINGCOUNT%)
ping -n 1 "%PS3IP%" | FINDSTR /R /C:"[0-9] *ms"
IF %ERRORLEVEL% == 0 (
	GOTO :FINISHSCRIPT
) ELSE (
	SET /A COUNTER=COUNTER+1
	IF %COUNTER%==%PINGCOUNT% (GOTO :EXITSCRIPT) ELSE (GOTO :PINGTHEPS3)
)


:EXITSCRIPT
ECHO PS3 not found within set ping count, exiting script
CALL :EXITING
EXIT /B 1

:FINISHSCRIPT
ECHO PS3 online!...
CALL :EXITING
EXIT /B 0


:EXITING
REM Subroutine that clears all used variables
SET "COUNTER="
SET "REMOTEUSER="
SET "REMOTEPASSWORD="
SET "REMOTEHOST="
SET "REMPATHCOMMAND="
SET "PS3IP="
SET "PINGCOUNT="
EXIT /B