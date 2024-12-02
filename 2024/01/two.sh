#!/bin/bash

filepath=${1:-'./data'}

declare -i total=0

while read -r number; do
    pow=$(awk -v num="$number" '$2 == num {count++} END {print count}' "$filepath")  

    total+=$((number*pow))
done < <(awk '{print $1}' "$filepath")

echo $total