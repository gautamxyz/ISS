inputfile="$1"
wordfile="$2"
key="$3"
touch q4output.txt
touch duplicate.txt
cp $1  duplicate.txt

for word in $(<"$2") 
do
{
sed -i "s/\b$word\b//g" duplicate.txt
}
done

awk '{$1=$1};1' duplicate.txt > /dev/null

exec < duplicate.txt
while read line
do
num=`echo $line | grep -o $key | wc -l`
den=`echo $line | wc -w`
frq=`echo $num/$den | bc -l `
echo $line, $frq
done > q4output.txt
