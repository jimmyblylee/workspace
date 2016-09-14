@echo off
set BASEDIR=%~sdp0
call %BASEDIR%\setEnv.bat

pushd %TOMCAT_HOME%\bin
startup.bat