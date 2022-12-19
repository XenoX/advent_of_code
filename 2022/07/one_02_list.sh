#!/bin/bash

for i in $(find ./DATA -type f); do
    echo "$i $(stat -c %s $i)"
done > files_with_size