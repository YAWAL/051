#!/bin/bash

out_file='versions.txt'

curl -s http://yoko.ukrtux.com:8899/versions.txt --output $out_file
awk ' { tot[$0]++ } END { for (i in tot) print i } ' $out_file | sort
rm $out_file

