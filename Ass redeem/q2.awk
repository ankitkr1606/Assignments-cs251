#!/usr/bin/awk
BEGIN{

}
NR == 1 {
	for(i=1;i<=NF;i++)
  	{
    		if ($i == "USER")
		{
			rem["USER"]=i
		}
		else if ($i == "PID")
		{
			rem["PID"]=i
		}
		else if ($i == "LWP")
		{
			rem["LWP"]=i
		}
		else if ($i == "SZ")
		{
			rem["SZ"]=i
		}
		else if ($i == "TIME")
		{
			rem["TIME"]=i
		}
  	}
}
NR > 1 {
	c++
	k=$rem["USER"]
	if (totuser[k]=="")
	{
		tot++
		totuser[k]=1
	}
	threads[k]++
	l=$rem["PID"]
	if (process[k,l] == "")
	{
		process[k]++
		process[k,l] = 1
	}
	#memory[k]+=$rem["SZ"]
	if (remem[l] == "")
	{
		memory[k]+=$rem["SZ"]
		remem[l]=1
	}
	split($rem["TIME"], temp1 , ":")
	hrs=temp1[1]*3600
	min=temp1[2]*60
	time[k]+=hrs+min+temp1[3]
}


END{
	print "Total no. of users :"tot
	for (i in threads)
	{
		print "\n"
		print "USERNAME:"i
		print "Number of Processes :"process[i]
		print "Number of Threads :"threads[i]
		print "Total CPU consumption :"time[i]" Seconds"
		print "Total Memory consumption :"memory[i]" Bytes"
	}

}
