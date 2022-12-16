#!/bin/bash

filepath=${1:-'./data'}

declare -A opponentLetters
declare -A hitForLose
declare -A hitForWin
declare -i totalPoint

opponentLetters=([A]=1 [B]=2 [C]=3)
hitForLose=([A]=3 [B]=1 [C]=2)
hitForWin=([A]=2 [B]=3 [C]=1)

totalPoint=0

while read -r line; do
    opponentHit=${line:0:1}
    action=${line:(-1)}

    if [[ $action = "Y" ]]; then
        totalPoint+=$(( ${opponentLetters[$opponentHit]} + 3 )); continue
    fi

    if [[ $action = "X" ]]; then
        totalPoint+=${hitForLose[$opponentHit]}; continue
    fi
    
    totalPoint+=$(( ${hitForWin[$opponentHit]} + 6 ))
done < $filepath

echo $totalPoint