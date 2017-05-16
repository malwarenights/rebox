@echo on
pushd "%~dp0"

set TARGET=c:\software\exe2aut
set PACKAGE=Exe2Aut v0.10.0.0 (2014-01-09).7z

if exist %TARGET% goto END
echo ==== Installing "%~dp0%PACKAGE%"
mkdir "%TARGET%"
C:\software\7zip\7z x -o%TARGET% "%~dp0%PACKAGE%"

:END
popd
