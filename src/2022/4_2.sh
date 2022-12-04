#!/bin/bash

isOverlap () {
    local IFS='-'
    read -ra splittedRangeOne <<< $1
    read -ra splittedRangeTwo <<< $2

    local fsStart=${splittedRangeOne[0]}
    local fsStop=${splittedRangeOne[1]}
    local ssStart=${splittedRangeTwo[0]}
    local ssStop=${splittedRangeTwo[1]}

    if [[ $fsStop -lt $ssStart || $fsStart -gt $ssStop ]]; then
        return 0
    fi

    return 1
}

filepath='../../data/2022/4'
declare -i total
IFS=','

while read -r line; do
    read -ra splittedSection <<< $line
    firstSection=${splittedSection[0]}
    secondSection=${splittedSection[1]}

    result=$(isOverlap $firstSection $secondSection)
    if [ $? -eq 1 ]; then
        total+=1
    fi
done < $filepath

echo $total