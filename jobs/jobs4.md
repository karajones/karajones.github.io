## Writing scripts: SBATCH commands

Summary

1. `SBATCH` commands tell the batch scheduler how to handle your job
2. Make sure your job is going to the right partition and specifies the correct number of cores
3. Include an estimate of how long your job will take
4. Optional: give your job and name and have the batch scheduler send you email updates about your job

----

A shell script is a script to give commands to a computer shell through the command line. The shell is what interprets the commands so that the computer knows what to do. To run programs on the computing cluster's nodes, you will have to submit a shell script through the batch scheduler. Shell scripts should be written in a plain text editor and be given the extension `.sh`.

There are three main things that you should include in your shell script:
1. bash declaration
2. SBATCH commands
3. script to run your program

> Note: Not all computers use bash. For example, Linux and Unix machines natively use bash, but Windows does not. Also, there can be multiple different types of shells on a single computer, such as dash, csh and ksh. But for DLX you don’t have to worry about that; just use bash.

A typical shell script might look something like this:
```
#!/bin/bash
#SBATCH -n 16
#SBATCH -p Long
#SBATCH -t 12:00:00
#SBATCH -J py_3
#SBATCH --mail-type ALL
#SBATCH --mail-user fake.email@uky.edu
	
pyrad -p params.txt -s 3
```

The first line is the bash declaration. It must be included in every shell script. The lines beginning with `#SBATCH` tell the batch scheduler:
- run the job on the Long partition using 16 nodes 
- the job will run an estimated 12 hours 
- the job should be named `py_3` in the queue 
- send an email when the job starts and ends to the email address `fake.email@uky.edu` 

Finally, the last line tells the computer to run the program `pyrad` with the parameters `-p params.txt -s 3`.

### Writing your own shell script

#### Bash declaration

This one is easy. Every bash script needs to start with this line:
```
#!/bin/bash
```

#### SBATCH commands

These fall into two categories: necessary and optional. The only necessary command is the number of processor cores `-n`. It is recommended that along with `-n`, you also specify the time it will take for the job to complete `-t`. However, unless you’ve run the same job before then it is unlikely you will know how long your job will take to finish. 

The batch scheduler uses `-n` and `-t` to automatically determine which partition to place your job in, so you don’t have to include the partition in your script. But in some cases, such as with the FatComp partition, you always have to specify the partition. That is why I prefer to go ahead and specify the partition `-p` as well. 

Including `-n` and `-p` make sure your script will end up in the correct queue and on the correct nodes. (A node is just the processor where your program will run on the computing cluster.) If you are unsure of which partition to use, then specify `-n` and your best guess for `-t`. See below for more information on each of these options.

> When you see a `-` before a letter, it is called a flag. For example `-p` is the partition flag.

**`-p` partition**

The partition is the type of node you wish to use. You should choose a partition based on how much memory the job will use, how long the job will run, and how many processing cores the program you are running can use. 

For example, if you are running a short job that will only use two processing cores, then you should choose PartNod. For a job that needs lots of RAM, such as many genome assembly programs, choose FatComp. For most programs, you will probably use the Long node, unless you are running a program that is capable of processing parallel runs on many cores at once.

The partitions and their specifications for job length and number of cores:

| partition | length of job | number of cores |
| ----- | ----- | ----- |
| PartNod | less than 12 hours | 1 to 15 cores |
| Short | up to 1 day | 512 to 1024 cores | 
| Med | up to 7 days | 65 to 511 cores|
| Long | up to 30 days | 16 to 64 cores |
| FatComp\* | up to 14 days | 1 to 32 cores |

\* high memory node (512 GB per node vs 64 GB for other nodes)

There are also some specialized partitions:

| partition | what it's for | length of job | number of cores |
| ----- | ----- | ----- | ----- |
| debug | for testing programming to see if the code works | up to 1 hour | 1 to 16 cores |
| GPU2 | only for programs that can use graphics cards to enhance computation, such as BEAGLE | up to 3 days | 1 to 256 cores |
| Gauss | a special quantum chemistry node you will probably never use | up to 30 days | 16 cores only |

**`-n` number of processor cores**

Most of the time this will probably be 16, which is number of cores on a normal node. The exception are the “fat nodes” (FatComp) which have 32 cores. If you specify fewer than 16 cores on the Long node then your job may never run. If the analysis you are doing uses less than 16, then you should bundle your jobs (see serial jobs).

> Make sure the partition and the nodes match! If you choose a partition and then specify the wrong number of nodes, your job will be held in purgatory and not run. Make sure you specify at least the minimum number of nodes for the partition. For example, if you are using the Short partition, then you *must* specify at least 512 nodes:
```
#SBATCH -p Short
#SBATCH -n 512
```

**`-t` time**

This one is pretty simple: it’s just an estimate of how long your job will take to run. This is written in days, hours, minutes and seconds. For a job that you think will run for 2 and a half days (i.e. 2 days + 12 hours):
```
#SBATCH -t 2-12:00:00
```

Try to make your best guess of how long the job will take based on the documentation for the program you are running. Don’t worry if it ends up taking longer than you expected; your job will end when it’s finished, not based on the time you specified. (Unless your job exceeds the maximum job times listed above, in which case it will stop before your job is finished.) If you specify the partition, then you don't need to include the time.
  
**`-J` job name**

If you’re running multiple jobs, it might be hard to keep track of them. You can give each job a unique name that will show up in the job queue. Note that only the first 8 characters of your job name will show up when you view the queue, so make the name short.
```
#SBATCH -J job_a_12
```

**`--mail-type` send email when something happens with the job**

Tired of checking and rechecking the queue to see if your job is running? Just have the batch scheduler send you an email instead! You can specify it to send you mail just when your job begins (BEGIN), ends (END), or fails (FAIL). Or you can specify that it send you an email when any of those three things happen.
```
#SBATCH --mail-type BEGIN
```

**`--mail-user` email address**

If you don’t specify an email address, then the batch scheduler will use the address listed in the file `.forward`. (See [Getting familiar with your account](../jobs/jobs1) for more information.) If you want it sent somewhere else, or just to be safe, then specify the email address in your script.
```
#SBATCH --mail-user fake.email@uky.edu
```
