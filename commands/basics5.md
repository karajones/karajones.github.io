## Uncompressing and compressing files

### Commands

**Uncompress files**

| code | function |
| ----- | ----- |
| `unzip filename.zip` | unzip .zip files |
| `gunzip filename.gz` | unzip .gz files |
| `bunzip2 filename.bz2` | unzip .bz2 files |

**Uncompress tarballs (directories)**

> Note: You may see the commands below written with a flag `-` (e.g. `tar -xvf`), but the commands work with or without a flag.

| code | function |
| ----- | ----- |
| `tar xzf filename.tar.gz` | uncompress .tar.gz and .tgz directories |
| `tar xjf filename.tar.bz2` | uncompress .tar.bz2 directories |
| `tar xf filename.tar` | uncompress .tar directories |

**Compress files**

> Note: When compressing files and directories, the name you want for the compressed file should come _before_ the name of the file to be compressed (see below). Always include the extension in the new filename otherwise you will not know what format it has been compressed into.

| code | function |
| ----- | ----- |
| `gzip filename.gz file_to_be_compressed` | gzip file into .gz |
| `zip filename.zip file_to_be_compressed` | zip file into .zip |

**Compress directories**

| code | function |
| ----- | ----- |
| `tar cf filename.tar directory_to_be_compressed` | compress directory into .tar |
| `tar zcf filename.tar.gz directory_to_be_compressed` | compress directory into .tar.gz |
| `tar jcf filename.tar.bz2 directory_to_be_compressed` | compress directory into .tar.bz2 |

### Usage examples

**Uncompressing tarballs (directories)**

| code | function |
| ----- | ----- |
| `tar xzvf directory.tar.gz` | verbose option; list all files being uncompressed on screen |
| `tar xzf directory.tar.gz` | non-verbose option; no feedback on screen |

**Compressing files**

| code | function |
| ----- | ----- |
| `gzip filename.gz *.txt` | gzip all files in the current directory with the extension `.txt` |
| `zip filename.zip abc*` | zip all files in the current directory that start with `abc` |
