import os
import sys
import math


def val(c):
   if (c>='0' and c<='9'):
       #print ord(c)-ord('0')
       return (ord(c)-ord('0'))
   elif (c>='A' and c<='Z'):
       #print ord(c)-ord('0')
       return (ord(c)-ord('A')+10)
   else:
       #print ord(c)-ord('0')
       #print "Enter val"
       print "Invaild input"
       sys.exit(0)

def main():
    stri = sys.argv[1]
    base = int(sys.argv[2])
    l=len(stri)
    flag=0
    k=0
    integral, point, fractional = stri.strip().partition('.')
    tem=len(point)
    lint=len(integral)
    lfloat=len(fractional)
    for i in range(lint):
        if integral[i]!='0':
            break
    for j in range(lfloat):
        if fractional[j]!='0':
            break
    if i==lint and j==lfloat:
        print "0"
        sys.exit(0)
    if integral[i]=='-':
        k=1
    power=1
    num=0.0
    if(k==0):
        for a in range(lint,i,-1):
            if val(integral[a-1])>=base:
                #print "e1"
                print "Invalid input"
                sys.exit(0)
            num=num + val(integral[a-1])*power
            power=power*base
    else:
        for a in range(lint,i+1,-1):
            if val(integral[a-1])>=base:
                #print "e2"
                print "Invalid input"
                sys.exit(0)
            num=num + val(integral[a-1])*power
            power=power*base

    power=base
    for b in range(lfloat):
        if val(fractional[b])>=base:
            #print "f"
            print "Invalid input"
            sys.exit(0)
        num=num + (float(val(fractional[b]))/float(power))
        power=power*base
    if k==0:
        if tem==0:
            print int(num)
        else:
            print num
    else:
        if len(point)==0:
            print "-%d" %(int(num))
        else:
            print "-%f" %(num)

if __name__ == '__main__':
    main()
