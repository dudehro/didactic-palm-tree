#!/bin/bash
#script=$(readlink -f $0)
#scriptpath=`dirname $script`

path_to_pw_db=/home/dude/4tb/@aktuell/@syncthing/KeePass

mkdir -p $path_to_pw_db/daily_backup/$(date +%Y_%m_%d)
cp $path_to_pw_db/accounts.kdbx $path_to_pw_db/daily_backup/$(date +%Y_%m_%d)
