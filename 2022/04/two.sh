#!/bin/bash

declare -i not_overlaps=0 overlaps=0
filepath=${1:-'./data'}

while read line; do
    read -r set1 set2 <<< $(echo $line | tr ',' ' ')
    read -r f1 f2 <<< $(echo $set1 | tr '-' ' ')
    read -r s1 s2 <<< $(echo $set2 | tr '-' ' ')

    if [[ $f1 -gt $s2 ]]; then (( not_overlaps++ )); fi
    if [[ $s1 -gt $f2 ]]; then (( not_overlaps++ )); fi   

    (( overlaps++ ))
done < $filepath

echo $(( overlaps - not_overlaps ))