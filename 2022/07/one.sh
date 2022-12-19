#!/bin/bash

clean () {
    rm -rf DATA/*
    if [[ -f files_with_size ]]; then
        rm files_with_size
    fi
}

clean

./one_01_build.sh $1
./one_02_list.sh
echo $(./one_03_solution.sh)

clean