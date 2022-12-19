#!/bin/bash

for i in $(find ./DATA -type f); do
    echo "$i $(stat -c %s $i)"
done > files_with_size

for i in $(find ./DATA -type d); do
    sum=0
    for j in $(grep "$i/" ./files_with_size | awk '{print $2}'); do
        sum=$(( sum + j ))
    done

    echo "$i $sum" >> ./dirs_with_size
done