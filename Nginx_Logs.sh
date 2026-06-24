#!/bin/bash

log_file="/var/log/nginx/Myown.log"
User=$1

if [[ $# -eq  0 ]]; then 
	TOP= cut -d" " -f9 $log_file | sort | uniq -c | sort -k2 | head -n 5
	echo "$TOP"
else
	TOP= grep  "$1" $log_file | awk -F" " '{print $9,$1,$7,$11 }'
	echo "$TOP"



fi
