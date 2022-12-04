#!/bin/bash

isInRange () {
    local IFS='-'
    read -ra splittedRangeOne <<< $1
    read -ra splittedRangeTwo <<< $2

    local fsStart=${splittedRangeOne[0]}
    local fsStop=${splittedRangeOne[1]}
    local ssStart=${splittedRangeTwo[0]}
    local ssStop=${splittedRangeTwo[1]}

    if [[ $fsStart -le $ssStart && $fsStop -ge $ssStop ]]; then
        return 1
    fi

    if [[ $fsStart -ge $ssStart && $fsStop -le $ssStop ]]; then
        return 1
    fi

    return 0
}

filepath='../../data/2022/4'
declare -i total
IFS=','

while read -r line; do
    read -ra splittedSection <<< $line
    firstSection=${splittedSection[0]}
    secondSection=${splittedSection[1]}

    result=$(isInRange $firstSection $secondSection)
    if [ $? -eq 1 ]; then
        total+=1
    fi
done < $filepath

echo $total