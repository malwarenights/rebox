#!/bin/bash

VM="rebox_w7_64"
VMHOME="$HOME/vm"
VMISODIR="$HOME/iso"
VMOSTYPE="Windows7_64"
VMISO="en_windows_7_professional_with_sp1_x64_dvd_u_676939.iso"

echo -n "==== Name of VM[$VM]: "
read I

if [ -n "$I" ] ; then
	VM="$I"
fi

echo -n "==== OSType [$VMOSTYPE]: "
read I

if [ -n "$I" ] ; then
	VMOSTYPE="$I"
fi

echo -n "==== VMHOME [$VMHOME]: "
read I

if [ -n "$I" ] ; then
	VMHOME="$I"
fi

echo -n "==== VMISODIR [$VMISODIR]: "
read I

if [ -n "$I" ] ; then
	VMISODIR="$I"
fi

#Check that dir exists
if [ ! -d "$VMISODIR" ] ; then
	echo "Directory missing: $VMISODIR"
	exit 1
fi


echo "==== List of ISO files in $VMISODIR:"
pushd "$VMISODIR"
ls *.iso *.ISO
popd

echo -n "==== VMISO [$VMISODIR]: "
read I

if [ -n "$I" ] ; then
	VMISO="$I"
fi

#Check that iso file exists
if [ ! -d "$VMISODIR" ] ; then
	echo "File missing: $VMISODIR"
	exit 2
fi


echo "===== $VM $VMHOME $VMOSTYPE $VMISODIR $VMISO"
set -x
vboxmanage list ostypes
vboxmanage createvm --name "$VM" --ostype "$VMOSTYPE" --register --basefolder "$VMHOME"
vboxmanage createhd --filename $VMHOME/$VM/$VM.vdi --size 25600
vboxmanage storagectl "$VM" --name IDE --add ide
vboxmanage storageattach "$VM" --storagectl IDE --port 0 --device 0 --type hdd \
   --medium $VMHOME/$VM/$VM.vdi
vboxmanage modifyvm "$VM" --memory 1024 --vram 128

# One device internal for host-only malware analysis
vboxmanage modifyvm "$VM" --nic1 hostonly --hostonlyadapter1 vboxnet1

# One device for external access if needed
vboxmanage modifyvm "$VM" --nic2 nat --cableconnected2 off

# boot it from one of the MS Windows installation iso images
vboxmanage storageattach "$VM" --storagectl IDE --port 1 --device 0 --type dvddrive \
   --medium "$VMISODIR/$VMISO"

vboxmanage modifyvm "$VM" --boot1 dvd --boot2 disk --boot3 none --boot4 none

#=== Add the Shared folders
# RO share used to copy data to sandbox
[ -d "$VMHOME/share_ro" ] || mkdir -p "$VMHOME/share_ro"
vboxmanage sharedfolder add "$VM" --name share_ro --hostpath "$VMHOME/share_ro" --readonly --automount

# RW used as temporary storage to get data from sandbox
[ -d "$VMHOME/share_rw" ] || mkdir -p "$VMHOME/share_rw"
vboxmanage sharedfolder add "$VM" --name share_rw --hostpath "$VMHOME/share_rw" --automount


set +x
echo "===== Connect to RDP:4489 in order to progress\nrdesktop localhost:4489"

vboxheadless --startvm "$VM" --vrde on --vrdeproperty TCP/Ports=4489

# poweroff the machine please
vboxmanage snapshot "$VM" take "baseline"





