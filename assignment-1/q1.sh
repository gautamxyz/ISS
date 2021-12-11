#!/bin/bash
file="$1"
exec < $file
while read line
do
echo $line | sed -e :a -e 's/\(....\)[^#]/\1#/;ta' >> q1_output.txt
done

