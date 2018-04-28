import os
import csv

with open("threads.txt") as file:
    reader=csv.reader(file,delimiter=' ')
    for row in reader:
        threads=row
with open("params.txt") as file:
    reader=csv.reader(file,delimiter=' ')
    for row in reader:
        params=row

time=[]
with open("result.txt") as file:
    reader=csv.reader(file,delimiter=' ')
    for row in reader:
        #print row[3]
         temp=row
         time.append(temp[3])

t=0

for i in range(len(threads)):
    for j in range(len(params)):
        for k in range(100):
            if i==0:
