#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: curl-load-test.sh number-requests concurrency delay url"
    echo -e "\n"
    exit 1
fi

CONCURRENCY=$2
REQUESTS=$1
DELAY=$3
r=0
l=1
rm -Rf output
mkdir output
while [ $r -le $REQUESTS ]
do
    for c in $(eval echo "{1..$CONCURRENCY}")
    do
        r=$(($r+1))
        echo -n  -e "thread:$l , request: $r/$REQUESTS \r" 
        curl localhost > output/result.$r.html & 
#       curl -d @data/payload.$r.json -H 'Content-Type: application/json' -X POST "$4" &
    done
    l=$(($l+1))
    sleep $DELAY
done
