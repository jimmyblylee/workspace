@echo off
set file=%~nx1
title Setup Local Development Env -- Downloading %file:~0,-4%

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

set ARIA=%WORKSPACE_HOME%\win\get\aria2c.exe -c -x 16 -j 10 -s 10

%info% "[INFO] Downloading file %file:~0,-4%" & echo.

set /P url= < %WORKSPACE_HOME%\files\%file%
set filename=%file:~0,-4%

pushd %WORKSPACE_HOME%\files\download
    if not exist "%WORKSPACE_HOME%\files\download\%filename%" (
        if exist "%WORKSPACE_HOME%\files\%filename%.ref" (
            set /P ref= < %WORKSPACE_HOME%\files\%filename%.ref
            %ARIA% -o %filename% "%url%" --referer="%ref%"
        ) else (
            %ARIA% -o %filename% "%url%"
        )
    ) 
    %WORKSPACE_HOME%\files\md5sum.exe -c %WORKSPACE_HOME%\files\%filename%.md5
popd