#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
first_host=$(echo $1 | grep -oh '{.*}' | cut -f2 -d{ | cut -f1 -d.)
last_host=$(echo $1 | grep -oh '{.*}' | cut -f2 -d{ | cut -f1 -d} | cut -f3 -d.)
main_body=$(echo $1 | grep -oh '^.*{'  | cut -d{ -f1)
port80=80
port443=443
ip=$(echo $main_body$last_host)

while [ $first_host -le $last_host ]
do
    timeout 0.5 nc -z -v $main_body$first_host $port80 > /dev/null 2>&1 && echo -e "$main_body$first_host: port 80 is ${RED}OPEN${NC}"
    timeout 0.5 nc -z -v $main_body$first_host $port443 > /dev/null 2>&1 && echo "$main_body$first_host: port 443 is OPEN"
    first_host=$(($first_host+1))
done 