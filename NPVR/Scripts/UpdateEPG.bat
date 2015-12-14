@Echo off
GoTo :BEGIN
=================================================================================================
UpdateEPG.bat
    Run when the EPG update begins at the time specified in Settings. Commonly used to update an
	XMLTV file used as the EPG source. No arguments.
-------------------------------------------------------------------------------------------------
Arguments:
NONE

-------------------------------------------------------------------------------------------------
Modification History
 Date    By         Description
------ ---------- -------------------------------------------------------------------------------
103015 JavaWiz    Initial Template
=================================================================================================
:BEGIN
	SETLOCAL
	Set SCRIPTNAME=%0
	Set BASEDIR=c:\Users\Public\NPVR
	Set LOGFILE=%BASEDIR%\Logs\UpdateEPG.log

	:: Roll logs once per day when the EPG update is triggered
	Call :ROLL_LOGS

	Call :LOGMSG EPG Update triggered.

	::Place your system specific commands here...
	:: Ex. code below rotates the log file when this script is run

	cd /d "D:\Utilities\zap2xml\"
	"D:\Utilities\zap2xml\NextPVREPG.bat"

	GoTo :EXITJOB

--------------------------------------------------------------
:ROLL_LOGS
	Call :LOGMSG Logs rolled.
    If EXIST %LOGFILE%.4 COPY %LOGFILE%.4 %LOGFILE%.5 > nul
    If EXIST %LOGFILE%.3 COPY %LOGFILE%.3 %LOGFILE%.4 > nul
    If EXIST %LOGFILE%.2 COPY %LOGFILE%.2 %LOGFILE%.3 > nul
    If EXIST %LOGFILE%.1 COPY %LOGFILE%.1 %LOGFILE%.2 > nul
    If EXIST %LOGFILE%   MOVE %LOGFILE% %LOGFILE%.1   > nul
	GoTo :EOF

--------------------------------------------------------------
:LOGMSG
    echo %*
    echo %date:~4% %time% [%SCRIPTNAME%] %* >> %LOGFILE%
    Goto :EOF

--------------------------------------------------------------
:EXITJOB
	Exit /b