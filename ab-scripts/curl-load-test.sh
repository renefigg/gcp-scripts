#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: curl-load-test.sh number-requests concurrency delay"
    echo -e "\n"
    exit 1
fi

CONCURRENCY=$2
REQUESTS=$(( $(($1))-$(($CONCURRENCY)) ))
DELAY=$3
r=0
l=1
while [ $r -le $REQUESTS ] 
do
    for c in $(eval echo "{1..$CONCURRENCY}")  
    do 
        r=$(($r+1))
        echo "thread: $c.$l , request: $r"
        curl -d @data/payload.$n.json -H 'Content-Type: application/json' \
        -X POST \
        localhost:3000/dispatcher/notify &


    done
    l=$(($l+1))
    sleep $DELAY
done
