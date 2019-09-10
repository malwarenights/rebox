@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\radare2
set PACKAGE=radare2-msvc_64-3.6.0.zip

if exist %TARGET% goto END

7z x -aoa -o%TARGET% %PACKAGE%
pushd %TARGET%\radare2-vs2017_64*
move /y *.* %TARGET%
cd ..
move radare2-vs2017_64* radare-version
rmdir %TARGET%\radare-version /s /q
popd


:END
popd
