@echo off
REM A caller script to call and handle some errorlevels from the other scripts in the https://github.com/Vegz78/PS3FromWin repository:
REM		-WinWakePS3.bat
REM		-GIMXAdapter.bat
REM		-CapturePS3.bat
REM Just 'REM' out the respective 'CALL' lines below to remove the ones you don't want to execute in succession
REM Remember to locate the other scripts in the same folder as this one, or edit the paths below	


CALL .\WinWakePS3.bat || (CALL :ERROREXIT WinWakePS3.bat & EXIT /B 1)
CALL .\GIMXAdapter.bat || (CALL :ERROREXIT GIMXAdapter.bat & EXIT /B 1)
CALL .\CapturePS3.bat || (CALL :ERROREXIT CapturePS3.bat & EXIT /B 1)


ECHO PS3FromWin.bat executed successfully!
EXIT /B 0


:ERROREXIT
ECHO An error in %1 preventet PS3FromWin.bat from continuing...
EXIT /B