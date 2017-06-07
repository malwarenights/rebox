echo ==== Right click in explorer, Run as Administrator
echo ==== Or Start / cmd / right click / Run as Administrator


echo ==== Disable UAC
%windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f


echo ==== Mount the shares from the VirtualBox
net use r: \\vboxsvr\share_ro /persistent:yes
net use w: \\vboxsvr\share_rw /persistent:yes

echo ==== Create couple of user identities
net user admin01 admin01 /add
net localgroup administrators admin01 /add
net user admin02 admin02 /add
net localgroup administrators admin01 /add

net user power01 power01 /add
net localgroup "power users" power01 /add
net user power02 power02 /add
net localgroup "power users" power02 /add

net user user01 user01 /add
net user user02 user02 /add
net user user03 user03 /add
net user user04 user04 /add
net user user05 user05 /add

echo ==== Autologin with one of the admin accounts
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_DWORD /d 0x1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "admin01" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "admin01" /f

echo ==== Disable system restore on the system drive to save some space
wmic /namespace:\\root\default path SystemRestore call Disable %SystemDrive%

echo ==== Enable RDP in case it is not
wmic rdtoggle where ServerName="%COMPUTERNAME%" CALL SetAllowTSConnections 1, 1

echo ==== Disable automatic updates
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f

echo ==== Configure kernel mode debugging
set DEBUGDONE=0
bcdedit /enum | findstr debugger && set DEBUGDONE=1
if "%DEBUGDONE%"=="1" goto DEBUGDONE

bcdedit /copy {current} /d "Windows [debugger disabled]"
bcdedit /debug {current} ON
bcdedit /set {current} debugtype SERIAL
bcdedit /set {current} debugport 1
bcdedit /set {current} baudrate 115200
bcdedit /timeout 4


:DEBUGDONE
echo ==== Enable users to RDP
wmic rdpermissions where TerminalName="RDP-Tcp" CALL AddAccount "%USERNAME%",1

echo ==== Tweak the file explorer
rem ===== Configures Explorer to show hidden files, folders and drives
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SuperHidden /t REG_DWORD /d 0x1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SuperHidden /t REG_DWORD /d 0x1 /f
rem ===== Configures Explorer to show protected operating system files
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0x1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0x1 /f
rem ===== Configures Explorer to show extensions of known files types
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0x0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0x0 /f
rem ===== Configures Explorer to prevent windows from being automatically arranged when moved to the edge of the screen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v FullPath /t REG_DWORD /d 0x1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v FullPath /t REG_DWORD /d 0x1 /f


echo ==== Install telnet client
pkgmgr /iu:"TelnetClient"
pkgmgr /iu:"TFTP"

