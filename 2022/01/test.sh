#!/bin/bash

testPartOne () {
    assertEquals 24000 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 45000 $(./two.sh data_test)
}

. ../../shunit2