#!/bin/bash

filepath=${1:-'./data'}
declare -i sequenceLength=4

while read -r line; do
    for i in $(seq 0 ${#line[0]}); do
        count=$(echo ${line:$i:$sequenceLength} | fold -w1 | sort | uniq | wc -l)

        if [[ $count -eq $sequenceLength ]]; then
            echo $(( i + $sequenceLength ))
            break
        fi
    done
done < $filepath
