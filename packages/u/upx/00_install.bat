@echo off
pushd "%~dp0"

set DESTDIR=c:\software\
set TARGET=%DESTDIR%unxutils
set PACKAGE=upx393w.zip

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
