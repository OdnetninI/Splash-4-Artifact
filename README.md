Splash-4: A Modern Benchmark Suite with Lock-Free Constructs - Artifact
=======================================================================
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7086144.svg)](https://doi.org/10.5281/zenodo.7086144)

Artifact used to evaluate the Splash-4 benchmark presented in the following paper:
>*Eduardo José Gómez-Hernández, Juan M. Cebrián, Alberto Ros, Stefanos Kaxiras*
>"**Splash-4: A Modern Benchmark Suite with Lock-Free Constructs**"
>To appear in _2022 IEEE International Symposium on Workload Characterization_
(IISWC-2022), November 2022.

## Overview

This repository provides an artifact to reproduce the Splash-3 and Splash-4
experiments. In particular it reproduces figures 1 and 3 from *Splash-4: A Modern Benchmark Suite with Lock-Free Constructs*
A 64 core machine is expected to be able to reproduce all the results. Please check the Notes section if the machine has less
than 64 cores.

About 1 to 4 hours is expected to setup and run all the experiments, using an AMD Rome 7702P.

## Tested Environment

- Ubuntu 18.04.6 LTS
- Linux Kernel 5.4.0
- Python 3.6.9
- GCC 7.5.0

However, a Dockerfile is provided if needed.

## Directory Structure

- `./Dockerfile` - Dockerfile to build the environment
- `./splash` - Main folder with all the data, benchmarks, and scripts
+ `./splash/Figures` - Folder with latex files for generating the graphs
+ `./splash/Splash-*` - Benchmarks folders
+ `./splash/*` - Scripts

## How to execute the artifact?

The easier way is to build and run the docker container

```Bash
sudo docker build . -t splash
sudo docker run --name splash -it splash
```

Then run all scripts numbered from 0 to 9:

```Bash
./0_compile.sh
./1_run_splash_3.sh
./2_run_splash_3_atomics.sh
./3_run_splash_3_barriers.sh4
./4_run_splash_4.sh
./5_trimmed_mean.sh
./6_scala.sh
./7_scala_to_latex.sh
./8_cmp.sh
./9_cmp_to_latex.sh
```

Then, go to Figures directory and:

```Bash
cd Figures
make
```

Lastly copy the results out of the docker container:

```Bash
sudo docker cp splash:/root/splash/Figures/Scalability.pdf .
sudo docker cp splash:/root/splash/Figures/Compare.pdf .
sudo docker cp splash:/root/splash/Splash3-Splash4.scala .
sudo docker cp splash:/root/splash/Splash3-Atomics-Barriers-Splash4.measure .
```

If you wish to clean the docker environment:

```Bash
sudo docker rm splash
sudo docker rmi splash
```

## Notes
All the experiment workflow expects to get 1, 2, 4, 8, 16, 32, and 64 core results. However, by default, we bind the threads to the cores. If the machine used has less than 64 logical cores, the benchmarks will not run correctly. To disable thread to core binding, edit the Makefile.config file inside the Splash-3, Splash-3-Atomics, Splash-3-Barriers and Splash-4 directories to remove the `-D BIND_CORES` on lines 10 and 11.
For certain, very specific, configurations, the option `-D BIND_THREADS` can be used instead. However, we discourage its usage. It changes the binding order, so instead of binding thread 0 to core 0 and thread 1 to core 1, will take into account some SMT configurations and bind thread 0 to core 0 but thread 1 to core 2. However, this is uncommon on current Linux systems.

Due to a known bug from Splash-2, FMM can livelock. When running if no progress is made, kill the FMM process to continue with the rest of the benchmarks. As every benchmark is run multiple times, one or two missing executions should not be relevant. Docker commands usually require super-user permissions.
