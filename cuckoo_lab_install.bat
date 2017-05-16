rem @echo off
rem Bare minimum to be able to run automated sandbox analysis

pushd "%~dp0"
set SOFTWARE=%SystemRoot%\software

echo ===== create dir %SOFTWARE%
if not exist %SOFTWARE% mkdir %SOFTWARE%


echo ===== install 7zip to be able to unzip files
rem install to c:\software\7zip\7z.exe
rem cd utl\7zip\
call utl\7zip\00_install.bat

set PATH=%PATH%;%SOFTWARE%\7zip


echo ===== install unxutils
rem expects 7zip is installed in the c:\software\7zip\7z.exe
call utl\unxutils\00_install.bat
call utl\upx\00_install.bat

set PATH=%PATH%;%SOFTWARE%\unxutils

echo ========================= Runtime
call devel\msvsruntime\00_install.bat
call devel\msdotnet\00_install.bat

echo ========================= Utilities
call utl\far\00_install.bat


popd
