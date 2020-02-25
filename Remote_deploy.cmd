@echo off
cls
echo :::::::::::::::::::::::::::::::::::::::::: 
echo :: Support Framework - Target Selection :: 
echo ::   Made with love, by Dave xoxoxo     ::
echo ::::::::::::::::::::::::::::::::::::::::::
echo.
set WorkingDIR=%cd%
cd %cd%
set /p system=Pleae enter the system name:
goto menu
:menu
cls
echo :: Remote Support Framework - Client options ::
echo Please make a selection:
echo.
echo [1] Open C Drive in Windows Explorer
echo [2] Get Disk Usage
echo [3] Run disk cleanup on remote system
echo [4] Check for SMART HDD errors
echo [0] Exit
set /p startchoice=Enter your choice:
if %startchoice%==1 goto c_drive
if %startchoice%==2 goto disk_usage
if %startchoice%==3 goto disk_cleanup
if %startchoice%==4 goto disk_smart
if %startchoice%==0 goto exit


:c_drive
C:\Windows\explorer.exe \\%system%\c$
goto menu

:disk_usage
windirstat.exe \\%system%\c$
goto menu

:disk_cleanup
PsExec.exe \\%system% c:\windows\SYSTEM32\cleanmgr.exe /d C: /VERYLOWDISK
goto menu

:disk_smart
copy smartctl.exe \\%system%\c$\temp\smartctl.exe
PsExec.exe \\%system% -a C:

:exit
exit
