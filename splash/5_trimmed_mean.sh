#!/bin/bash

while read -r line; do
    bench=$(echo "${line}" | cut -f 1,3 -d ",")
    cores=$(echo "${line}" | cut -f 2 -d ",")
    time=$(echo "${line}" | cut -f 4- -d "," | tr "," " " | xargs python3 trimmed_mean.py | tr " " ",")
    echo $bench","$cores","$time
done < Splash-3.times | tee Splash-3.trimmed

while read -r line; do
    bench=$(echo "${line}" | cut -f 1,3 -d ",")
    cores=$(echo "${line}" | cut -f 2 -d ",")
    time=$(echo "${line}" | cut -f 4- -d "," | tr "," " " | xargs python3 trimmed_mean.py | tr " " ",")
    echo $bench","$cores","$time
done < Splash-3-Atomics.times | tee Splash-3-Atomics.trimmed

while read -r line; do
    bench=$(echo "${line}" | cut -f 1,3 -d ",")
    cores=$(echo "${line}" | cut -f 2 -d ",")
    time=$(echo "${line}" | cut -f 4- -d "," | tr "," " " | xargs python3 trimmed_mean.py | tr " " ",")
    echo $bench","$cores","$time
done < Splash-3-Barriers.times | tee Splash-3-Barriers.trimmed

while read -r line; do
    bench=$(echo "${line}" | cut -f 1,3 -d ",")
    cores=$(echo "${line}" | cut -f 2 -d ",")
    time=$(echo "${line}" | cut -f 4- -d "," | tr "," " " | xargs python3 trimmed_mean.py | tr " " ",")
    echo $bench","$cores","$time
done < Splash-4.times | tee Splash-4.trimmed
