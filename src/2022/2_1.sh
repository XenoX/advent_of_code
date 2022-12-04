#!/bin/bash

filepath='../../data/2022/2'

declare -A letters
declare -i totalPoint

letters=([X]=1 [Y]=2 [Z]=3)

draws=("A X" "B Y" "C Z")
loses=("B X" "C Y" "A Z")
totalPoint=0

while read -r line; do
    hit=${line:(-1)}
    index=${letters[$hit]}

    if [[ ${draws[$(( index - 1 ))]} = $line ]]; then
        totalPoint+=$(( $index + 3 )); continue
    fi

    if [[ ${loses[$(( index -1 ))]} = $line ]]; then
        totalPoint+=$index; continue
    fi
    
    totalPoint+=$(( $index + 6 ))
done < $filepath

echo $totalPoint