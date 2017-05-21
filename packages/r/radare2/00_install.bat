@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET="%SOFTWARE%\radare2"
set PACKAGE=radare2-w32-1.5.0-git.zip

if exist %TARGET% goto END

7z x -aoa -o%TARGET% %PACKAGE%
pushd %TARGET%\radare2-w32*
move /y *.* %TARGET%
cd ..
move radare2-w32* radare-version
rmdir %TARGET%\radare-version /s /q
popd


:END
popd
