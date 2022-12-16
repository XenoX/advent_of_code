#!/bin/bash

filepath=${1:-'./data'}

declare -A stacks=()

stacks[1]="SZPDLBFC"
stacks[2]="NVGPHWB"
stacks[3]="FWBJG"
stacks[4]="GJNFLWCS"
stacks[5]="WJLTPMSH"
stacks[6]="BCWGFS"
stacks[7]="HTPMQBW"
stacks[8]="FSWT"
stacks[9]="NCR"

while read line; do
    read count from to <<< ${line//[^0-9]/ }
    list=$(echo "${stacks[$from]: -$count}" | rev)

    stacks[$to]=${stacks[$to]}$list
    stacks[$from]=${stacks[$from]::-$count}
done < $filepath

for i in {1..9}; do
    echo -ne "${stacks[$i]: -1}"
done

echo