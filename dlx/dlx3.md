## Uploading and downloading

> Summary:
> 1. Upload files to the DLX using `scp` (secure copy)
> 2. Upload directories using `scp -r` (secure copy, recursive)
> 3. Download files/directories from the DLX the same way as uploading
> 4. You can change the name of a file/directory when you upload/download it


**Uploading from your computer to the DLX**

Let’s say you have a file named `stuff.txt` on your computer and you need to get it into your home directory on the DLX. Open up Terminal, or if you are already logged into the DLX, open up another tab on Terminal (File \> New Tab or `Cmd-T`). 

> Note: Why? It’s easiest to upload when you are not logged in to DLX, but you can have one tab that is logged in and one tab that is not, so you don’t actually have to log out. It’ll make more sense once you try it.
---- 
#### The no mistakes way to upload 

Navigate to the place where `stuff.txt` lives on your computer. Let’s say it lives on your `Desktop`.

	cd ~/Desktop

Now you can upload using `scp` (secure copy) like so:

	scp stuff.txt user001@dlx.uky.edu:.

> The `.` after the `:` tells your computer to upload the file with the same name. If you want to rename the file while you upload, put a new name instead of a `.`:
> 	scp stuff.txt user001@dlx.uky.edu:new-name.txt

Type in your password and you’ll get a countdown for the upload:
> stuff.txt                        100% 1394KB   1.4MB/s   00:00
---- 
#### More ways to upload

I want to upload `stuff.txt` *without* navigating to the `Desktop` first:
	scp ~/Desktop/stuff.txt user001@dlx.uky.edu:.

I want to upload `stuff.txt` to the `packages` directory on DLX:
	scp ~/Desktop/stuff.txt user001@dlx.uky.edu:packages/.

I want the name of the file to be `things.txt` after it uploads
	scp ~/Desktop/stuff.txt user001@dlx.uky.edu:packages/things.txt 

I don’t just want to upload one file. I want to *upload a whole directory* called `more_things`:
	scp -r ~/Desktop/more_things user001@dlx.uky.edu:.

> Note: Anytime you are dealing with a directory when you `cp` (copy) or `scp` (secure copy), you will need to add the `-r` (recursive) modifier. This ensures that the entire directory and all its contents will be uploaded.
---- 
#### Downloading: Like uploading, but backwards

Want to get something off of the DLX and onto your computer? Again, you want to open up a Terminal that is *not* logged into the DLX. Then just reverse the commands. 

For example, I want to download `things.txt` from the home directory on DLX to whatever directory I’m currently in on my computer:
	scp user001@dlx.uky.edu:things.txt .

I want to download `things.txt` from the `packages` directory on DLX to my `Desktop`:
	scp user001@dlx.uky.edu:packages/things.txt ~/Desktop/.

I want to download the `more_things` directory to my `Desktop`:
	scp -r user001@dlx.uky.edu:more_things ~/Desktop/.

> Note: All the scenarios outlined for uploading are the same as downloading. Just remember the order:
> `scp` `file_i_want_to_move` `where_i_want_to_move_it`
> `scp` `-r` `directory_i_want_to_move` `where_i_want_to_move_it`

[\< Navigating around](navigating.html)   [Moving your stuff around \>](moving.html)