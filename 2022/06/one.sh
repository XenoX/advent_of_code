#!/bin/bash

filepath=${1:-'./data'}
declare -A sequence
declare -i sequenceLength=4

while read -r line; do
    i=0
    while [ $i -lt ${#line[0]} ]; do
        sequence=${line:$i:$sequenceLength}

        if [[
            $sequence =~ ${sequence:0:1}.*${sequence:0:1} || 
            $sequence =~ ${sequence:1:1}.*${sequence:1:1} ||
            $sequence =~ ${sequence:2:1}.*${sequence:2:1}
        ]]; then
            ((i++))
            continue
        fi

        echo $((i+$sequenceLength))
        break
    done
done < $filepath
