#!/bin/bash

echo "Bench,Cores,S3Time,S3Dev,S4Time,S4Dev" > Splash3-Splash4.times
paste Splash-3.trimmed Splash-4.trimmed -d "," | cut -f 2,3,4,5,9,10 -d "," >> Splash3-Splash4.times

python3 scala.py
