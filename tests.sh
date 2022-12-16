#!/bin/bash

if [ -z $1 ]; then
    echo 'You must specify year at least. eg: `./tests.sh 2023`'
    exit 1
fi

while read day; do
    if [ -f "./$1/$day/test.sh" ]; then
        cd $1/$day
        echo "---- RUN TESTS FOR DAY $day ----"
        ./test.sh
        cd - 1>/dev/null
    fi
done <<< $(ls $1)