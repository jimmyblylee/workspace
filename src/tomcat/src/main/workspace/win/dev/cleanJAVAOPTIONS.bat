@echo off
if "%OLD_JAVA_OPTIONS%x" == "x" goto firstRun
set JAVA_OPTIONS=%OLD_JAVA_OPTIONS%
goto end
:firstRun
 set OLD_JAVA_OPTIONS=%JAVA_OPTIONS%
 
:end