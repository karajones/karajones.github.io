## Submitting jobs

### Submit a job

After you’ve written your shell script, you need to submit it to the batch scheduler:
```
sbatch name_of_file.sh
```

You can check on the status of your job:
```
squeue -u your_link_blue_ID
```

So if your link blue ID is ptca201, then you would type:
```
squeue -u ptca201
```

You should get output like this:
```
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
787665   FatComp    scf-k   ptca201  R    9:02:35      1 fnode008
```

This tell you:
- the JOBID given to your job (787665)
- the PARTITION where your job is running (FatComp)
- the NAME of your job (scf-k)
  - if you did not give your job a name in your script, then the name will be the filename of the script
- the USER name (ptca201)
- the job status (ST): R for running or PD for pending
- the length of TIME that the job has been running for
- how many NODES have been allocated to the job
- the name of the node (NODELIST) where your job is running (fnode008)
  - if your job job is pending then the reason that it is pending will be shown in parenthesis rather than the node

### Cancel a job
If something has gone wrong with your job, or you no longer need it, then you can cancel the job:
```
scancel JOBID
```

The JOBID is listed when you use the `squeue` command (it’s the number in the first column on the left side of the screen). So if your JOBID is listed as `781665` then the command is:
```
scancel 781665
```
