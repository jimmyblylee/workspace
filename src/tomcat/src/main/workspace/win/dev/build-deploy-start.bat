@echo off
set BASEDIR=%~sdp0
call %BASEDIR%\setEnv.bat

title Compiling
call msg info "[INFO] Compiling" & echo.
pushd %PROJECT_HOME%\src
rem    call mvn clean install
popd

pushd %PROJECT_HOME%\test
    call mvn clean install
popd


title Redeploying
call msg info "[INFO] Redeploying" & echo.
call msg info "[INFO] removing the old" & echo.
rmdir /S /Q %TOMCAT_HOME%\webapps\jbp >NUL 2>NUL
del /F /Q %TOMCAT_HOME%\webapps\jbp.war >NUL 2>NUL
call msg info "[INFO] deploying the new" & echo.
copy /Y %PROJECT_HOME%\test\test-war\target\jbp.war %TOMCAT_HOME%\webapps\jbp.war
call msg info "[INFO] done" & echo.

title Tomcat
call startJrebelDebugTomcat.bat