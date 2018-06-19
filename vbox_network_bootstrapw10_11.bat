@rem Should be executed on guest #1
netsh interface ip set address "Ethernet" static 192.168.100.11 255.255.255.0 192.168.100.1 1
netsh interface ip set dns "Ethernet" static 192.168.100.1
net use r: \\vboxsvr\share_ro
net use w: \\vboxsvr\share_rw

