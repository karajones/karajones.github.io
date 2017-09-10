## Serial processing and checking on jobs

Jobs that only run on a single thread (see below) can be run as serial jobs (aka subjobs). Each job should be listed on its own line, followed by `&` at the end of the line. The last line after the list of jobs should be the command `wait` which prevents the node from closing out before all the subjobs are finished.
```
#!/bin/bash
#SBATCH -n 16
#SBATCH -p Long
#SBATCH -J bpp
#SBATCH --mail-type ALL
#SBATCH --mail-user fake.email@uky.edu
	
bpp bpp1.b01.ctl > log.b01.txt &
bpp bpp1.b02.ctl > log.b02.txt &
wait
```

### How many threads is my job using?

1. Log in to the node where the job is running
2. Enter the command `top`
3. Top output will show all the processes running. You want the PID associated with the job you are running. Example: below the command `bpp` has the PID `95102`.
```
	top - 21:55:20 up 106 days,  8:05,  1 user,  load average: 1.00, 1.00, 1.00
	Tasks: 457 total,   2 running, 455 sleeping,   0 stopped,   0 zombie
	Cpu(s):  7.4%us,  0.0%sy,  0.0%ni, 92.6%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
	Mem:  66046036k total,  6382188k used, 59663848k free,   260508k buffers
	Swap: 67108856k total,        0k used, 67108856k free,   294484k cached
	
	   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                                      
	 95102 ksjo229   20   0  139m  42m  916 R 100.0  0.1 400:09.13 bpp bpp6.ctl                                                 
	 97358 ksjo229   20   0 15360 1552  960 R  0.3  0.0   0:00.11 top                                                           
	     1 root      20   0 19404 1564 1256 S  0.0  0.0   0:01.96 /sbin/init                                                    
	     2 root      20   0     0    0    0 S  0.0  0.0   0:02.04 [kthreadd]                                                    
	     3 root      RT   0     0    0    0 S  0.0  0.0   0:00.03 [migration/0]  
	...
```

4. Get an output of the thread count using `ps huH p PID | wc -l`, where PID is as above. So if the PID is 95102, then the command would be:
```
ps huH p 95102 | wc -l
```
