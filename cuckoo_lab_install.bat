rem @echo off
rem Bare minimum to be able to run automated sandbox analysis

pushd "%~dp0"
set SOFTWARE=%SystemDrive%\software

echo ===== create dir %SOFTWARE%
if not exist %SOFTWARE% mkdir %SOFTWARE%


echo ===== install 7zip to be able to unzip files
rem install to c:\software\7zip\7z.exe
rem cd utl\7zip\
call packages\7\7zip\00_install.bat

set PATH=%PATH%;%SOFTWARE%\7zip


echo ========================= Runtime
call packages\m\msvsruntime\00_install.bat
call packages\m\msdotnet\00_install.bat
call packages\j\jre8\00_install.bat

echo ========================= Common Applications
call packages\a\adobereader\00_install.bat



echo ===== 
echo ===== install unxutils
rem expects 7zip is installed in the c:\software\7zip\7z.exe
call packages\u\unxutils\00_install.bat
call packages\u\upx\00_install.bat

set PATH=%PATH%;%SOFTWARE%\unxutils

echo ========================= Utilities
call packages\f\far\00_install.bat


popd
