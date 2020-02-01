#!/bin/bash

## Use the following file: http://yoko.ukrtux.com:8899/versions.txt. 
## Write a bash script 'count_lines.sh' to find which line of this file is repeated the biggest number of times. 
## Print this line and the number of its occurrences. Example of result: 30 terraform-14.29.71
out_file='versions.txt'

curl -s http://yoko.ukrtux.com:8899/versions.txt --output $out_file
awk ' { tot[$0]++ } END {print tot[$0], $(tot[0]) } ' $out_file | sort -r
rm $out_file

