#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: curl-load-test.sh begin end prefix  concurrency delay url"
    echo -e "\n"
    exit 1
fi

<<<<<<< HEAD
LABEL=%NUMBER%
TEMPLATE=t1.json
BEGIN=$1
END=$2
PREFIX=$3
rm -f data/*
for i in $(eval echo "{$BEGIN..$END}")
   do cat $TEMPLATE | sed "s/$LABEL/$PREFIX$i/" > data/payload.$i.json;
done

CONCURRENCY=$4
REQUESTS=$(( $(($END - $BEGIN + 1))-$(($CONCURRENCY)) ))
DELAY=$5
URL=$6
r=$(($BEGIN - 1))
l=1
while [ $r -le $(($END - $CONCURRENCY)) ]
=======
CONCURRENCY=$2
REQUESTS=$1
DELAY=$3
r=0
l=1
rm -Rf output
mkdir output
while [ $r -le $REQUESTS ]
>>>>>>> badce0305ffa2e921b75e9b3568a15ca288ddc04
do
    for c in $(eval echo "{1..$CONCURRENCY}")
    do
        r=$(($r+1))
<<<<<<< HEAD
        echo -n -e "thread: $c.$l , request: $r\r"
        curl -s -d @data/payload.$r.json -H 'Content-Type: application/json' -X POST "$6" > data/out.$r.log &
=======
        echo -n  -e "thread:$l , request: $r/$REQUESTS \r" 
        curl localhost > output/result.$r.html & 
#       curl -d @data/payload.$r.json -H 'Content-Type: application/json' -X POST "$4" &
>>>>>>> badce0305ffa2e921b75e9b3568a15ca288ddc04
    done
    l=$(($l+1))
    sleep $DELAY
done
