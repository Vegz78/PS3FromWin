@echo off
REM A script to run a HDMI capture card application, so that you can play your PS3 (remotely) on your Windows PC, from https://github.com/Vegz78/PS3FromWin
REM This script requires a capture card and capture card application installed on the PC
REM Remember to edit the global variables to fit your requirements before executing 

REM Gobal variables
SET "CAPTUREAPP=C:\Program Files\Elgato\GameCapture\GameCapture.exe"	&REM The HDMI capture card application


ECHO Starting HDMI Capture application...
START "" "%CAPTUREAPP%"


:EXITING
REM Subroutine that clears all used variables
SET "CAPTUREAPP="