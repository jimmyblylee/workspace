@echo off
set REQUIRED_VERSION_STR=%1%
set ver=%2%
set ver=%ver:~1,3%
if "%ver%" == "%REQUIRED_VERSION_STR%"  echo true>JAVA_MATCHED
