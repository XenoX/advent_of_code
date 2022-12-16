#!/bin/bash

filepath=${1:-'./data'}

calories=0
most=0
while read -r line; do
    if [ -n "$line" ]; then
        calories=$(( $calories + $line ))
    else
        if [ $calories -gt $most ]; then
            most=$calories
        fi
        calories=0
    fi
done < $filepath

echo $most