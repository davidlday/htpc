@Echo off
GoTo :BEGIN
=================================================================================================
Wait for a process to end.
=================================================================================================
:BEGIN
	Echo Begin.
	Call :WAITFOR %1 %2
	Echo Finished.


:WAITFOR
	tasklist /FI "IMAGENAME eq %1"|find /I /N "%1" >NUL
	if "%ERRORLEVEL%"=="0" (
		Echo %1 is running. Sleeping for %2 ms
		Ping 1.1.1.1 -n 1 -w %2 >NUL
		GoTo :WAITFOR
	)

