#!/bin/bash

num=$1
mount_point=/mnt/${num}_tier/
cryptsetup open /dev/disk/by-uuid/ ${num}_tier --key-file /root/luks_keys/${num}_tier
if [ ! -d $mount_point ]; then
	mkdir -p /mnt/${num}_tier/
fi
mount /dev/mapper/${num}_tier /mnt/${num}_tier/
