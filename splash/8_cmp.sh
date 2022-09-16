#!/bin/bash

echo "Bench,S3Times,Atomics,Barriers,S4Times" > Splash3-Atomics-Barriers-Splash4.times
paste Splash-3.trimmed Splash-3-Atomics.trimmed Splash-3-Barriers.trimmed Splash-4.trimmed -d "," | cut -f 2,3,4,9,14,19 -d "," | grep ",64," | cut -f 1,3- -d "," >> Splash3-Atomics-Barriers-Splash4.times

python3 cmp.py
