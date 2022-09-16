#!/bin/bash

echo "b o p a c" > Splash3-Splash4.tex.data

tail -n -98 Splash3-Splash4.scala |
    cut -f 2- -d "," |
    tr "," " " |
    sed 's/BARNES /B/g' |
    sed '/^B64.*/a SPACE1	nan	nan	nan	nan' |
    sed 's/CHOLESKY /C/g' |
    sed '/^C64.*/a SPACE2	nan	nan	nan	nan' |
    sed 's/FFT /F/g' |
    sed '/^F64.*/a SPACE3	nan	nan	nan	nan' |
    sed 's/FMM /M/g' |
    sed '/^M64.*/a SPACE4	nan	nan	nan	nan' |
    sed 's/LU-CONT /L/g' |
    sed '/^L64.*/a SPACE5	nan	nan	nan	nan' |
    sed 's/LU-NOCONT /U/g' |
    sed '/^U64.*/a SPACE6	nan	nan	nan	nan' |
    sed 's/OCEAN-CONT /O/g' |
    sed '/^O64.*/a SPACE7	nan	nan	nan	nan' |
    sed 's/OCEAN-NOCONT /P/g' |
    sed '/^P64.*/a SPACE8	nan	nan	nan	nan' |
    sed 's/RADIOSITY /R/g' |
    sed '/^R64.*/a SPACE9	nan	nan	nan	nan' |
    sed 's/RADIX /X/g' |
    sed '/^X64.*/a SPACEA	nan	nan	nan	nan' |
    sed 's/RAYTRACE /Y/g' |
    sed '/^Y64.*/a SPACEB	nan	nan	nan	nan' |
    sed 's/VOLREND /V/g' |
    sed '/^V64.*/a SPACEC	nan	nan	nan	nan' |
    sed 's/WATER-NSQUARED /W/g' |
    sed '/^W64.*/a SPACED	nan	nan	nan	nan' |
    sed 's/WATER-SPATIAL /S/g' >> Splash3-Splash4.tex.data
