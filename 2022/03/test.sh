#!/bin/bash

testPartOne () {
    assertEquals 157 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 70 $(./two.sh data_test)
}

. ../../shunit2