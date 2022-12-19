#!/bin/bash

filepath=${1:-'./data'}

while read -r line; do
    if [[ $line =~ ^\$.* ]]; then # COMMAND
        if [[ $line =~ ^\$\ ls$ ]]; then # LS
            continue
        elif [[ $line =~ ^\$\ cd\ \/$ ]]; then # CD /
            cd DATA/
        elif [[ $line =~ ^\$\ cd\ \.\.$ ]]; then # CD ..
            read -a folders <<< $(pwd | tr '/' ' ')
            cd ..
        else # CD FOLDER X
            read -a command <<< $(echo $line)
            cd ${command[-1]}
        fi
    else # NOT A COMMAND
        read -a ls_result <<< $(echo $line)
        if [[ ${ls_result[0]} -eq 'dir' ]]; then # DIRECTORY
            if [[ ! -d ${ls_result[1]} ]]; then
                mkdir ${ls_result[1]}
            fi
        else # FILE
            if [[ ! -f ${ls_result[0]} ]]; then
                fallocate -l ${ls_result[0]} ${ls_result[1]}
            fi
        fi
    fi
done < $filepath
