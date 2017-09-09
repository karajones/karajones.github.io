### Moving your stuff around

> Summary:
> 1. Use `mv` to move a file or directory to a new location
> 2. Use `mv` to rename a file or directory
> 2. Use `cp` to make a copy of a file in a new location
> 3. Use `cp -r` to make a copy of a directory
> 4. Use `mkdir` to make a new directory
> 5. Use `rm` to remove a file, `rm -r` to remove a directory, and `rmdir` to remove an empty directory


Now that you have some files uploaded to the DLX, you might want to move them around and organize them. The four basic commands you’ll need are `mv` (move), `cp` (copy), `mkdir` (make directory), and `rm` (remove). 

> Note: *There is no command for renaming files and directories*. If you want to rename something, then you will have to move or copy it. See below for instructions.
---- 
#### Moving files and directories
Moving files will move a file from one location to another. The file will no longer exist in the original location.

I want to move `things.txt` to my `packages` directory:
	mv things.txt packages

I want to rename `things.txt` to `stuff.txt` and move it to my `packages` directory:
	mv things.txt packages/stuff.txt

I want to rename `things.txt` to `stuff.txt` *without moving it anywhere*:
	mv things.txt stuff.txt

I want to move my `packages` directory into my `stuff` directory, which lives in my `home` directory:
	mv packages ~/stuff

> Caution: When you `mv` directories, you do *not* need to use a `-r` (recursive) command. You will need it to copy folders, though.
---- 
#### Copying files and directories
Copying files will place a copy of a file from one location into another location. The file will still exist in the original location. The commands are similar to `mv`, except when it comes to copying directories.

I want to place a copy of `things.txt` in my `packages` directory:
	cp things.txt packages/.

I want to rename `things.txt` to `stuff.txt` and place a copy of it in my `packages` directory:
	cp things.txt packages/stuff.txt

I want to rename `things.txt` to `stuff.txt` *without moving it anywhere*. This will leave you with two identical files (with different names) in the same directory:
	cp things.txt stuff.txt

I want to place a copy of my `packages` directory in my `stuff` directory, which lives in my home directory:
	cp -r packages ~/stuff
---- 
#### Making directories
Need a new directory? No problem, just use the command `mkdir` and give your directory a name.

I want a new directory named `awesome`:
	mkdir awesome
---- 
#### Removing files and directories
> Warning: Removing files and directories is permanent. Make sure you are absolutely sure you want to delete the file or directory before you use this command. You will *not* be able to recover your work.

I want to remove a file called `things.txt`:
	rm things.txt

I want to remove a directory called `awesome`:
	rm -r awesome

I want to remove a directory called `awesome` that has nothing in it:
	rmdir awesome

[\<Uploading and downloading](uploading.html)   [Uncompressing and compressing files \>](uncompressing.html)