#!/usr/bin/python3

import pandas as pd

benchs = ["BARNES", "CHOLESKY", "FFT", "FMM", "LU-CONT", "LU-NOCONT", "OCEAN-CONT", "OCEAN-NOCONT", "RADIOSITY", "RADIX", "RAYTRACE", "VOLREND", "WATER-NSQUARED", "WATER-SPATIAL"]

df = pd.read_csv("Splash3-Splash4.times")
df_out = pd.read_csv("Splash3-Splash4.times")

for bench in benchs:
    data = df.loc[df["Bench"] == bench]
    data_scala = df_out.loc[df_out["Bench"] == bench].copy()
    for cores in [1, 2, 4, 8, 16, 32, 64]:
        data_scala.loc[data_scala["Cores"] == cores,"S3Time"] = data.loc[data["Cores"] == 1]["S3Time"].values[0] / data.loc[data["Cores"] == cores]["S3Time"].values[0]
        data_scala.loc[data_scala["Cores"] == cores,"S3Dev"] = data.loc[data["Cores"] == cores]["S3Dev"].values[0] / data.loc[data["Cores"] == 1]["S3Time"].values[0]
        data_scala.loc[data_scala["Cores"] == cores,"S4Time"] = data.loc[data["Cores"] == 1]["S4Time"].values[0] / data.loc[data["Cores"] == cores]["S4Time"].values[0]
        data_scala.loc[data_scala["Cores"] == cores,"S4Dev"] = data.loc[data["Cores"] == cores]["S4Dev"].values[0] / data.loc[data["Cores"] == 1]["S4Time"].values[0]
    
    df_out.loc[df_out["Bench"] == bench] = data_scala

df_out.to_csv("Splash3-Splash4.scala")
