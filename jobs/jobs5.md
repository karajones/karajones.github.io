## Submitting jobs

#### Submit a job
After you’ve written your batch script, you need to submit it to the queue:
	sbatch name_of_file.sh

You can check on the status of your job:
	squeue -u your_link_blue_ID
so if your link blue ID is ptca201, then you would type:
	squeue -u ptca201

You should get output like this:
	JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
	            787665   FatComp    scf-k   ptca201  R    9:02:35      1 fnode008


> Note: If your job is listed as `(JobHeldAdmin)` then it is still waiting in the queue. Once it starts running it will list the node(s) where your job is running.

#### Cancel a job
If something has gone wrong with your job, or you no longer need it, then you can cancel the job:
	scancel JOBID
The JOBID is list when you use the `squeue` command (it’s the number in the first column on the left side of the screen). So if your JOBID is listed as `781665` then the command is:
	scancel 781665
