#!/bin/bash

filepath=${1:-'./data'}

declare -i total=0

awk '{print $1}' "$filepath" | sort -n > column_one
awk '{print $2}' "$filepath" | sort -n > column_two

paste column_one column_two > sorted && rm column_one && rm column_two

while read -r line; do
    total+=$(echo "$line" | awk '{print $1 - $2}' | tr -d '-')
done < './sorted'

rm sorted

echo $total