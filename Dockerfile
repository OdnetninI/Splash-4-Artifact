 # syntax=docker/dockerfile:1
FROM ubuntu:18.04

RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install gcc g++ m4 ivtools-dev make texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra python3 python3-pandas python3-scipy -y

COPY splash /root/splash

WORKDIR /root/splash