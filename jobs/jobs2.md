## Modules

> Summary
> 1. View all available modules using `module avail`
> 2. View modules loaded into your environment using `module list`
> 3. Load modules into your environment using `module load`
> 4. Switch module versions using `module switch`
> 4. Unload modules using `module unload`
> 5. Load modules automatically by adding them to your `.bashrc` file

Modules are programs that have been pre-installed on DLX for your computing pleasure. Before you install a program, check to see if there is already a module for it. 

### Loading modules

View the list of available modules:
```
module avail
```

This will give you a long list of all the modules available on the system. However, you must load a module into your environment before you can use them.

First, take a look at the modules that are already loaded into your environment:
```
module list
```

Which should return something like this:
```
Currently Loaded Modulefiles:
1) dot                       3) ifort/13.0.0.079          5) mpi/openmpi/intel/1.6.2   7) gcc/4.9.1
2) icc/13.0.0.079            4) imkl/11.1.3               6) emacs/23.1                8) R/3.1.2
```

If the program you want to use is in this list, then it’s already loaded. If not, then you need to load it. For example, one of the available modules is `mrbayes/3.2.1/default`.

Load the module for `mrbayes`:
```
module load mrbayes
```

Now if you list your modules, `mrbayes` should be on the list:
```
Currently Loaded Modulefiles:
1) dot                       4) imkl/11.1.3               7) gcc/4.9.1
2) icc/13.0.0.079            5) mpi/openmpi/intel/1.6.2   8) R/3.1.2
3) ifort/13.0.0.079          6) emacs/23.1                9) mrbayes/3.2.1/default
```

What if there are multiple versions of the same program? For instance, there are two versions of `emacs`:
```
emacs/23.1(default)
emacs/24.3
```

If you use the command `module load emacs` then it will load `emacs/23.1`, which is listed as default. To load the more recent version, include the version number in your command:
```
module load emacs/24.3
```

> Note: If you load a module to your environment, then it will only be available to use during the current session. If you need to submit a job that requires a module, you must put the command to load the module in your job script. (see job scripts) If you want a module to be available all the time then you need to add it to your `.bashrc` file. See below for details.

### Switching and unloading modules

You might need to switch from one version of a program to another. You can do this using the `switch` command.

Switch from `emacs` version 23.1 to version 24.3:
```
module switch emacs/23.1 emacs/24.3
```

If you want to remove a program from your environment completely, then you unload it:
```
module unload emacs
```

### Loading modules at login

There may be a module that you use a lot. For example, `gcc` is necessary for compiling programs. So it would be helpful to have `gcc` loaded automatically when you log in because then you don’t have to remember to load it every time you want to compile a program.

To automatically load modules, they must be added to your `.bashrc` file. First `vi` into the file, which will open the file in a text editor:
```
vi ~/.bashrc
```

The file should look something like this:
```
# .bashrc
	
# Source global definitions
	if [ -f /etc/bashrc ]; then
		. /etc/bashrc
	fi
	
# User specific aliases and functions
```

Anything you add to the file should be added after the last line. Press `i` to modify the file, scroll down to below that last line, and add the code to load the `gcc` module:
```
module load gcc/4.9.1
```

> :bangbang: Warning: Do not alter anything else in the file unless you really know what you’re doing!

Now your file should look like this:
```
# .bashrc
	
# Source global definitions
	if [ -f /etc/bashrc ]; then
		. /etc/bashrc
	fi
	
# User specific aliases and functions
module load gcc/4.9.1
```

Type `esc` then `wq` to save the file and exit. Now every time you log in to DLX, the `gcc` module will load automatically.

