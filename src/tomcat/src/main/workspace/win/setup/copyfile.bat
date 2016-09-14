@echo off
set file=%~nx1
title Setup Local Development Env -- Copying %file:~0,-4%

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

%info% "[INFO] Copying file %file%" & echo.

set /P url= < %file%
set filename=%file:~0,-4%


set CONF_INI_FILE=%WORKSPACE_HOME%\conf\env.ini
if exist %WORKSPACE_HOME%\conf\env.ini (
    for /F "tokens=*" %%I in (%CONF_INI_FILE%) do (
        set %%I
    )
)

if not defined RESOURCES_LOCAL_PATH (
    SET RESOURCES_LOCAL_PATH="NONE"
)