#!/bin/bash

if [ -z $1 ]; then
    echo 'You must specify year at least. eg: `./make.sh 2023` or `./make.sh 2023 5`'
    exit 1
fi

if [[ $1 && $2 ]]; then
    script="
        #!/bin/bash\n\n
        filepath='../../data/${1}/${2}_example'\n\n
        while read -r line; do\n
        \techo \$line\n
        done < \$filepath\n\n
        echo \$total
    "

    echo -e $script > src/$1/$2_1.sh
    echo -e $script > src/$1/$2_2.sh
    chmod +x src/$1/$2_1.sh
    chmod +x src/$1/$2_2.sh
    touch data/$1/$2
    touch data/$1/$2_example
else
    mkdir src/$1
    mkdir data/$1
fi