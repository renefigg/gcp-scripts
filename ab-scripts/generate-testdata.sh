#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: generate-testdata template tag number"
    echo "template: template file with tags"
    echo "tag: tag to replace"
    echo "number: number of ocurrencies" 
    echo -e "\n"
    exit 1
fi

END=$3
rm out.json 
for i in $(eval echo "{1..$END}") 
   do cat $1 | sed "s/$2/$i/" >> out.json; 
done
 