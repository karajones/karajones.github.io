## Do not use

These commands should **not** be used on DLX because they are dangerous, forbidden, or will not do what you want them to do.

### Unavailable commands

> These commands may work on other computing clusters or flavors of Linux, but do not work on DLX

| code | why you shouldn't use it |
| ----- | ----- |
| `locate filename` | doesn’t actually locate anything |
| `rename` | doesn’t seem to work properly on our version of Linux |
| `prename` | not recognized as a command |

### Dangerous and forbidden commands

> These commands should never be used on DLX. Seriously.

| code | why you shouldn't use it |
| ----- | ----- |
| `rm -r *` | deletes *all* your files and directories |
| `find -name filename` | searches in *every* directory, including other people’s directories! |
| `chmod` | you do not have permissions to use this |
| `chown` | you do not have permissions to use this |
| `sudo` | if you even *try* to use this on DLX an admin will be notified |


