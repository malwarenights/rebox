https://msdn.microsoft.com/en-us/library/windows/hardware/ff551063%28v=vs.85%29.aspx
62f4d37581cb6c9fffa29d18d6f5a750  dbg_x86_6.5.3.8.exe	- comes from https://www.microsoft.com/en-us/download/details.aspx?id=11800


http://www.microsoft.com/whdc/devtools/debugging/default.mspx
http://msdl.microsoft.com/download/symbols/debuggers/dbg_x86_6.5.3.8.exe
http://msdl.microsoft.com/download/symbols/debuggers/dbg_x86_6.11.402.msi

http://www.brighthub.com/computing/windows-platform/articles/29860.aspx
In the WinDbg window, select File → Symbol File Path. In the "Symbol Search Path" dialog, enter
SRV*f:\symbols*http://msdl.microsoft.com/download/symbols
SRV*f:\symbols*http://msdl.microsoft.com/download/symbols


==== Sownload symbols
https://support.microsoft.com/en-us/kb/311503
symchk /r c:\windows\system32 /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols

#For notepad.exe
symchk /r c:\windows\system32\ntdll.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\kernel32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\kernelbase.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\advapi32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\msvcrt.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\sechost.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\rpcrt4.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\gdi32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\user32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\lpk.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\usp10.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\comlg32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\shlwapi.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r C:\Windows\WinSxS\x86_microsoft.windows.common-controls_6595b64144ccf1df_6.0.7601.17514_none_41e6975e2bd6f2b2\COMCTL32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\SHELL32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\winspool.drv /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\ole32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\oleaut32.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
symchk /r c:\windows\system32\version.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols


================ Mona
https://github.com/corelan/windbglib
regsvr32.exe "%ProgramFiles%\Common Files\microsoft shared\VC\msdia90.dll"

symchk /r c:\windows\system32\ntdll.dll /s SRV*c:\symbols*http://msdl.microsoft.com/download/symbols

http://expdev-kiuhnm.rhcloud.com/2015/05/19/mona-2/
.load pykd.pyd
!py mona

http://expdev-kiuhnm.rhcloud.com/2015/05/26/exploitme1-ret-eip-overwrite/
