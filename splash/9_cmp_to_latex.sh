#!/bin/bash

echo "a b c d e" > Splash3-Atomics-Barriers-Splash4.tex.data

tail -n 15 Splash3-Atomics-Barriers-Splash4.measure |
    cut -f 2- -d "," |
    tr "," " " |
    sed 's/BARNES/Barnes/g' |
    sed 's/CHOLESKY/Cholesky/g' |
    sed 's/FFT/FFT/g' |
    sed 's/FMM/FMM/g' |
    sed 's/LU-CONT/LUC/g' |
    sed 's/LU-NOCONT/LUNC/g' |
    sed 's/OCEAN-CONT/Ocean/g' |
    sed 's/OCEAN-NOCONT/OceanNP/g' |
    sed 's/RADIOSITY/Radiosity/g' |
    sed 's/RADIX/Radix/g' |
    sed 's/RAYTRACE/Raytrace/g' |
    sed 's/VOLREND/Volrend/g' |
    sed 's/WATER-NSQUARED/WaterNS/g' |
    sed 's/WATER-SPATIAL/WaterSP/g' |
    sed '/^WaterSP.*/a SPACE	nan	nan	nan	nan' >> Splash3-Atomics-Barriers-Splash4.tex.data
