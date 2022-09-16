#!/usr/bin/python3
from scipy import stats
import numpy as np
import math
import sys

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv[1:])

def stddev_list(list, delta = 1.0, tmean = 1):
    list = [i for i in list if i != '' and i != '\n']
    numelems = len(list)
    variance = 0.0
    for item in list:
        variance += (tmean - item) ** 2
    if numelems > 1:
        stddev = math.sqrt(variance / (numelems - 1)) # sample std deviation
    else:
        stddev = 0
    return stddev * delta

if len(sys.argv) > 1:
    try:
        x = [float(arg) for arg in sys.argv[1:]]
        total = stats.trim_mean(x, 0.3 / 2.0) # Divided by two to match EXCEL TRIMMEAN
        print('{:.5f} {:.15f}'.format(total, stddev_list(x,0.95,total)))
    except ValueError:
        print('Please supply integer arguments')
else:
    print(0)
