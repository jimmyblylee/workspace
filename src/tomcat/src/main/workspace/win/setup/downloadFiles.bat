@echo off

title Setup Local Development Env -- Downloading files

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

set CONF_INI_FILE=%WORKSPACE_HOME%\conf\env.ini
if exist %WORKSPACE_HOME%\conf\env.ini (
    for /F "tokens=*" %%I in (%CONF_INI_FILE%) do (
        set %%I
    )
)

if not defined RESOURCES_LOCAL_PATH (
    SET RESOURCES_LOCAL_PATH=NONE
    %info% "[INFO] There is no RESOURCES_LOCAL_PATH in env.ini or system environment variable"
) else (
    %info% "[INFO] Found RESOURCES_LOCAL_PATH " & echo %RESOURCES_LOCAL_PATH%
)

if not exist %WORKSPACE_HOME%\files\download mkdir %WORKSPACE_HOME%\files\download

for /R "%WORKSPACE_HOME%\files" %%i in (*.url) do (
    if "NONEa"=="%RESOURCES_LOCAL_PATH%a" (
        call %WORKSPACE_HOME%\win\setup\aria2c.bat %%i
    ) else (
        if exist "%RESOURCES_LOCAL_PATH%\%%~ni" (
            %info% "[INFO] Downloading %%~ni " & echo.
            if not exist "%WORKSPACE_HOME%\files\download\%%~ni" (
                %info% "[INFO] Copying %%~ni by " & echo "%WORKSPACE_HOME%\files\download\%%~ni"
                copy /Y "%RESOURCES_LOCAL_PATH%\%%~ni" "%WORKSPACE_HOME%\files\download\%%~ni" >NUL
            )
            pushd %WORKSPACE_HOME%\files\download
                %WORKSPACE_HOME%\files\md5sum.exe -c %WORKSPACE_HOME%\files\%%~ni.md5
            popd
        ) else (
            %info% "[INFO] It will download by network because no file named %%~ni has been found in " & echo %RESOURCES_LOCAL_PATH%
            call %WORKSPACE_HOME%\win\setup\aria2c.bat %%i
        )
    )
)