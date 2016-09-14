@echo off

title Setup Local Development Env -- prepare Env Variable

:: current folder path
set currentdir=%~sdp0

:: logger
set msg=call %currentdir:~0,-7%\dev\msg.bat
set info=%msg% info
set warn=%msg% warn
set error=%msg% error

set REQUIRED_VERSION_STR=%REQUIRED_JDK_VERSION%
set JAVA_MATCHED=false
del ver 2>NUL
%JAVA_HOME%\bin\java -version 2>ver
del JAVA_MATCHED 2>NUL
FOR /F "tokens=2*" %%A IN (ver) DO (
  call %WORKSPACE_HOME%\win\setup\checkVersion.bat %REQUIRED_VERSION_STR% %%B
)
del ver 2>NUL
if exist JAVA_MATCHED goto end

call %error% "[ERROR] current version of sdk while running this script is not match the request version %REQUIRED_VERSION_STR%, and will try to find a matched one from regedit"
FOR /F "skip=2 tokens=2*" %%A IN ('REG QUERY "HKLM\Software\JavaSoft\Java Development Kit\%REQUIRED_VERSION_STR%" /v JavaHome') DO set JAVA_HOME=%%B

:end
del JAVA_MATCHED 2>NUL
call %info% "[INFO] JAVA_HOME is" & echo %JAVA_HOME%