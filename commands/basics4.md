## Moving and renaming files/directories

#### Commands
`mv` moves a file or to a new location
`cp` copies a file to a new location, leaving a copy of the file in the old location
`cp -r` copies a directory to a new location, so that there is a copy of the directory in both the old and new location
`mkdir` makes a new directory
`rm` removes a file
`rm -r` or `rmdir` removes a directory


#### Usage
**Renaming without moving**
`mv filename new_file_name` rename file

`cp filename new_file_name.txt` rename file, leaving old file in place

**Moving files/directories to a new directory**
`mv filename directory` move file to directory

`mv filename directory/new_file_name` rename file and move it to  directory

`mv directory ~/new_directory` move directory into new directory

**Copying files/directory to a new directory**
`cp filename directory/.` copy file to directory

`cp filename directory/new_file_name` copy file to directory and rename file

`cp -r directory ~/new_directory` copy directory to a new directory

**Make a directory**
`mkdir directory` make a new directory

**Remove files/directories**
`rm filename` remove a file

`rm -r directory` remove a directory

`rmdir directory` remove an *empty* directory



