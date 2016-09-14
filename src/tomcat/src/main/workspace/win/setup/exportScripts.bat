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

:: read the ini config file
set CONF_INI_FILE=%currentdir:~0,-11%\conf\env.ini
%info% "[INFO] Try to read the ini configuration file" & echo %CONF_INI_FILE%
if exist %currentdir:~0,-11%\conf\env.ini (
    %info% "[INFO] Found env.ini by " & echo %WORKSPACE_HOME%\conf\env.ini
    for /F "tokens=*" %%I in (%CONF_INI_FILE%) do (
        %info% "[INFO] Found variable by env.ini - " & %warn% "%%I" & echo.
        set %%I
    )
) else (
    %warn% "[NOTICE] No ini configuration file has been found!" & echo.
    %warn% "[NOTICE] Variable will be set as default!" & echo.
)

:: Project Name
if not defined PROJECT_NAME (
    %warn% "[NOTICE] PROJECT_NAME has not been set, will be set with FOO as Default!" & echo.
    set PROJECT_NAME=FOO
)

:: Export Scripts
mkdir "%PROJECT_HOME%\dev" >NUL 2>NUL
xcopy /Y %WORKSPACE_HOME%\win\dev\* %PROJECT_HOME%\dev\ >NUL 2>NUL

echo @echo off> "%PROJECT_HOME%\dev\setEnv.bat"

echo rem set ----------- TOMCAT_HOME homes>> "%PROJECT_HOME%\dev\setEnv.bat"  
echo set "TOMCAT_HOME=%TOMCAT_HOME%">> "%PROJECT_HOME%\dev\setEnv.bat"


echo rem set ----------- %PROJECT_NAME% homes>> "%PROJECT_HOME%\dev\setEnv.bat"
echo set "PROJECT_NAME=%PROJECT_NAME%">> "%PROJECT_HOME%\dev\setEnv.bat"
echo set "PROJECT_HOME=%PROJECT_HOME%">> "%PROJECT_HOME%\dev\setEnv.bat"
echo set "WORKSPACE_HOME=%WORKSPACE_HOME%">> "%PROJECT_HOME%\dev\setEnv.bat"

echo rem set ----------- java env>> "%PROJECT_HOME%\dev\setEnv.bat"  
echo set "JAVA_HOME=%JAVA_HOME%">> "%PROJECT_HOME%\dev\setEnv.bat"
echo set "JAVA_VENDOR=Sun">> "%PROJECT_HOME%\dev\setEnv.bat"
echo if defined JAVA_HOME set "PATH=%%PATH%%;%%JAVA_HOME%%\bin">> "%PROJECT_HOME%\dev\setEnv.bat"
echo java -d64 -version ^>NUL 2^>NUL>> "%PROJECT_HOME%\dev\setEnv.bat"
echo set JAVA_USE_64BIT=true>> "%PROJECT_HOME%\dev\setEnv.bat"
echo call "%%PROJECT_HOME%%\dev\removeDuplicate.bat" "%%PATH%%" PATH>> "%PROJECT_HOME%\dev\setEnv.bat"
echo call "%%PROJECT_HOME%%\dev\removeDuplicate.bat" "%%CLASSPATH%%" CLASSPATH>> "%PROJECT_HOME%\dev\setEnv.bat"
echo call "%%PROJECT_HOME%%\dev\cleanJAVAOPTIONS.bat">> "%PROJECT_HOME%\dev\setEnv.bat"

echo set "JREBEL_HOME=%JREBEL_HOME%">> "%PROJECT_HOME%\dev\setEnv.bat"

echo :End>> "%PROJECT_HOME%\dev\setEnv.bat"

:: Print Environment Variables
%info% "[INFO] ---------------------------" & echo.
%info% "[INFO] Environment Variables" & echo.
%info% "[INFO] The Project Name is " & %warn% "%PROJECT_NAME%" & echo.
%info% "[INFO] The Project Home is " & echo %PROJECT_HOME%
%info% "[INFO] The JDK version requires " & %warn% "%REQUIRED_JDK_VERSION%" & echo.
%info% "[INFO] The TOMCAT_HOME is " & echo "%TOMCAT_HOME%"
%info% "[INFO] The JREBEL_HOME is " & echo "%JREBEL_HOME%"
%info% "[INFO] The JAVA_HOME is " & echo "%JAVA_HOME%"
%info% "[INFO] The PATH is " & echo %PATH%%
%info% "[INFO] ---------------------------" & echo.