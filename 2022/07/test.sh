#!/bin/bash

testPartOne () {
    assertEquals 95437 $(./one.sh data_test)
}

testPartTwo () {
    assertEquals 24933642 $(./two.sh data_test)
}

. ../../shunit2