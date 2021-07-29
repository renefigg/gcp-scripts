#!/bin/bash

# Generate Test Data for ab
if [ -z "$1" ]; then
    echo -e "\n use: ab-load-test.sh number-requests concurrent-requests"
    echo -e "\n"
    exit 1
fi

ab -n $1 -c $2 -p out.json -T application/json -rk https://0.0.0.0:4000/
