#!/bin/bash

fs=70000000
need=30000000
used=$(cat dirs_with_size | head -1 | cut -d" " -f2)

free=$(( fs - used ))
missing=$(( need - free ))

for i in $(find ./DATA -type d); do
    sum=0
    for j in $(grep "$i/" ./files_with_size | awk '{print $2}'); do
        sum=$(( sum + j ))
    done

    if [[ $sum -ge $missing ]]; then
        echo "$i $sum"
    fi
done | sort -k2 -n | head -1 | cut -d" " -f2