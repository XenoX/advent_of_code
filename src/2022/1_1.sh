#!/bin/bash

filepath='../../data/2022/1'

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