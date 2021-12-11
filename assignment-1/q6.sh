#!/bin/bash
file='contacts.csv'
if [ -f "$file" ]
then
{
g=0
}
else 
{
touch "contacts.csv"
echo "fname","lname","mobile","office" >> contacts.csv
}
fi

while getopts ":C:k:f:l:n:o:v:c:d:a:" flag;do
case $flag in
C) C=$OPTARG;;
f) f=$OPTARG;;
l) l=$OPTARG;;
n) n=$OPTARG;;
o) o="$OPTARG";;
k) k=$OPTARG;;
c) c=$OPTARG;;
v) v=$OPTARG;;
d) awk  'NR > 1 {print $0 | "sort -k1 -nr"}' contacts.csv
   exit 0;;
a) awk 'NR > 1 {print $0 | "sort -k1"}' contacts.csv
   exit 0;;
*) echo "enter correct flags" ;exit ;;
esac

done
if [[ "$C" == "insert" ]]
then
{
#echo "done"
printf '%s\n' $f $l $n "$o" | paste -sd ',' >> contacts.csv
}

elif [[ "$C" == "edit" ]]
then
{

awk -F ',' -v OFS=',' -v fedited="$k" -v fname="$f" -v lname="$l" -v mobile="$n" -v office="$o" '$1==fedited {$1=fname; $2=lname; $3=mobile; $4=office}1' contacts.csv > tmp && mv tmp contacts.csv 
exit
}
else
{
exit
}

fi

exit
