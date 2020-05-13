@echo off
REM A script to find and set up GIMX on the correct COM-ports of up to two GIMX adapters connected to a Windows PC, from https://github.com/Vegz78/PS3FromWin
REM This script requires GIMX installed and 1 or 2 GIMX Adapters, or the like
REM Remember to edit the global variables to fit your requirements before executing 


REM Gobal variables
REM GIMX controller profiles can be downloaded from here: https://github.com/matlo/GIMX-configurations/tree/master/Windows
SET "CONTROLLERPROFILE=X360Pad.xml"	&REM Name of the controller profile you're using for your Gimx adapter(s)


REM Find up to two GIMX adapters and assign to variables, GIMXCOM1 and/or GIMXCOM2
FOR /F "tokens=1" %%i IN ('chgport ^| FINDSTR "Silabser"') DO (call :SUBSETCOMPORTS %%i)
GOTO :CONTINUESCRIPT

:SUBSETCOMPORTS
REM Subroutine that sets the com port variables
IF "%GIMXCOM1%"=="" (SET "GIMXCOM1=%1") ELSE (SET "GIMXCOM2=%1")
REM echo %GIMXCOM1% og %GIMXCOM2%
EXIT /B


:CONTINUESCRIPT
REM Setup up to two GIMX-adapters connected between PC and PS3
IF "%GIMXCOM1%"=="" IF "%GIMXCOM2%"=="" (GOTO :NOADAPTERS)
IF NOT "%GIMXCOM1%"=="" IF "%GIMXCOM2%"=="" (GOTO :ONEADAPTER) 
IF NOT "%GIMXCOM1%"=="" IF NOT "%GIMXCOM2%"=="" (GOTO :TWOADAPTERS)


:NOADAPTERS
ECHO No adapters found, exiting...
CALL :EXITING
EXIT /B 1

:ONEADAPTER
ECHO One adapter found, starting GIMX...
START gimx --nograb -c %CONTROLLERPROFILE% -p %GIMXCOM1%
CALL :EXITING
EXIT /B 0

:TWOADAPTERS
ECHO Two adapters found, starting GIMX...
START gimx --nograb -c %CONTROLLERPROFILE% -p %GIMXCOM1% -p %GIMXCOM2%
CALL :EXITING
EXIT /B 0


:EXITING
REM Subroutine that clears all used variables
SET "CONTROLLERPROFILE="
SET "GIMXCOM1="
SET "GIMXCOM2="
EXIT /B