#!/bin/bash

testPartOne () {
    assertEquals 15 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 12 $(./two.sh data_test)
}

. ../../shunit2