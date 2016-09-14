@echo off

title Setup Local Development Env -- Install Tomcat

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

echo.
echo.
echo.
%warn% "[NOTICE] ---------------------------" & echo.
%warn% "[NOTICE] Usage" & echo.
%warn% "[NOTICE] Stop Tomcat by" & echo %PROJECT_HOME%\dev\stopTomcat.bat 
%warn% "[NOTICE] Start Tomcat by" & echo %PROJECT_HOME%\dev\startWebLogic.bat 
%warn% "[NOTICE] Start Tomcat with jrebel by" & echo %PROJECT_HOME%\dev\startJrebelTomcat.bat 
%warn% "[NOTICE] Start Tomcat in debug mode by" & echo  %PROJECT_HOME%\dev\startDebugTomcat.bat 
%warn% "[NOTICE] Start Tomcat in debug mode with jrebel by" & echo  %PROJECT_HOME%\dev\startJrebelDebugTomcat.bat 
%warn% "[NOTICE] Build by" & echo %PROJECT_HOME%\dev\cleanbuild.bat 
%warn% "[NOTICE] Redeploy by" & echo %PROJECT_HOME%\dev\redeploy.bat 
%warn% "[NOTICE] ---------------------------" & echo.