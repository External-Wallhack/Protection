@echo off

setlocal EnableDelayedExpansion
set charSets=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

:: DELETE OLD FILES ::
del injector.exe
del blackmode.exe
del "G:\work\C++\PROTECT\RELEASE\*.dll"

:: COPY NEW COMPILED FILES ::
Copy "G:\work\C++\External-WallHack-SAMP\Release\External-WallHack-SAMP.exe" "G:\work\C++\PROTECT\injector.exe"

:: START ::
set /p BUILD_COUNTS="Kolichestvo kopiy: "

Set _BuildCount=%BUILD_COUNTS%
:BuildLoop
	echo --------------------------------------------------
	echo Generate Random Name
	echo --------------------------------------------------
	set buffer=% %
	set count=0
	set /a length=15

	:Loop
	set /a count+=1
	set /a rand=%Random%%%69
	set buffer=!buffer!!charSets:~%rand%,1!
	if !count! leq !length! goto Loop
	
	echo Rename OUTPUTED files
	
	:: PROTECTING ::
	echo --------------------------------------------------
	echo Protecting [%_BuildCount%]
	echo --------------------------------------------------
	VMProtect.exe injector.exe RELEASE\%buffer%.dll -pf Settings.vmp

	Set buffer=% %
	Set /A _BuildCount-=1
If %_BuildCount% GTR 0 GoTo BuildLoop

timeout /t 2
