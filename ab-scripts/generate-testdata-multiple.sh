#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: generate-testdata template tag begin end"
    echo "template: template file with tags"
    echo "tag: tag to replace"
    echo "begin: start number of ocurrencies" 
    echo "end: end number of ocurrencies" 
    echo "prefix: prefix character"

    echo -e "\n"
    exit 1
fi

BEGIN=$3
END=$4
PREFIX=$5
rm out.json 
mkdir data 
for i in $(eval echo "{$BEGIN..$END}") 
   do cat $1 | sed "s/$2/$PREFIX$i/" > data/payload.$i.json; 
done
 