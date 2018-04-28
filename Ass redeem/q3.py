import os
import sys
import math
k=0
def main():
    arr = sys.argv[1].split(',')
    arr=sorted(arr,key=int)
    l=len(arr)
    k=int(math.log(l,2))
    space=l/2
    tree(arr,0,l-1,space)
    for i in range(k):
        print "\n"

def tree(arr,start,end,spaces):
    if(start>end):
        return
    mid=(start+end)/2
    for i in range(spaces):
        print "  ",
    print arr[mid],
    print "\n",
    tree(arr,mid+1,end,(mid+1+end)/2)
    tree(arr,start,mid-1,(start+mid-1)/2)
    print "\033[F",
if __name__ == '__main__':
    main()
