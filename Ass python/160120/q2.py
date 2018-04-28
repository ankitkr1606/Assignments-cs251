#!/usr/bin/python3
import numpy as np
import scipy as sc
import os
import sys
import csv
import matplotlib.pyplot as plt
import io
import math
train = np.genfromtxt(r'train.csv',delimiter=',',skip_header=1)
X_train = train[:,[0]]
y_train = train[:,[1]]
data = list(train)
n_train = len(data)
New_X_train=np.hstack((np.ones((X_train.shape[0],1)),X_train))

w=np.random.random((2,1))

x_prime = New_X_train.dot(w)
plt.plot(X_train,y_train,'b.',X_train,x_prime,'g')
plt.show()

w_direct = reduce(np.dot, [np.linalg.inv(New_X_train.transpose().dot(New_X_train)),New_X_train.transpose(),y_train])
#print(w_direct)
plt.plot(X_train,y_train,'r+',X_train,New_X_train.dot(w_direct),'b')
plt.show()

eta = 0.00000001
for nepoch in range(2):
    for j in range(0,n_train):
        x = X_train[j][0]
        y = y_train[j]
        x=np.array([[1,x]])
        x_prime = x.transpose()
        temp = (w.transpose()).dot(x_prime)
        #temp = temp[0][0]
        temp = temp -y
        new=np.matmul(x_prime,temp)
        temp = eta*np.array(new)
        w= w - temp
        #print w.shape
        #print w
        if j%100 == 0:
            plt.plot(X_train,y_train,'r+',X_train,New_X_train.dot(w),'b')
plt.show()

plt.plot(X_train,y_train,'r+',X_train,New_X_train.dot(w))
plt.show()

test = np.genfromtxt ('test.csv', delimiter=",",skip_header=1)
x_test = test[:,[0]]
y_test = test[:,[1]]
data1 = list(test)
n_test = len(data1)
New_X_test=np.hstack((np.ones((x_test.shape[0],1)),x_test))
y_pred1 = New_X_test.dot(w)
y_pred2 = New_X_test.dot(w_direct)
s1 = 0.0
s2 = 0.0
for i in range(1,n_test):
	s1 = s1 + (float(y_pred1[i][0] - y_test[i][0]))*(float(y_pred1[i][0] - y_test[i][0]))
	s2 = s2 + (float(y_pred2[i][0] - y_test[i][0]))*(float(y_pred2[i][0] - y_test[i][0]))
rms1 = float(s1/n_test)
rms2 = s2/n_test
rms1=math.sqrt(rms1)
rms2=math.sqrt(rms2)
print "rms1: ",rms1
print "rms2: ",rms2
