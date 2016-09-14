@echo off
set BASEDIR=%~sdp0
call %BASEDIR%\setEnv.bat

echo removing the old
rmdir /S /Q %TOMCAT_HOME%\webapps\jbp >NUL 2>NUL
del /F /Q %TOMCAT_HOME%\webapps\jbp.war >NUL
echo deploying the new
copy /Y %PROJECT_HOME%\test\test-war\target\jbp.war %TOMCAT_HOME%\webapps\jbp.war
echo done
timeout /t 1 >NUL 