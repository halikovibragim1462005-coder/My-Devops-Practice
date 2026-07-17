#!/bin/bash

Working_Dir="/var/my_backups"
Backup_Dir=$1

if [[ -d $1 ]]; then
	echo "Function Working"
else 
	echo "Function Stopped"
	exit 1
fi

backup_func() {

local data=$(date +%Y%m%d_%H%M)
local name_dir=$(basename $1)
local full_name="backuping_${name_dir}_${data}.tar.gz" 

tar -czf "$Working_Dir/$full_name"  "$1"
echo "Exected!!"

}

backup_func "$Working_Dir"



delete_backup=$(ls -1t "$Working_Dir/backuping_"*.tar.gz | wc -l )

if (( delete_backup >= 3  )); then
	ls -1t "$Working_Dir"/back*.tar.gz | tail -n +4 | xargs rm -f
	echo "Backups_Delete!"
else
	echo "Backups not delete!"

fi

