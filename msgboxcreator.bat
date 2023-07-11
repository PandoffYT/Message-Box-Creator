@echo off
color B
title Message Box Creator (run as %username%)
rem FUNCTION TO SET SOME VARIABLES AND WRITE FOLDERS !

if exist "%TEMP%/MSGBOXCREATOR/tmp/" (
    del /q /f %TEMP%\MSGBOXCREATOR\tmp
    echo del tmp
    goto logs_info
) else (

    goto logs_info
)

if exist "%TEMP%/MSGBOXCREATOR" (
    echo folder aldready exist, skipping !
    goto logs_info
) else (
    md %temp%\MSGBOXCREATOR
    echo folder has been created
)



:logs_info
md %temp%\MSGBOXCREATOR\tmp\
cls
echo %username% used Message Box Creator on %time% and on the %date% ! > %temp%/MSGBOXCREATOR/logs.txt
echo.
echo Logs have been writen at
echo.
echo %temp%/MSGBOXCREATOR/logs.txt (if not, run the program as administrator !)
echo.
echo (the logs looks like this :)
echo %username% used Message Box Creator on %time% and on the %date%
echo ________________________________________________________________________________________________________________________
echo.
echo (a backup of the msgbox is created in %temp%/MSGBOXCREATOR/tmp/)
echo.
echo.
pause
:main_wel
cls
set title=Pando

echo ===============================
echo.                   -----
echo MSG Box Creator By %title%
echo                    -----
echo ===============================
echo.
echo.
echo Hi, how can i help you today ?
echo.
echo Create an MSG box (1) or quit (2) ?
echo ___________________________________
echo.
choice /c 12
if %errorlevel% equ 1 goto yes_msgboxcreator
if %errorlevel% equ 2 goto exit_fromchoice
pause

rem UNUSED 
:msg_box_creator
cls
echo You choosed "Create an MSG Box", it is right ? (Yes(1),No(2))
choice /c 12
if %errorlevel% equ 1 goto yes_msgboxcreator
if %errorlevel% equ 2 goto main_wel

:yes_msgboxcreator
cls
echo.
echo ===========================
echo                 ----
echo     CHOOSE YOUR ICON
echo                 ----
echo ===========================
echo.
echo.
echo Warning icon (1)
echo Critical icon (2)
echo Information icon (3)
echo Help icon (4)
echo.
choice /c 1234
if %errorlevel% equ 1 set icon=48
if %errorlevel% equ 2 set icon=16
if %errorlevel% equ 3 set icon=64
if %errorlevel% equ 4 set icon=32
cls
echo.
echo ===========================
echo                 ------
echo     CHOOSE YOUR BUTTON
echo                 ------
echo ===========================
echo.
echo.
echo OK Button (0) 
echo OK / Cancel Button (1)
echo Abort / Retry / Ignore Button (2)
echo Yes / No / Cancel Button (3)
echo Yes / No Button (4)
echo Retry / Cancel Button (5)
echo.
choice /c 012345
if %errorlevel% equ 0 set btn=5
if %errorlevel% equ 1 set btn=4
if %errorlevel% equ 2 set btn=3
if %errorlevel% equ 3 set btn=2
if %errorlevel% equ 4 set btn=1
if %errorlevel% equ 5 set btn=0
cls
echo.
set /p boxtitle="Enter the Msg Box's title : "
cls
echo.
set /p boxcontent="Enter the content of the Msg Box (enter will confirm) : "
cls
echo.
set /p pathcall="Enter how you would name the program:  "
cls
echo.
echo X=MsgBox("%boxcontent%",%btn%+%icon%,"%boxtitle%") > %TEMP%/MSGBOXCREATOR/tmp/msg1.vbs
cls
echo.
echo So, it should look like this ...
timeout 1
start %temp%/MSGBOXCREATOR/tmp/msg1.vbs
echo.
echo Does it looks good ? YES (1) NO (2)
choice /c 12
if %errorlevel% equ 1 goto pathsaveask
if %errorlevel% equ 2 goto yes_msgboxcreator

:pathsaveask
cls
echo.
echo Do you want to save it where the program was opened (1) or specify de path manualy (2)
echo.
choice /c 12
if %errorlevel% equ 1 goto saveopened
if %errorlevel% equ 2 goto specpath

:saveopened
cls
echo X=MsgBox("%boxcontent%",%btn%+%icon%,"%boxtitle%") > %pathcall%.vbs
echo.
echo The msgbox has been saved at %~dp0/%pathcall%.vbs
goto open_auto

:specpath
cls
echo.
set /p pathman="Enter the correct full path ("C:/Users/%username%/Desktop" for example, WITHOUT THE FILE NAME !) :  "
echo X=MsgBox("%boxcontent%",%btn%+%icon%,"%boxtitle%") > %pathman%/%pathcall%.vbs
cls
echo.
echo Thanks you, redirecting.
goto open_man




:exit_fromchoice
cls
echo.
echo Are you sure to quit ? Yes (1) or No (2)
echo.
choice /c 12
if %errorlevel% equ 1 del %TEMP%/MSGBOXCREATOR/tmp/ & exit
if %errorlevel% equ 2 goto main_wel

:exit_fromend
cls
echo.
echo Are you sure to quit ? Yes (1) or No (2)
echo.
choice /c 12
if %errorlevel% equ 1 del %TEMP%/MSGBOXCREATOR/tmp/ & exit
if %errorlevel% equ 2 goto main_wel

:open_man
cls
start %pathman%/%pathcall%.vbs
echo THE MSGBOX SHOULD BE OPENED
pause
goto end_true_savemanually

:open_auto
cls
start %pathcall%.vbs
echo THE MSGBOX SHOULD BE OPENED
pause
goto end_true_savewherecmdstart

:end_true_savewherecmdstart
cls
echo Congrats ! You made a Message Box in VBS !
echo.
echo The save path is %~dp0/%pathcall%.vbs
echo.
start https://ytpando.000webhostapp.com/msgbox/help/1.png
echo (tip: to modify the file: (navigator should open in a few))
echo.
echo Would you like to make another (1) or quit (2)
echo.
choice /c 12
if %errorlevel% equ 1 goto msg_box_creator
if %errorlevel% equ 2 exit

:end_true_savemanually
cls
echo Congrats ! You made a Message Box in VBS !
echo.
echo The save path is %pathman%/%pathcall%.vbs
echo.
start https://ytpando.000webhostapp.com/msgbox/help/1.png
echo (tip: to modify the file: (navigator should open in a few))
echo.
echo Would you like to make another (1) or quit (2)
echo.
choice /c 12
if %errorlevel% equ 1 goto msg_box_creator
if %errorlevel% equ 2 exit
