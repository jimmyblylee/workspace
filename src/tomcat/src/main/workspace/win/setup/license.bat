@echo off

title Setup Local Development Env -- License

:: current folder path
set currentdir=%~sdp0

:: logger
set msg=call %currentdir:~0,-7%\dev\msg.bat
set info=%msg% info
set warn=%msg% warn
set error=%msg% error

%info% "[INFO] ----------------------------------------------------------------------------" & echo.
%info% "[INFO] " & echo.
%info% "[INFO]  Local Development Environment Workspace Setup Toolkit 1.0.0-SNAPSHOT" & echo.
%info% "[INFO]  Copyright c 2006, 2016, Jimmybly Lee. All rights reserved." & echo.
%info% "[INFO] " & echo.
%info% "[INFO]  MIT License" & echo https://github.com/jimmyblylee/workspace/blob/master/LICENSE
%info% "[INFO] " & echo.
%info% "[INFO] ----------------------------------------------------------------------------" & echo.