@echo on
pushd "%~dp0"

if "%SOFTWARE%"=="" (set SOFTWARE=C:\software)
set TARGET=%SOFTWARE%\exe2aut
set PACKAGE=Exe2Aut v0.10.0.0 (2014-01-09).7z

if exist %TARGET% goto END
echo ==== Installing "%~dp0%PACKAGE%"
mkdir "%TARGET%"
7z x -o%TARGET% "%~dp0%PACKAGE%"

:END
popd
