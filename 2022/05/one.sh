#!/bin/bash

filepath=${1:-'./data'}
declare -i separatorLine=0 currentLine=0

setSeparatorLine () {
    while read -r line; do
        if [[ -z $line ]];then break; fi
        ((separatorLine++))
    done < $filepath
}

setSeparatorLine

while read -r line; do
    if [[ $currentLine -lt $separatorLine ]];then
        # Stocks
        IFS=' ' read -ra crates <<< $line
        echo ${crates[1]}
        break 2
        # for i in "${crates[@]}"; do
        #     echo $i
        # done
    fi
    if [[ $currentLine -gt $separatorLine ]];then
        # Actions
        echo $line
    fi
    ((currentLine++))
done < $filepath

echo $currentLine
