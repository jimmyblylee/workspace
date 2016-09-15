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

set ZIP=%WORKSPACE_HOME%\win\7z\7z.exe

set TOMCAT_HOME=%WORKSPACE_HOME%\run\tomcat
set TOMCAT_NAME=apache-tomcat-9.0.0.M10
set TOMCAT_ZIP=%TOMCAT_NAME%-windows-x64.zip

%info% "[INFO] Installing Tomcat." & echo.
if not exist %TOMCAT_HOME%\bin (
    pushd %WORKSPACE_HOME%\run\
        %ZIP% x -o. %WORKSPACE_HOME%\files\download\%TOMCAT_ZIP% >NUL
        rename %TOMCAT_NAME% tomcat
    popd
    rmdir /S /Q %TOMCAT_NAME%\webapps\docs
    rmdir /S /Q %TOMCAT_NAME%\webapps\examples
    rmdir /S /Q %TOMCAT_NAME%\webapps\host-manager
    rmdir /S /Q %TOMCAT_NAME%\webapps\manager
    rmdir /S /Q %TOMCAT_NAME%\webapps\ROOT
    if exist %WORKSPACE_HOME%\common\tomcat (
        xcopy /Y /e /h %WORKSPACE_HOME%\common\tomcat %TOMCAT_HOME% >NUL 2>NUL
    )
)