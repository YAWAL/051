#!/bin/bash

##Write a simple script called 'backup.sh' to backup (i.e. copy) only files and directories which has changed within the last 24 hours. 
##Backups should be stored in a backup_dir/YYYYMMDD/, where YYYY-year, ##MM-month, DD-day_of_month. 
##The script should take 2 parameters. For example backup.sh $source_dir and $backup_dir

source_dir=$1
backup_dir=$2
TODAY="$(date +%Y%m%d)"
backup_out_dir=backup_dir/$(date +%Y%m%d)

echo ${backup_dir} && echo ${source_dir}
echo ${backup_out_dir}

mkdir backup_out_dir
cd source_dir

for i in `find . -mtime 0`
do
echo $i
cp $i backup_out_dir
done
