#!/bin/bash
# Bootstrap needs to be executed on host machine before running any Virtualbox machines
# Should be executed after reboot or if vbox is not running for some time

#Remove existing DHCP server configurations
vboxmanage dhcpserver remove --ifname vboxnet0
vboxmanage dhcpserver remove --ifname vboxnet1

#Remove any existing hostonly networks
vboxmanage hostonlyif remove vboxnet0
vboxmanage hostonlyif remove vboxnet1

#Create 2 new ones
vboxmanage hostonlyif create
vboxmanage hostonlyif create

#Default VMware configuration - leave it safe for potential images to test/use
vboxmanage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0
vboxmanage dhcpserver add --ifname vboxnet0 --ip 192.168.56.100 --netmask 255.255.255.0 \
         --lowerip 192.168.56.101 --upperip 192.168.56.254 --enable

#Dedicate this one for the Cuckoo hostile networking
vboxmanage hostonlyif ipconfig vboxnet1 --ip 192.168.100.1 --netmask 255.255.255.0
vboxmanage dhcpserver add --ifname vboxnet1 --ip 192.168.100.100 --netmask 255.255.255.0 \
         --lowerip 192.168.100.101 --upperip 192.168.100.254 --enable

vboxmanage list -l hostonlyifs
vboxmanage list -l dhcpservers
