## Navigating around

Summary:
1. There are two login nodes
2. Use `pwd` to find out where you are
3. Use `ls` to list the contents of a directory
4. Use `cd` to navigate to a different directory

----

### Where am I?

When you first log on to DLX you will on one of the login nodes. You can tell which login node you are on by the looking at the prompt, which will either say `@dlxlogin2-1` or `@dlxlogin2-2`. It almost never matters which login node you are logged into, so don’t worry about that for now.

If you are ever uncertain of where you are within DLX, use the command:
```
pwd
```
This command will return the path to the directory you are currently in. For example, if you just logged in you will be in your home directory, and the output will be something like `/home/user001`.

### Navigating and viewing directory contents

Want to know what folders, files, etc. are in the current directory? To list everything in the current directory, use the command:
```
ls
```

Which will output something like this:
```
packages      stuff.fastq.gz      slurm-574242.out
```

In this example, only `packages` is a directory. If you want to navigate into the `packages` directory, then type:
```
cd packages
```

> Tip: Not good at typing and/or spelling? No problem! Just start typing `cd p` and then hit the `tab` key. If there is only one item that starts with a `p`, then the rest of the name will fill in automatically. If there are other items in the directory that start with a `p`, then the computer will make an unhappy noise or flash at you and then not do anything. If you insist on repeatedly hitting the tab key after that then it will give you a list of all the other files that start with `p`. For example:
> 	`packages/     pyrad.sh`
> You can type the first two letters `cd pa` and press `tab` and it will fill in the word `packages`. By the way this works for all the commands, not just `cd`.


### Shortcuts for navigating

Let’s say you start at the login node, then you navigate to a directory called `packages`. Within `packages` there’s another directory called `awesome`. 

Go from the home directory to the directory called `awesome`:
```
cd ~/packages/awesome
```

Go back one directory (from `awesome` to `packages`):
```
cd ..
```

Go back two directories from (`awesome` to the home directory):
```
cd ../..
```

Go back to the home directory from *anywhere*:
```
cd
```

Go back to the last directory you were in:
```
cd -
```

> Note: This command will also print the path of the directory you will are being taken to.

List which files are in the directory `awesome` without actually navigating into `awesome` (assuming you are in the directory `packages`):
```
ls awesome
```

Move from any directory anywhere to `packages`:
```
cd ~/packages
```
> Note: `~/` designates your home directory, so you can always use it to navigate to your home directory or as the base of a path to files in your home directory. `~/` is equivalent to `/home/user001`. You can use either one.
