@echo off
setlocal
set FILENAME=%1
set hbExtension=.m4v
set iFilename=%1
set oFilename=%iFilename:.ts=!hbExtension!%
echo Output File is: %oFilename%
set hbTemp=D:\NextPVR\Temp\
set hbFilename="%hbTemp%%~n1%hbExtension%"
echo handbrake file is: %hbFilename%

echo original file without quotes: %~1
echo fully qualified path name: "%~f1"
echo drive letter only: %~d1
echo path only: %~p1
echo drive and path: %~dp1
echo file name only: %~n1
echo file extension only: %~x1
echo path containing short names only: %~s1
echo file attributes of file: %~a1
echo date and time of file: %~t1
echo size of file: %~z1


endlocal