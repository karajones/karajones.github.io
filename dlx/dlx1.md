### What is the DLX?

The DLX is a high performance computing cluster. Basically, it’s a whole bunch of computers strung together to form a cluster of computers. Each computer in the cluster is called a **node**, but the nodes in a cluster can work together to give you more computing power than a single computer can on its own.

#### Nodes

Each node has its own processors and runs an operating system. When you send a **job** to the computing cluster, the job may be split across multiple nodes. Some nodes are dedicated to particular tasks, such as the login nodes, which serve as the gateway to the computing cluster. The login nodes are where you can access your files and submit jobs to the cluster. There are also specialty nodes, such as the high-memory nodes, which have much more RAM than other nodes. See [Writing scripts: SBATCH commands](#) for more information about the different nodes.

#### Jobs

A job is a task you tell the computing cluster to do. For example, a job may be a home-made calculation or the execution of a program. While you can run some short jobs on the login nodes, most jobs must be submitted to the batch scheduler. The batch scheduler decides how many computing resources to give your job. If the resources aren’t immediately available, it puts the job in a queue and automatically starts the job when the resources become availabe. See [Submitting jobs](#) for more info. If you run a lot of jobs, you may have your access to resources throttled, which means you’ll be stuck at the back of the queue for a while and others will jump ahead of you.

#### Operating system

The DLX runs Red Hat Linux. Linux is an open-source Unix-based operating system. Because it is open-source, there are many different distributions of Linux that are each slightly different, such as Red Hat, Ubuntu and CentOS. For the most part, commands are universal across all Unix-based operating systems. See [Do not use](#) for a list of commands that either will not work on the DLX’s distribution of Linux or should not be used on the cluster.

> Note: Mac OSX is also a Unix-based operating system, so the commands listed in this guide will also work on a Mac. However, Windows is *not* Unix-based and Windows machines will not be able to natively communicate with the DLX or many open-source biology programs.





