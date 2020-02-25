# Remote-Deploy
Remote Disk tools


Currently at work there are a lot of systems with low space. This is because the systems are old and someone cheaped out and purchased a bunch of 128GB SSD's for company laptops. Now I'm the guy that get's to clone them to new HHDs and stay late a few times a week.


Required Tools
1. psexec.exe for remote code exec (duh)
2. windirstat.exe (I found it was faster to use windirstat and use the full unc pach).




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



