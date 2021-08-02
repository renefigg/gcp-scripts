#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: generate-testdata template tag begin end prefix out-file"
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
OUT_FILE=$6
echo "[" > $OUT_FILE
for i in $(eval echo "{$BEGIN..$END}")
   do cat $1 | sed "s/$2/$PREFIX$i/" >> $OUT_FILE;
      if [ $i -ne $END ]; then
        echo "," >> $OUT_FILE;
      fi
done
echo "]" >> $OUT_FILE
