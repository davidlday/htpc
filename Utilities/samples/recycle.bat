@echo off
setlocal
set iFilename=%1
set recyclecmd="D:\Utilities\cmdutils\Recycle.exe"
%recyclecmd% -f %iFilename%
endlocal