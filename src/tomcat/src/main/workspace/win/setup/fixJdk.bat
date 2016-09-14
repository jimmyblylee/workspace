@echo off

title Setup Local Development Env -- Vlidate JDK

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

:: version of JDK which we needed
set REQUIRED_JDK_VERSION=1.8
%info% "[INFO] The JDK version requires " & %warn% "%REQUIRED_JDK_VERSION%" & echo.

if not defined JAVA_HOME (
    %error% "[ERROR] Please set system environment variable of JAVA_HOME" & echo.
    exit /b 2
)
call %WORKSPACE_HOME%\win\setup\detectJava.bat
if not exist "%JAVA_HOME%\bin\java.exe" (
    %error% "[ERROR] Please install JAVA with correct version %REQUIRED_JDK_VERSION%." & echo.
    exit /b 2
)
set "PATH=%PATH%;%JAVA_HOME%\bin"
call %WORKSPACE_HOME%\win\dev\removeDuplicate.bat "%PATH%" PATH