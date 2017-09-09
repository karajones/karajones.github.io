## Uploading and downloading

### Commands
Note: these are used while you are not logged into DLX

| code | function |
| ----- | ----- |
| `scp` | download or upload a file |
| `scp -r` | download or upload a directory |

### Usage examples
Note: the `.` in these examples must be included or an error will occur.

**Uploading to DLX**

| code | function |
| ----- | ----- |
| `scp filename userid@dlx.uky.edu:.` | upload a file to your home directory on DLX |
| `scp filename userid@dlx.uky.edu:path\to\directory\.` | upload a file to any of your directories on DLX |
| `scp -r directory userid@dlx.uky.edu:.` | upload a directory to DLX |
| `scp filename userid@dlx.uky.edu:new_filename` | upload a file to DLX and rename it |

**Downloading from DLX**

| code | function |
| ----- | ----- |
| `scp userid@dlx.uky.edu:path\to\file\filename .` | download a file from DLX to your computer |
| `scp -r userid@dlx.uky.edu:directory .` | download a directory from DLX to your computer |
| `scp userid@dlx.uky.edu:path\to\file\filename new_filename` | download a file from DLX to your computer and rename it |
