#!/usr/bin/python3

import pandas as pd
from scipy import stats

benchs = ["BARNES", "CHOLESKY", "FFT", "FMM", "LU-CONT", "LU-NOCONT", "OCEAN-CONT", "OCEAN-NOCONT", "RADIOSITY", "RADIX", "RAYTRACE", "VOLREND", "WATER-NSQUARED", "WATER-SPATIAL"]

df = pd.read_csv("Splash3-Atomics-Barriers-Splash4.times")
df_out = pd.read_csv("Splash3-Atomics-Barriers-Splash4.times")

for bench in benchs:
    data = df.loc[df["Bench"] == bench]
    data_scala = df_out.loc[df_out["Bench"] == bench].copy()
    
    data_scala["S3Times"] = data["S3Times"].values[0] / data["S3Times"].values[0]
    data_scala["Atomics"] = data["Atomics"].values[0] / data["S3Times"].values[0]
    data_scala["Barriers"] = data["Barriers"].values[0] / data["S3Times"].values[0]
    data_scala["S4Times"] = data["S4Times"].values[0] / data["S3Times"].values[0]
    
    df_out.loc[df_out["Bench"] == bench] = data_scala

geomean = {"Bench" : "GeoMean", "S3Times" : stats.gmean(df_out["S3Times"].values), "Atomics" : stats.gmean(df_out["Atomics"].values), "Barriers" : stats.gmean(df_out["Barriers"].values), "S4Times" : stats.gmean(df_out["S4Times"].values)}
new_df = pd.DataFrame([geomean])

df_out = pd.concat([df_out, new_df], axis=0, ignore_index=True)

cols = ["Bench","S3Times", "Atomics", "Barriers", "S4Times"]
df_out = df_out[cols]

df_out.to_csv("Splash3-Atomics-Barriers-Splash4.measure")
