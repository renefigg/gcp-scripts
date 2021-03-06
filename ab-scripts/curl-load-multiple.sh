#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: curl-load-test.sh begin end prefix  concurrency delay url"
    echo -e "\n"
    exit 1
fi

LABEL=%NUMBER%
TEMPLATE=t1.json
BEGIN=$1
END=$2
PREFIX=$3
rm -f data/*
for i in $(eval echo "{$BEGIN..$END}")
   do
     echo -n -e "data: payload.$i.json\r"
     cat $TEMPLATE | sed "s/$LABEL/$PREFIX$i/" > data/payload.$i.json;
   done

CONCURRENCY=$4
REQUESTS=$(( $(($END - $BEGIN + 1))-$(($CONCURRENCY)) ))
DELAY=$5
URL=$6
r=$(($BEGIN - 1))
l=1
while [ $r -le $(($END - $CONCURRENCY)) ]
do
    for c in $(eval echo "{1..$CONCURRENCY}")
    do
        r=$(($r+1))
        echo -n -e "thread: $c.$l , request: $r\r"
        ./timed_curl.sh data/payload.$r.json data/out.$r.log $URL &
    done
    l=$(($l+1))
    sleep $DELAY
done
