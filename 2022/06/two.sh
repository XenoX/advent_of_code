#!/bin/bash

filepath=${1:-'./data'}
declare -A sequence
declare -i sequenceLength=14 i=0 n=0

while read -r line; do
    i=0
    while [ $i -lt ${#line[0]} ]; do
        sequence=${line:$i:$sequenceLength}

        n=0
        while [ $n -lt $sequenceLength ]; do
            if [[ $sequence =~ ${sequence:n:1}.*${sequence:n:1} ]]; then
                ((i++))
                continue 2
            fi
            
            if [[ $n -eq $((sequenceLength-1)) ]]; then
                echo $((i+$sequenceLength))
                break 2
            fi

            ((n++))
        done

        ((i++))
    done
    break
done < $filepath
