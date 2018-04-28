import os
import csv
import subprocess


with open("threads.txt") as file:
    reader=csv.reader(file,delimiter=' ')
    for row in reader:
        threads=row
with open("params.txt") as file:
    reader=csv.reader(file,delimiter=' ')
    for row in reader:
        params=row

for i in range(len(params)):
    for j in range(len(threads)):
        for k in range(100):
            subprocess.call(['./App',params[i],threads[j]])




#print c
