## Moving stuff around

**Summary**

1. Use `mv` to move a file or directory to a new location
2. Use `mv` to rename a file or directory
3. Use `cp` to make a copy of a file in a new location
4. Use `cp -r` to make a copy of a directory
5. Use `mkdir` to make a new directory
6. Use `rm` to remove a file, `rm -r` to remove a directory, and `rmdir` to remove an empty directory

----

Now that you have some files uploaded to DLX, you might want to move them around and organize them. The four basic commands you’ll need are `mv` (move), `cp` (copy), `mkdir` (make directory), and `rm` (remove). 

> Note: *There is no command for renaming files and directories*. If you want to rename something, then you will have to move or copy it. See below for instructions.

### Moving files and directories

Moving files will physically move a file from one location to another. The file will no longer exist in the original location.

Move `things.txt` to the `packages` directory:
```
mv things.txt packages
```

Move all files with the extension `.txt` to the `packages` directory:
```
mv *.txt packages
```

Rename `things.txt` to `stuff.txt` and move it to the `packages` directory:
```
mv things.txt packages/stuff.txt
```

Rename `things.txt` to `stuff.txt` *without moving it anywhere*:
```
mv things.txt stuff.txt
```

Move the `packages` directory into the `stuff` directory, which lives in my `home` directory:
```
mv packages ~/stuff
```

> Note: When you `mv` directories, you do *not* need to use a `-r` (recursive) command. You will only need it to copy directories.

### Copying files and directories

Copying files will place a copy of a file from one location into another location. The file will still exist in the original location. The commands are similar to `mv`, except when it comes to copying directories.

Place a copy of `things.txt` in the `packages` directory:
```
cp things.txt packages/.
```

Rename `things.txt` to `stuff.txt` and place a copy of it in the `packages` directory:
```
cp things.txt packages/stuff.txt
```
> Note: The above command will only change the name of the *copied* file. For example, the outcome of this command will be that you have a file called `things.txt` in its original location and a duplicate file called `stuff.txt` in the `packages` directory.

Rename `things.txt` to `stuff.txt` *without moving it anywhere*. This will leave you with two identical files (with different names) in the same directory:
```
cp things.txt stuff.txt
```

Place a copy of the `packages` directory in the `stuff` directory, which lives in the home directory:
```
cp -r packages ~/stuff
```

### Making directories
Need a new directory? No problem, just use the command `mkdir` and give your directory a name.

Make a new directory named `awesome`:
```
mkdir awesome
```
 
#### Removing files and directories
> **Warning:** Removing files and directories is **permanent**. Make sure you are absolutely certain you want to delete the file or directory before you use this command. You will *not* be able to recover your work.

Remove a file called `things.txt`:
```
rm things.txt
```

Remove a directory called `awesome`:
```
rm -r awesome
```

I want to remove a directory called `awesome` that has nothing in it:
```
rmdir awesome
```
