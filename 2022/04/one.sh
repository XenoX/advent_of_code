#!/bin/bash

declare -i total=0
filepath=${1:-'./data'}

while read line; do
    read -r set1 set2 <<< $(echo $line | tr ',' ' ')
    read -r f1 f2 <<< $(echo $set1 | tr '-' ' ')
    read -r s1 s2 <<< $(echo $set2 | tr '-' ' ')

    if [[ $f1 -le $s1 ]] && [[ $f2 -ge $s2 ]]; then (( total++ ));
    elif [[ $s1 -le $f1 ]] && [[ $s2 -ge $f2 ]]; then (( total++ )); fi   
done < $filepath

echo $total