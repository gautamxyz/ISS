#!/bin/bash
file=$1
exec < $file
#while read line
#do
#sed 's/[0-9/]//g'|tr -d '\n'> q2_output.txt
#echo "$name" >> q2_output.txt
#birthdate=`sed 's/[^0-9]//d' age.txt`
birthdate=`sed 's/[^0-9/]//g' $file`
TODAY=$(date +"%d/%m/%Y")
echo $TODAY
echo $birthdate
#tmpDays=$(  $(( $(date -u -d"$TODAY" +"%s") - $(date -u -d"$birthdate" +"%s")))  )
tmpDays=$( printf '%s' $(( $(date -u -d "$TODAY" +%s) - $(date -u -d "$birthdate" +%s)))  )
echo $tmpdays
age=$(( $tmpDays / 60 / 60 / 24 / 364 ))
#echo "$tmpDays"
#age=$(( $tmpDays / 60 / 60 / 24 / 364 ))
echo $age
#echo "$age" > q2_output.txt
echo "$name $age" >> q2_output.txt

#done

