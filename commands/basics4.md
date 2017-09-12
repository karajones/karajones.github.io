## Moving and renaming files or directories

### Commands

| code | function |
| ----- | ----- |
| `mv` | moves a file or to a new location |
| `cp` | copies a file to a new location, leaving a copy of the file in the old location |
| `cp -r` | copies a directory to a new location, so that there is a copy of the directory in both the old and new location |
| `mkdir` | makes a new directory |
| `rm` | removes a file |
| `rm -r` | removes a directory |


### Usage examples

#### Renaming without moving

| code | function |
| ----- | ----- |
| `mv filename new_file_name` | rename file |
| `cp filename new_file_name` | rename file, leaving old file in place |

#### Moving files/directories to a new directory

| code | function |
| ----- | ----- |
| `mv filename directory` | move file to directory |
| `mv filename directory/new_file_name` | move file to new directory and rename it |
| `mv directory ~/new_directory` | move a directory into new directory |

#### Copying files/directories to a new directory

| code | function |
| ----- | ----- |
| `cp filename directory/.` | copy file to directory |
| `cp filename directory/new_file_name` | copy file to directory and rename file |
| `cp -r directory ~/new_directory` | copy directory to a new directory |

#### Removing files/directories

| code | function |
| ----- | ----- |
| `rm filename` | remove a file |
| `rm -r directory` | remove a directory |
| `rmdir directory` | remove an *empty* directory |
