#!/bin/bash

if [ -z $1 ]; then
    echo 'You must specify year at least. eg: `./make.sh 2023` or `./make.sh 2023 05`'
    exit 1
fi

if [[ $1 && $2 ]]; then
    mkdir $1/$2

    touch $1/$2/one.sh && chmod +x $1/$2/one.sh
    touch $1/$2/two.sh && chmod +x $1/$2/two.sh
    touch $1/$2/test.sh && chmod +x $1/$2/test.sh

    touch $1/$2/data
    touch $1/$2/data_test
else
    mkdir $1
fi