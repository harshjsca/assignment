#!/bin/bash
#set -xv

if [[ $# -ne 1 ]]
then
        echo "USAGE $0 filename"
        exit 1
fi

sum=0

while read line in
do
        OLD_IFS="$IFS"
        IFS=:

        i=0

        for f in $line
        do
                ((i++))
                if [ $i == 3 ]
                then
                        ((sum=sum+$f))
                        break
                fi
        done
        IFS="$OLD_IFS"
done < $1

echo $sum
