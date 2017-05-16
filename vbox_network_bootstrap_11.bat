@rem Should be executed on guest #1
netsh interface ip set address "Local Area Connection" static 192.168.100.11 255.255.255.0 192.168.100.1 1
netsh interface ip set dns "Local Area Connection" static 192.168.100.1
net use r: \\vboxsvr\share_ro
net use w: \\vboxsvr\share_rw

