## Uploading and downloading

> Summary:
> 1. Upload files to the DLX using `scp` (secure copy)
> 2. Upload directories using `scp -r` (secure copy, recursive)
> 3. Download files/directories from DLX using the same commands
> 4. You can change the name of a file/directory when you upload/download it


### Uploading from your computer to the DLX

Let’s say you have a file named `stuff.txt` on your computer and you need to get it into your home directory on DLX. Open up Terminal, or if you are already logged into DLX, open up another tab on Terminal (File \> New Tab or `Cmd-T`). 

Navigate to the place where `stuff.txt` lives on your computer. Let’s say it lives on your `Desktop`.
```
cd ~/Desktop
```

Now you can upload using `scp` (secure copy) like so:
```
scp stuff.txt user001@dlx.uky.edu:.
```

> The `.` after the `:` tells your computer to upload the file with the same name. If you want to rename the file while you upload, put a new name instead of a `.`:
> Example: `scp stuff.txt user001@dlx.uky.edu:new-name.txt`

You'll be prompted for your password. Type in your password and you’ll get a countdown for the upload:
```
stuff.txt                        100% 1394KB   1.4MB/s   00:00
```

### More ways to upload

Upload `stuff.txt` *without* navigating to the `Desktop` first:
```
scp ~/Desktop/stuff.txt user001@dlx.uky.edu:.
```

Upload `stuff.txt` to a directory called `packages`, located in your home directory on DLX:
```
scp ~/Desktop/stuff.txt user001@dlx.uky.edu:packages/.
```

Upload `stuff.txt` and rename it `things.txt`:
```
scp ~/Desktop/stuff.txt user001@dlx.uky.edu:packages/things.txt 
```
> Note: Changing the name of the file when you upload it will not change the name of the file on your computer, *only* the name of the file where you uploaded it.

Upload a directory called `more_things`:
```
scp -r ~/Desktop/more_things user001@dlx.uky.edu:.
```

> Note: Anytime you are dealing with a directory when you `cp` (copy) or `scp` (secure copy), you will need to add the `-r` (recursive) modifier. You will get an error otherwise.

### Downloading: Like uploading, but backwards

Want to get something off of DLX and onto your computer? Again, you want to open up a Terminal that is *not* logged into DLX. Then just reverse the commands. 

Download `things.txt` from the home directory on DLX to whatever directory I’m currently in on my computer:
```
scp user001@dlx.uky.edu:things.txt .
```

Download `things.txt` from the `packages` directory on DLX to my `Desktop`:
```
scp user001@dlx.uky.edu:packages/things.txt ~/Desktop/.
```

Download the `more_things` directory to my `Desktop`:
```
scp -r user001@dlx.uky.edu:more_things ~/Desktop/.
```

> All the scenarios outlined for uploading are the same as downloading. Just remember the order:
> `scp` `file_i_want_to_move` `where_i_want_to_move_it`
> `scp` `-r` `directory_i_want_to_move` `where_i_want_to_move_it`
