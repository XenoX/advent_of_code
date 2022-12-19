#!/bin/bash

declare -i total=0 sum=0

for i in $(find ./DATA -type d); do
    sum=0
    for j in $(grep "$i/" ./files_with_size | awk '{print $2}'); do
        sum=$(( sum + j ))
    done

    if [[ $sum -le 100000 ]]; then
        total=$(( total + sum ))
    fi
done

echo $total
