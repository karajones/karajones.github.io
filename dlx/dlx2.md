### Navigating around

> Summary:
> 1. There are two login nodes
> 2. Use `pwd` to find out where you are
> 3. Use `ls` to list the contents of a directory
> 4. Use `cd` to navigate to a different directory

**Where am I? Part I**

When you first log in to the DLX you will on one of the login nodes. You can tell which login node you are on by the prompt, which will either say `@dlxlogin2-1` or `@dlxlogin2-2`. It almost never matters which login node you are logged into, so don’t worry about that for now.

**Where am I? Part II**

If you are ever lost on the DLX, you can find out where you are by typing the magic code:
	pwd

This code will tell you where you are. If you just logged in you will be in your home directory, and the response will be something like `/home/user001`. This is called a *path*. Paths are very important since if you can’t figure out the path to your data and programs then you won’t be able to get anywhere or run anything. Know thy path.
---- 

#### Let’s go somewhere

Want to know what folders, files, etc. are in the current directory?
	ls

`ls` lists everything in the current directory. Depending on your computer set-up, files, compressed files and directories should be different colors. For instance, my home directory looks a little like this (except with more stuff):

\<p style="color:blue”\>packages\</p\>      \<p style="color:red"\>stuff.fastq.gz\</p\>  slurm-574242.out

In this example, only `packages` is a directory. If you want to navigate into the `packages` directory, then type:

	cd packages

> Tip: Not good at typing and/or spelling? No problem! Just start typing `cd p` and then hit the `tab` key. If there is only one item that starts with a `p`, then the rest of the name will fill in automagically. If there are other items in the directory that start with a `p`, then the computer will make an unhappy noise or flash at you and then not do anything. If you insist on repeatedly hitting the tab key after that then it will give you a list of all the other files that start with `p`. For example:
> 	packages/ pyrad.sh
> You can then type the first two letters `cd pa` and `tab` to get to `packages`. By the way this works for all the commands, not just `cd`.
---- 
#### Tips for navigating

Let’s say you start at the login node, then you navigate to `packages`. Within `packages` there’s a folder called `awesome`. pwd will tell you that you are now here: 
> /home/user001/packages/awesome

I want to go back to `packages`:
	cd ..

I want to go back to my home directory from `packages`:
	cd ../..

I want to go back to my home directory from *anywhere*:
	cd

I’m in `packages` and I want to look at the files in `awesome` without actually navigating into `awesome`:
	ls awesome

I’m in a totally different directory somewhere and want to get to `packages` in one step:
	cd ~/packages

> Note: `~/` designates your home directory, so you can always use it to navigate to your home directory or as the base of a path to files in your home directory. `~/` is equivalent to `/home/user001`. You can use either one.

[\< Logging in](login.html)   [Uploading and downloading \>](uploading.html)