#!/bin/bash

testPartOne () {
    assertEquals 2 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 4 $(./two.sh data_test)
}

. ../../shunit2