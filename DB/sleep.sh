#!/bin/sh

timetosleep=1

if [ -z "$timetosleep" ]
then
    echo "it's not worked"
else
    echo "sleep=$timetosleep" >> store.txt

    if grep -Fxq "$timetosleep" store.txt
    then
        echo "\$timetosleep is found"
    else
        echo "\$timetosleep is not found"
    fi
fi 