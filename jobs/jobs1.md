### Getting familiar with your account

There are several system files that you should be familiar with.  System files are “hidden” (i.e. you won’t see them when you `ls` a directory) and always start with a `.`. The first file - `.forward` is simple and only requires you to look at it once. The other two files - `.bash_profile` and `.bashrc` will be covered in more detail in other sections, but I will introduce them here.

#### .forward

This file does one thing and one thing only: it has your email address in it. If your account every has a problem, this is the email address you will be contacted at. If you have never looked at it before, then it will probably be empty.

Look at .forward:
	cat ~/.forward

> Note: always include `~/` before the name of the system file. You can access the system file from anywhere that way.

If the command returns nothing, then you’ll need to add your email address to the file. You can do this using `echo`, which appends text to the end of a file.
	echo "your.email@uky.edu" >> ~/.forward

Now when you `cat ~/.forward`, you should get:
	your.email@uky.edu

That’s it! Now you never have to worry about that file again.

#### .bash\_profile

Your `.bash_profile` is extremely important. This file is loaded each time you log in to your account. It does two main things: it tells the system to load `.bashrc` and it includes a place to put the paths to programs.

If you `cat` your `.bash_profile`, it will probably look something like this:
	# .bash_profile
	
	# Get the aliases and functions
	if [ -f ~/.bashrc ]; then
		. ~/.bashrc
	fi
	
	# User specific environment and startup programs

The `#` (hash) sign indicates lines with comments that the system does not read. Do NOT change anything in this file above the `# User specific environment` comment. Paths to programs will be place below that comment. See [Installing programs](#) for more details.

#### .bashrc

`.bashrc` primarily used as a place to list the module that you want to load every time you want to log in:
	# .bashrc
	
	# Source global definitions
	if [ -f /etc/bashrc ]; then
		. /etc/bashrc
	fi
	
	# User specific aliases and functions

Again, do NOT change anything above the last comment line. Below that line is where you will add any modules you want to load. See [Modules](#) for more information.

