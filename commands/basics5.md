### Uncompressing and compressing files

#### Commands
**Uncompress files**
`unzip` unzip .zip files
`gunzip` unzip .gz files
`bunzip2` unzip .bz2 files

**Uncompress directories**
`tar xzf` uncompress .tar.gz and .tgz directories
`tar xjf` uncompress .tar.bz2 directories
`tar xf` uncompress .tar directories

**Compress files**
`gzip` zip file into .gz

**Compress directories**
`tar cf` compress directory into .tar
`tar zcf` compress directory into .tar.gz
`tar jcf` compress directory into .tar.bz2

#### Usage
**Uncompressing files**
`unzip filename.zip`
`gunzip filename.gz`
`bunzip2 filename.bz2`

**Uncompressing tarballs (directories)**
`tar xzvf directory.tar.gz` verbose option
`tar xzf directory.tar.gz` non-verbose option
`tar xzf directory.tgz`
`tar xjf directory.tar.bz2`
`tar xf directory.tar`

**Compressing files**
`gzip filename`

**Compressing directories**
`tar cf directory.tar directory_to_be_compressed`
`tar zcf directory.tar.gz directory_to_be_compressed`
`tar jcf directory.tar.bz2 directory_to_be_compressed`
