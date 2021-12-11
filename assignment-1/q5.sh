#!/bin/bash
path="$1"
echo "Directories:"

counter(){
for file in "$1"/*
do
if [ -d "$file" ]
then
{
echo ${file##*/}"," `find $file -type f | wc -l` "file(s)" >> q5.txt
counter "$file"
}
fi
done
}
cd "$1"
> q5.txt
counter .
awk '{x=NF-1;print $x ,$0}' q5.txt|sort  -rn| cut -f2- -d' '


echo
echo "Files:"


ls -SlR $1|grep '^-'|grep -v "/$"|sort -k 5 -rn|awk '{print $NF}'

