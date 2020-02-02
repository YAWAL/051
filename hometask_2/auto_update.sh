#!/bin/bash

## Write a script 'auto_update.sh' which will install updates for your Linux system every week. 
## The updated log file should be stored in /var/log/update-YYYYMMDD.log, where YYYY-year, MM-month, DD-day_of_month.
##***Extra task: configure log rotation to update-YYYYMMDD.log every month and keep the last 3 log files compressed.

(sudo apt-get update && sudo apt-get -y upgrade) | sudo tee /var/log/update-"$(date +"%Y%m%d")".log 
crontab -l > mycron
echo "* * * * 7 $pwd/auto_update.sh" >> mycron
crontab mycron
rm mycron