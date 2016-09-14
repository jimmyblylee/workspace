@echo off
title Registering the datasources by the Configuration of server.xml and context.xml
set BASEDIR=%~dp0
call %BASEDIR%\setEnv.bat >NUL

xcopy /Y %WORKSPACE_FOLDER%\common\jdbc\* %TOMCAT_HOME%\conf\ >NUL 2>NUL