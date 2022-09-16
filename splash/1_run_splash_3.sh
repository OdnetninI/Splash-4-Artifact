#!/bin/bash

ID=0
_cores="1 2 4 8 16 32 64"

currentDIR=$(pwd)
mkdir -p outputs

echo -n "" > Splash-3.times

for i in $(find Splash-3 -executable -type f | sort); do
    bin=$(echo $i | rev | cut -f 1 -d "/" | rev)
    dir=$(echo $i | rev | cut -f 2- -d "/" | rev)

    cd ${dir}

    for cores in ${_cores}; do
        args=""
        if [ $(echo ${bin} | grep "BARNES") ]; then
            args="< inputs/n16384-p${cores}"
        fi
        if [ $(echo ${bin} | grep "FMM") ]; then
            args="< inputs/input.${cores}.16384"
        fi
        if [ $(echo ${bin} | grep "OCEAN") ]; then
            args="-p${cores} -n258"
        fi
        if [ $(echo ${bin} | grep "RADIOSITY") ]; then
            args="-p ${cores} -ae 5000 -bf 0.1 -en 0.05 -room -batch"
        fi
        if [ $(echo ${bin} | grep "RAYTRACE") ]; then
            args="-p${cores} -m64 inputs/car.env"
        fi
        if [ $(echo ${bin} | grep "VOLREND") ]; then
            args="${cores} inputs/head 8"
        fi
        if [ $(echo ${bin} | grep "WATER") ]; then
            args="< inputs/n512-p${cores}"
        fi
        if [ $(echo ${bin} | grep "CHOLESKY") ]; then
            args="-p${cores} < inputs/tk15.O"
        fi
        if [ $(echo ${bin} | grep "FFT") ]; then
            args="-p${cores} -m16"
        fi
        if [ $(echo ${bin} | grep "LU") ]; then
            args="-p${cores} -n512"
        fi
        if [ $(echo ${bin} | grep "RADIX") ]; then
            args="-p${cores} -n1048576"
        fi

        echo "" > ${currentDIR}/outputs/${ID}.out

        #echo -n "Running ${bin} with ${args} 10 times (${dir})"
        echo -n "Splash-3,${cores},${bin}," | tee -a ${currentDIR}/Splash-3.times

        for p in {0..9}; do
            eval "./${bin} ${args}" 2>&1 >> ${currentDIR}/outputs/${ID}.out
        done

        grep ROI ${currentDIR}/outputs/${ID}.out  | cut -f 6 -d " " | tr -d "s" | tr "\n" "," | tee -a ${currentDIR}/Splash-3.times

        echo "" | tee -a ${currentDIR}/Splash-3.times

        ID=$(( ${ID} + 1 ))
    done

    cd - > /dev/null 
done
