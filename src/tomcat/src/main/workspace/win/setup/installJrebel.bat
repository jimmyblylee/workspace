@echo off

title Setup Local Development Env -- Install Jrebel

:: current folder path
set currentdir=%~sdp0

:: logger
set msg=call %currentdir:~0,-7%\dev\msg.bat
set info=%msg% info
set warn=%msg% warn
set error=%msg% error

:: Project root path
set PROJECT_HOME=%currentdir:~0,-20%

:: Folder of "workspace"
set WORKSPACE_HOME=%PROJECT_HOME%\workspace

set ZIP=%WORKSPACE_HOME%\win\7z\7z.exe

set JREBEL_HOME=%WORKSPACE_HOME%\run\jrebel
%info% "[INFO] JREBEL_HOME is " & echo %JREBEL_HOME%
if not exist %JREBEL_HOME%\jrebel.jar (
    mkdir %JREBEL_HOME% >NUL 2>NUL
    pushd %WORKSPACE_HOME%\run\
        %info% "[INFO] Unziping the zip file of jrebel..." & echo.
        %ZIP% x -o. %WORKSPACE_HOME%\files\download\jrebel-6.4.7-nosetup.zip >NUL
        %ZIP% x -ocrack %WORKSPACE_HOME%\files\download\jrebel-6.4.7-crack.zip >NUL
    popd
    move %JREBEL_HOME%\lib\jrebel.jar %JREBEL_HOME%\lib\jrebel_bak.jar >NUL
    move %WORKSPACE_HOME%\run\crack\jrebel\lib\jrebel.jar %JREBEL_HOME%\lib\jrebel.jar >NUL
    move %WORKSPACE_HOME%\run\crack\jrebel\jrebel.lic %JREBEL_HOME%\jrebel.lic >NUL
    rmdir /S /Q %WORKSPACE_HOME%\run\crack >NUL 2>NUL
)