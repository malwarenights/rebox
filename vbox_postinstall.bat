rem ==== Disable the windows update service
sc config wuauserv start= demand
sc stop wuauserv

rem ==== Disable the windows search
sc config WSearch start= demand
sc stop WSearch

rem ==== Disable the Adobe Acrobat update service & task
sc config AdobeARMservice start= demand
sc stop AdobeARMservice
schtasks.exe /change /TN "Adobe Acrobat Update Task" /disable

rem ==== Disable the Windows Defender
sc config WinDefend start= demand
sc stop WinDefend

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
taskkill /f /im "jusched.exe"

rem ==== Disable Noisy tasks
schtasks.exe /change /disable /TN "Adobe Acrobat Update Task"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Application Experience\AitAgent"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks.exe /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
schtasks.exe /change /disable /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
schtasks.exe /change /disable /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
schtasks.exe /change /disable /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
schtasks.exe /change /disable /TN "\Microsoft\Windows Defender\MP Scheduled Scan"

rem ==== Silence the network communication
rem wireshark filter: not ssdp and not browser and not nbns and not dhcpv6 and not icmpv6
rem ==== Disable Netbios over TCPIP
wmic nicconfig where TcpipNetbiosOptions=0 call SetTcpipNetbios 2

rem ==== isatap.example.com
rem http://winteladmin.com/disable-tunnelisatap-adapter/
netsh int ipv6 isatap set state disabled

rem ==== LLMNR - Link Local Multicast Name Resolution searching for local network computers
rem join/leave group 224.0.0.252
rem IGMPv3 , LLMNR ...
rem https://ask.wireshark.org/questions/2039/why-am-i-seeing-lots-of-traffic-to-2240022
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v EnableMulticast /t REG_DWORD /d 0x0 /f

rem ==== SSDP - Simple Service Discovery Protocol
rem IGMPv3 239.255.255.250 , [FF02::C]
rem https://support.microsoft.com/en-us/help/317843/traffic-is-sent-after-you-turn-off-the-ssdp-discover-service-and-unive
reg add "HKLM\Software\Microsoft\DirectPlayNATHelp\DPNHUPnP" /v UPnPMode /t REG_DWORD /d 0x2 /f
sc config UPNPHOST start= demand
sc config SSDPSRV start= demand
sc stop UPNPHOST
sc stop SSDPSRV

rem ==== WS-Discovery - Web Services Dynamic Discovery
rem IGMPv3 239.255.255.250, port 3702
sc config HomeGroupProvider start= demand
sc stop HomeGroupProvider
sc config fdPHost start= demand
sc stop fdPHost
sc config fdResPub start= demand
sc stop fdResPub

rem ==== Disable the Media Player PnP sharing
sc config WMPNetworkSvc start= demand
sc stop WMPNetworkSvc

rem ==== processhacker
rem wj32.org, processhacker.sourceforge.net

rem ==== windows update
rem ctldl.windowsupdate.com
rem ctldl.windowsupdate.nsatc.net
rem crl.microsoft.com
rem www.microsoft.com
rem clienttemplates.content.office.net
rem odc.officeapps.live.com
rem roaming.officeapps.live.com
rem templateservice.office.com

rem ==== Immunity Debugger
rem auth.immunityinc.com
rem debugger.immunityinc.com
echo # silence Immunity Debugger >> c:\windows\system32\drivers\etc\hosts
echo 127.0.0.1 auth.immunityinc.com >> c:\windows\system32\drivers\etc\hosts
echo 127.0.0.1 debugger.immunityinc.com >> c:\windows\system32\drivers\etc\hosts


rem ==== Cleanup the event logs
wevtutil cl application
wevtutil cl setup
wevtutil cl system
wevtutil cl security



