@echo off
pushd "%~dp0"

set DESTDIR=c:\software\
set TARGET=%DESTDIR%unxutils

if exist "%TARGET%" goto END

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /d "%PATH%;%TARGET%" /f

echo ===== unpack the main unxutils package
7z x -aoa -o%TARGET% UnxUtils.zip
rem move bin files (actually just shell) to the main folder
move /y %TARGET%\bin\*.exe c:\software\unxutils

rem delete quietly the bin directory 
rmdir %TARGET%\bin /s /q

rem move wbin executables to the main folder
move /y %TARGET%\usr\local\wbin\*.exe c:\software\unxutils
rem delete quietly the usr directory
rmdir /q %TARGET%\usr /s /q

echo  ===== unpack the unxutils updates
7z x -aoa -o%TARGET% UnxUpdates.zip

echo  ===== unpack the checksums from the coreutils
7z x -aoa -o%TARGET% sums-6.11.zip

echo  ===== unpack the hasdeep
7z x -aoa -o%TARGET% md5deep-4.4.zip
move /y %TARGET%\md5deep-4.4\*.exe %TARGET%
rmdir %TARGET%\md5deep-4.4 /s /q

echo  ===== rename find to gnufind
move /y %TARGET%\find.exe %TARGET%\gnufind.exe

:END
popd
