#!/bin/bash

testPartOne () {
    assertEquals 11 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 26 $(./two.sh data_test)
}

. ../../shunit2