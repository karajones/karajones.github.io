## Improving the efficiency of your jobs

When one of your jobs is running on a node then you "own" that node. Nobody else can use it. So if you are using very little of the node's computing resources, then that is inefficient. But how do you know if your job is running efficiently? One way is to check the number of threads that your job is using. One thread usually represents a single task running on a processing core. For example, DLX standard compute nodes have one thread per core and 16 cores, so you can run up to 16 tasks. If you run more than 16 tasks, then the node you are using will process the data more slowly as it tries to switch back and forth between tasks.

### How many threads is my job using?

**Log in to the node where the job is running**

First you'll need to figure out what node your job is running on. If you use the command:
```
squeue -u user001
```

Then you'll get the output of all the nodes your jobs are assigned to. Find the node for the job you would like to check on in the NODELIST column, then log in to that node using `ssh`. For example, if the node you want to log into is called `cnode001`:
```
ssh cnode001
```

**The `top` command**

Now that you're logged into the node, you can check on the job processes that are running using the `top` command:
```
top
```

This will give you a constantly updating output showing all the processes running. To figure out how many threads your job is using then find the PID associated with the job you are running. For example, the output below shows the command `bpp` has the PID `95102`.
```
	top - 21:55:20 up 106 days,  8:05,  1 user,  load average: 1.00, 1.00, 1.00
	Tasks: 457 total,   2 running, 455 sleeping,   0 stopped,   0 zombie
	Cpu(s):  7.4%us,  0.0%sy,  0.0%ni, 92.6%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
	Mem:  66046036k total,  6382188k used, 59663848k free,   260508k buffers
	Swap: 67108856k total,        0k used, 67108856k free,   294484k cached
	
	   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                                      
	 95102 user001   20   0  139m  42m  916 R 100.0  0.1 400:09.13 bpp bpp6.ctl                                                 
	 97358 user001   20   0 15360 1552  960 R  0.3  0.0   0:00.11 top                                                           
	     1 root      20   0 19404 1564 1256 S  0.0  0.0   0:01.96 /sbin/init                                                    
	     2 root      20   0     0    0    0 S  0.0  0.0   0:02.04 [kthreadd]                                                    
	     3 root      RT   0     0    0    0 S  0.0  0.0   0:00.03 [migration/0]  
	...
```
Press `q` to close `top`.

Now you can get an output of the thread count using `ps huH p PID | wc -l`, where PID is as above. So if the PID is `95102`, then the command would be:
```
ps huH p 95102 | wc -l
```

In this case the job is only using one thread, so the output is:
```
1
```

### Serial processing of jobs

Jobs that only run on a single thread can be run as serial jobs (aka subjobs). Each job should be listed on its own line, followed by `&` at the end of the line. The last line after the list of jobs should be the command `wait` which prevents the node from closing out before all the subjobs are finished. Serial job scripts are submitted via `sbatch` the same as normal scripts.
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

Remember, there are only 16 threads available on the standard computing nodes so do not list more than 16 serial jobs. You'll also need to take into account how much memory the each job uses, which you can check in `top`. In the `bpp` example above, one `bpp` job is using 0.1% of the memory, so it's fine to add 16 jobs. But if one job used 80% of the memory, then you shouldn't run it as a serial job.
