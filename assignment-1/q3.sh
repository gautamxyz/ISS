#!/bin/bash
file=$1
exec < $file

grep -o '\<[[s][[:alpha:]]*\>' $file | grep -v ^".a"| tr '\n' ', '|sed 's/.$//'
echo
echo .........
grep -o  '\bwh\w*' $file | tr '\n' ', '| sed 's/.$//'
echo
echo .........
grep -o '\bth\w*' $file | tr '\n' ', '|sed 's/.$//'
echo
echo .........
grep -o '\<[[a][[:alpha:]]*\>' $file | grep -v ^".n"| tr '\n' ', '|sed 's/.$//'
echo
echo .........
