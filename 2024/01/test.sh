#!/bin/bash

testPartOne () {
    assertEquals 11 "$(./one.sh data_test)"
}

testPartTwo () {
    assertEquals 31 "$(./two.sh data_test)"
}

. ../../shunit2