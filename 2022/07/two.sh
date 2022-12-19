#!/bin/bash

clean () {
    rm -rf DATA/*
    if [[ -f files_with_size ]]; then
        rm files_with_size
    fi
    if [[ -f dirs_with_size ]]; then
        rm dirs_with_size
    fi
}

clean

./one_01_build.sh $1
./two_02_list.sh
echo $(./two_03_solution.sh)

clean