## Looking at your stuff
### Commands

| code | function |
|------|-----|
| `cat` | print entire contents of file |
| `head` | print beginning of file |
| `tail` | print end of file |
| `less` | view file interactively |
| `less \| head` | print beginning of compressed file |

### Usage examples

**Head**

| code | function |
|------|-----|
| `head filename` | show first 10 lines of file |
| `head -30 filename` | show first 30 lines of file |
| `head -c 10 filename` | show first 10 characters of file |


**Tail**

| code | function |
|------|-----|
| `tail filename` | show last 10 lines of file |
| `tail -30 filename` | show last 30 lines of file |
| `tail -c 10 filename` | show last 10 characters of file |


**Less**

| code | function |
|------|-----|
| `less filename` | print file to screen in interactive mode |
| `down arrow key` or `return key` | scroll down |
| `up arrow` | scroll up |
| `q` | quit interactive mode |


**View contents of compressed files**

| code | function |
|------|-----|
| `less filename.gz \| head` | show first 10 lines of compressed file |
| `less filename.gz \| head -30` | show first 30 lines of compressed file |
| `less filename.gz \| head \| cut -c 1-20` | show first 20 characters of the first 10 lines of compressed file |
