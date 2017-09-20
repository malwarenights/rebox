rem ==== Disable the windows update service
sc config AdobeARMservice start= demand
sc stop AdobeARMservice

rem ==== Disable the windows search
sc config WSearch start= demand
sc stop WSearch

rem ==== Disable the Adobe Acrobat update service
sc config AdobeARMservice start= demand
sc stop AdobeARMservice

rem ==== Disable the restricted execution policy on Powershell
echo Set-ExecutionPolicy -ExecutionPolicy Unrestricted ; Get-ExecutionPolicy | powershell -noprofile -

rem ==== Stop queries to http://www.msftncsi.com/ncsi.txt
rem NCSI stands for Network Connectivity Status Indicator
rem http://www.techrepublic.com/blog/data-center/what-do-microsoft-and-ncsi-have-in-common/
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0x0 /f


rem ==== Disable time updates from time.windows.com
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d "localhost,0x9" /f

rem ==== Disable Java AutoUpdate Scheduled task
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v SunJavaUpdateSched /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SunJavaUpdateSched /f

