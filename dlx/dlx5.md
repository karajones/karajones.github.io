## Uncompressing and compressing files

**Summary:**

1. Upzip files using `unzip` (.zip), `gunzip` (.gz), and bunzip2 (.bz2)
2. Uncompress directories using `tar xf` (.tar), `tar xzf` (.tar.gz & .tgz), `tar xjf` (.tar.bz2)
3. Compress files using `gzip`
4. Compress directories using `tar cf` (.tar), `tar zcf` (.tar.gz), or `tar jcf` (.tar.bz2)

----

If you’ve uploaded a large file to DLX then the file was probably compressed (aka “zipped”). You might want to uncompress it. There are a frustratingly large number of compression formats and they each use a slightly different command. This section should cover most of the formats you’ll encounter.

> In some cases you probably don’t need to uncompress the file to use it. For example, large next-gen sequencing files will often come in a compressed `fq.gz` format, but you can usually do anything you need with the file without uncompressing it. That includes viewing the contents. See the [Looking at your stuff](looking.html) section for tips.

### Unzipping the various zip formats

> Note: When you uncompress a file, the compressed version will still be present in the same directory.

Uncompress a zip file:
```
unzip stuff.zip
```

Uncompress a gzipped file:
```
gunzip stuff.gz
```
Uncompress a bzip2 file:
```
bunzip2 stuff.bz2
```

> Tip: If your file is compressed with `.tgz` then it is actually a tarball. See below for more info.

### Uncompress those tarballs in one step!

Many of your compressed files will be tarballs, as designated by `.tar` after the filename. Tarballs contain not just files, but also directories and are a common format for programs. Tarballs can be uncompressed a variety of ways using a command called `tar` followed by a string of letters that modifies the command:
- `x` extracts the file (required)
- `v` verbose, prints what is being extracted on the screen (optional)
- `z` or `j` specifies the compression format (required)
- `f` tells the program the file name is coming up next in the command (required, always last in the list)

For instance stuff.tar.gz could be uncompressed like this, with the verbose option:
```
tar xzvf stuff.tar.gz
```

Or it could be uncompressed using the same options in a different order (but, remember, `f` always has to be last):
```
tar xvzf stuff.tar.gz
```

Or it could be uncompressed without the verbose option:
```
tar xzf stuff.tar.gz
```

If your file is a secret tarball (i.e. it has a `t` at the beginning of the file extension) you can uncompress it the same way:
```
tar xzf stuff.tgz
```

> :beers: Tip: You may also see the command written with a `-` (flag) in front of the letters, like `tar -xzvf stuff.tar.gz`. The command works fine without it though so why type extra symbols?

For a bzip2 file, just change `z` to `j`:
```
tar xjf stuff.tar.bz2
```

If your file *only* has `.tar` after it, then you can uncompress the tarball like this:
```
tar xf stuff.tar
```

> Note: You can add the verbose option to any of the tarball uncompression commands, such as `xjvf` for `.bz2` and `xvf` for `.tar`.

### Compressing files

This one is a bit easier. You just write the command for how you want to compress the file and then the filename. *These commands will not work with directories, only files!*

> :heavy_exclamation_mark: Caution: Unlike with uncompressing files, you will be compressing the original file and the uncompressed file will no longer exist. You will just have the compressed file. Though you can always uncompress it again, so it's not that big of a deal.

Compress `stuff.txt`. This will produce a file called `stuff.txt.gz`:
```
gzip stuff.txt
```

Compress `stuff1.txt` and `stuff2.txt` at the same time (but not into the same gzip archive). This will produce two files, one called `stuff1.txt.gz` and one called `stuff1.txt.gz`:
```
gzip stuff1.txt stuff2.txt
```

Compress all the `.txt` files into a single zip archive called `test.zip`:
```
zip test.zip *.txt
```

### Compressing directories

This is a little more complicated because directories should be compressed into tarballs. The commands are very similar to the uncompression commands for `tar` above, but instead of an `x` (extract), use a `c` (compress). When compressing directories, the original directory and the compressed directory will both be preserved.

> Note: You must put the final name of the compressed directory *before* the name of the directory you are compressing. This is a bit counterintuitive.

Compress the directory `awesome` into a `tarball`:
```
tar cf awesome.tar awesome
```

Compress the directory `awesome` into a `gzipped` tarball:
```
tar zcf awesome.tar.gz awesome
```

Compress the directory `awesome` into a `bzipped` tarball:
```
tar jcf awesome.tar.bz2 awesome
```

> **Caution:** The compression commands will let you name the compressed tarball whatever you want, even if it is incorrect. For instance, you could name a `gzipped` tarball `awesome.tar.bz2` and you will not get any errors. However, if you do this then you might have trouble figuring out how to uncompress the file later!
