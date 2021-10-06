#!/bin/bash

num=$1
mount_point=/mnt/${num}_tier/

case $num in
	"first")
		uuid="6d16a956-33ce-4c9f-95dc-1dbf66602262"
	;;
	"second")
		uuid="a76bcb68-f7bf-4fc2-b153-6519a9ba6c9b"
	;;
	"third")
		uuid=""
	;;
	*)
		echo "device exisitiert nicht!"
		exit
	;;
esac

mountpoint -q /mnt/${num}_tier
if [ $? -ne 0 ]; then
	cryptsetup open /dev/disk/by-uuid/$uuid ${num}_tier --key-file /root/luks_keys/${num}_tier
	mount /dev/mapper/${num}_tier /mnt/${num}_tier/
fi
