@echo off
set /p THREADS="Kolichestvo potokov: "
for /l %%i in (1,1,%THREADS%) do (
	start --COMPILE--.bat
	ping -n 2 localhost>Nul
)