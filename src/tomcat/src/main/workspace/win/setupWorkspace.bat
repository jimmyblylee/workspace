@echo off

title Setup Local Development Env

:: current folder path
set currentdir=%~sdp0

:: logger
set msg=call %currentdir:~0,-1%\dev\msg.bat
set info=%msg% info
set warn=%msg% warn
set error=%msg% error

:: Project root path
set PROJECT_HOME=%currentdir:~0,-14%

:: Folder of "workspace"
set WORKSPACE_HOME=%PROJECT_HOME%\workspace

%info% "[INFO] Starting to setup Local Development Environment!" & echo.

call %WORKSPACE_HOME%\win\setup\license.bat
call %WORKSPACE_HOME%\win\setup\downloadFiles.bat
call %WORKSPACE_HOME%\win\setup\fixJdk.bat
call %WORKSPACE_HOME%\win\setup\installJrebel.bat
call %WORKSPACE_HOME%\win\setup\installTomcat.bat
call %WORKSPACE_HOME%\win\setup\exportScripts.bat
call %WORKSPACE_HOME%\win\setup\usage.bat

%info% "[INFO] Local Development Environment has been setup!" & echo.

timeout /t 1 >NUL 
call %WORKSPACE_HOME%\win\dev\beep.bat
timeout /t 1 >NUL 
call %WORKSPACE_HOME%\win\dev\beep.bat
timeout /t 1 >NUL 
call %WORKSPACE_HOME%\win\dev\beep.bat
timeout /t 1 >NUL 
pause>NUL