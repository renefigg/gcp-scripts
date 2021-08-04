#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: timed_curl.sh payload_file out_file  url"
    echo -e "\n"
    exit 1
fi

ini=$(date +%s%N);
curl -s -d @$1 -H 'Content-Type: application/json' -X POST "$3" >> $2
fin=$(date +%s%N)
printf ' \n' >> $2
echo "milisecons: " $((($fin - $ini)/1000000)) >> $2
