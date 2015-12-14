@Echo off
GoTo :BEGIN
=================================================================================================
PostProcessing.bat 
    Run as soon as a recording ends. Commonly used for adding commercial skipping functionality 
	(comskip) or transcoding. 
	
	This example calls ImageGrabLite to rename the recording
	
-------------------------------------------------------------------------------------------------
Arguments: 
1.filename        - the full path and file name of the recording file. 
2.channelNumber   - the channel number it was recorded from. 
3.oid             - unique identifier to the scheduled_recordings table, applicable even if 
                    filename (%1) changes 
4.capture Oid     - unique identifier to the device used for recording 
5.recording title - the title of the recording 

-------------------------------------------------------------------------------------------------
Modification History
 Date    By         Description
------ ---------- -------------------------------------------------------------------------------
103015 JavaWiz    Initial Template
=================================================================================================
:BEGIN
	SETLOCAL
	Set SCRIPTNAME=%0
	Set BASEDIR=C:\Users\Public\NPVR
	Set LOGFILE=%BASEDIR%\Logs\PostProcessing.log
	Set IGLite="C:\Program Files\NPVR\imageGrabLite.exe"
	
	Set FILENAME=%1
	Set CH_NUM=%2
	Set OID=%3
	Set DEV_OID=%4
	Set REC_TITLE=%5
	
	Set hbProfile="High Profile"
	Set handbrakecmd="C:\Program Files\Handbrake\HandBrakeCLI.exe"
	:: Set hbFilename=%FILENAME:.ts=.m4v%
	Set hbTemp=D:\NextPVR\Temp\
	Set hbExtension=.m4v
	Set hbFilename="%hbTemp%%~n1%hbExtension%"
	Set finalFile="%~dpn1%hbExtension%"

	Call :LOGMSG Recording complete - filename: %FILENAME%  ChannelNUM: %CH_NUM%  OID: %OID%  DeviceOID: %DEV_OID%  Title: %REC_TITLE%
	
	:: Ensure no other HandBrakeCLI.exe process is running.
	Call :LOGMSG Checking for other Handbrake processes...

	:: Make sure no other instances of HandBrakeCLI.exe are running.
	:WAITFOR
		tasklist /FI "IMAGENAME eq HandBrakeCLI.exe"|find /I /N "HandBrakeCLI.exe" >NUL
		if "%ERRORLEVEL%"=="0" (
			Ping 1.1.1.1 -n 1 -w 10000 >NUL
			GoTo :WAITFOR
		)

	:: Transcode File
	Call :LOGMSG Transcoding file %FILENAME% to %hbFilename% using preset %hbProfile%.
	start "Encoding" /wait /MIN /low %handbrakecmd% -i %FILENAME% -o %hbFilename% --preset=%hbProfile% || Call :LOGMSG ERROR - Transcode failed!

	:: Move transcoded file to original location
	Call :LOGMSG Moving %hbFilename% to %finalFile%
	move /Y %hbFilename% %finalFile% || Call :LOGMSG ERROR - Move failed!

	:: Delete original file.
	Call :LOGMSG Deleting original file: %FILENAME%.
	del /F /Q %FILENAME% || Call :LOGMSG ERROR - Delete failed!

	GoTo :EXITJOB

--------------------------------------------------------------	
:LOGMSG
    echo %*
    echo %date:~4% %time% [%SCRIPTNAME%] %* >> %LOGFILE%
    Goto :EOF
	
--------------------------------------------------------------	
:EXITJOB
	Exit /b