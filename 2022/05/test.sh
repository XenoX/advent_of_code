#!/bin/bash

testPartOne () {
    assertEquals "CMZ" $(./one.sh data_test)
}

# testPartTwo () {
#     assertEquals 70 $(./two.sh data_test)
# }

. ../../shunit2