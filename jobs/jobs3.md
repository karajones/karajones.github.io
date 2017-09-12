## Installing programs

**Summary**

1. Configure programs using a prefix to ensure it installs in the right place: `./configure --prefix=/path/`
2. Make sure you know where the program’s executables are
3. Place the path to the program executables in your `.bash_profile`

----

Each program you want to install will come with installation instructions. These will usually be found in a file called `README`. Sometimes there is also a file specifically called `INSTALL` that tells you how to install the program. Always read the program’s installation instructions first!

However, many programs are installed using the same method:
1. `./configure`
2. `make`
3. `make install`

Unfortunately, these instructions assume that you are going to install them on a desktop computer, where you have permissions to do what you want. (Even memory- and processing power-hungry programs that almost no one would ever install on a desktop have instructions that assume this for some reason.) Instead you will need to modify the process slightly for it to work on DLX.

### Example: Install the program ALLPATHS

I will use the program ALLPATHS as an example. It is a genome assembly program that uses a ton of RAM. You’re not going to be running this badboy on your desktop.

If you don't already have one, create a directory where you can organize your programs. You should put all your programs in one place so they don’t get lost or accidentally deleted. Let’s put them in a directory called `programs`:
```
mkdir programs
```

Next, upload the ALLPATHS package into `programs` and uncompress it. Then `cd` into the uncompressed ALLPATHS directory. (I’m going to assume you know how to do those steps on your own by now. If not, check out [Uncompressing and compressing files](../dlx/dlx5))

Now that you are in the ALLPATHS directory, you can carry out the installation. During the `./configure` step, you *must* include a prefix to tell the program where you want to install it. I suggest you install it in the original ALLPATHS directory.
```
./configure --prefix=~/programs/ALLPATHS
```

> **Warning:** Let me reiterate that you *must* include a prefix. Also, remember what that prefix was because you’ll need it later!

Once that part is finished, you can `make` and `make install` the program:
```
make
make install
```

> Note: Sometimes the `make` process can take a loooong time and seem to be “stuck.” Have patience, it’s probably fine.

You may encounter errors during the installation process. Many errors can be ignored because they don't affect the installation itself, so check to see if the installation works before you panic. If the program did not install successfully, it is probably because you:
- did not include the prefix
- did not install the dependencies
- did not read the README or INSTALL docs thoroughly

> Note: You can always start over from the `./configure` step after you’ve installed any missing dependencies or if you need to add a prefix.


### Test the installation

Finally, you’ll want to actually use the program. You can do this one of two ways.

#### OPTION 1: Use the full path

Use the entire prefix path to the program when you want to use it. Just because you "installed" a program, doesn't mean that a computer on the cluster can find the program. You have to explicitly declare the entire path to the executables for the program.

> :heavy_exclamation_mark: Caution: The executables for programs are usually *not* stored in the main part of the program's directory. For example, the executables for ALLPATHS are not stored in `~/programs/ALLPATHS`, they are stored in `~/programs/ALLPATHS/bin`. You can find out where the executables are stored by looking at the user manual for the program.

For example, ALLPATHS has an executable called `PrepareAllPathsInputs.pl`, so every time you want to use that command, you have to type:
```
~/programs/ALLPATHS/bin/PrepareAllPathsInputs.pl ... 
```

With `...` representing all the other stuff you have to add to make the command work properly (e.g. where your data is stored). This is a really annoying way to use your programs and encourages errors. Therefore, I always recommend OPTION 2.

---- 

#### OPTION 2: Add the path to your `.bash_profile`

If you add the path of the program to your `.bash_profile`, you can call the program’s commands from *anywhere*. No more remembering paths. No more long paths with major typo potential. There are two easy steps:

1. Add the path of program to your `.bash_profile`:
```
echo "export PATH=$PATH:$HOME/programs/ALLPATHS/bin" >> ~/.bash_profile
```

What is happening in the above code? 
- `echo` appends phrases to the end of a file. 
- `export PATH=$PATH:` essentially tells DLX “look for something here.”
 - `$HOME` is equivalent to `~/` or `/home/user001`, so it’s just another way of writing the path to your home directory. 
- `/programs/ALLPATHS/bin` is where the program’s executables are located. 
- `>> ~/.bash_profile` tells `echo` to add the phrase in quotes to the end of the `.bash_profile`.

2. Reload your `.bash_profile`:
```
source ~/.bash_profile
```

Now you’re ready to use the program commands anywhere! Test it out by `cd`ing to a random directory and typing a command for your program. If this is successful, it should print “help” text on the screen. For example, we can test `PrepareAllPathsInputs.pl` by simply typing:
```
PrepareAllPathsInputs.pl
```

If this gives you an error then you probably either put the incorrect path in your `.bash_profile` in step 1 or forgot to do step 2:
- Double-check the path to your program. 
- `cat` your `.bash_profile` to make sure that the path is printed correctly there.
- `vi` your `.bash_profile` if you need to make changes to the path.
- If everything looks correct regarding the path, log out of the DLX and log back in to hard boot your `.bash_profile`.
