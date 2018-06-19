@echo off
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=%SystemDrive%\software)
set TARGET=%SOFTWARE%\upx
set PACKAGE=upx394w.zip

if exist "%TARGET%\upx.exe" goto END

echo  ===== unpack the upx to %TARGET%
7z x -aoa -o%TARGET% %PACKAGE%
pushd %TARGET%\upx*w
move /y *.exe %TARGET%
cd ..
move upx*w upxdir
rmdir %TARGET%\upxdir /s /q
popd


:END
popd
