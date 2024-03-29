#!/bin/bash

filepath=${1:-'./data'}

calories=0
while read -r line; do
    if [ -n "$line" ]; then
        calories=$(( $calories + $line ))
    else
        totals[${#totals[@]}]=$calories
        calories=0
    fi
done < $filepath

sorted_totals=($(tr ' ' '\n' <<< "${totals[@]}" | sort -n))

echo $(( ${sorted_totals[-1]} + ${sorted_totals[-2]} + ${sorted_totals[-3]} ))