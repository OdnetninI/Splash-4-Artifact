#!/bin/bash

cd Splash-3
make -j 16
cd -

cd Splash-3-Atomics
make -j 16
cd -

cd Splash-3-Barriers
make -j 16
cd -

cd Splash-4
make -j 16
cd -
