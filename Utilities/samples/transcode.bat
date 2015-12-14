@echo off
setlocal
set hbProfile="High Profile"
set handbrake="C:\Program Files\Handbrake\HandBrakeCLI.exe"
set iFilename=%1
set oFilename=%iFilename:.ts=.m4v%
%handbrake% -i %iFilename% -o %oFilename% --preset=%hbProfile%