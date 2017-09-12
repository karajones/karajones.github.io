## Looking at your stuff

**Summary:**

1. View entire files using `cat`
2. View the beginning of a file using `head`
3. View the end of a file using `tail`
4. Scroll through a file using `less`
5. View the contents of compressed files using `less filename |` and `head` or `tail`

----

You’ve already learned about having a peek into a directory using `ls`, but what about looking into your files? How you approach this is determined by: 
1. what you want to know about your file
2. how large the file is
3. if the file is compressed

### Looking at small files
If you *know* that your file is small, then you can use the `cat` (concatenate) command. It will list the entire contents of the file on the screen.

> Note: Why are we using a concatenate command to look at a file? I don’t know, but that’s what the command does. It can also actually concatenate.

Print the contents of `stuff.txt` to the screen:
```
cat stuff.txt
```

> Tip: “Help! My file was a lot larger than I thought and a million lines of text are scrolling down my screen!!” If you ever encounter a situation where you need to stop the computer from doing whatever it’s doing then press the `Control` + `C` keys simultaneously. It will stop the process immediately.
 
### Looking at big files
As illustrated above, if you `cat` a big file it will probably be unhelpful. Instead, you can look at parts of the file using the commands `head`, `tail`, and `less`.

#### Head

First up is `head`, which lets you look at the beginning of the file.

Print the first 10 lines of `stuff.txt`:
```
head stuff.txt
```

Print the first 30 lines of `stuff.txt`:
```
head -n 30 stuff.txt
```

Print the first 30 lines of `stuff.txt` without typing as much as I did in the last command:
```
head -30 stuff.txt
```
> Note: `-n` followed by a number is a flag specifying the number of lines to print. But it's also the default so if you just want to look at the number of lines you can use the shorter `head -30` instead of `head -n 30`.

Print the first 10 characters of `stuff.txt`:
```
head -c 10 stuff.txt
```

#### Tail

Next is `tail`, which lets you look at the end of the file.

Print the last 10 lines of `stuff.txt`:
```
tail stuff.txt
```

Print the last 30 lines of `stuff.txt`:
```
tail -n 30 stuff.txt
```

Print the last 10 characters of `stuff.txt`:
```
tail -c 10 stuff.txt
```

#### Less

Finally, if you want to see your entire file without printing it to the screen, then you can use `less`. This will create an interactive environment where you can scroll up and down through your file, but you cannot modify it. 

> Note: There is also a command called `more` which is very similar to `less`, but `less` is a bit faster. Really, you can use either one.

View `stuff.txt` interactively:
```
less stuff.txt
```

You’re now in interactive mode! There isn’t a set number of lines that `less` will print; it depends on how large you have your Terminal window open. To scroll down, press :arrow_down: or `return` key. To scroll up, press :arrow_up:. To quit interative mode, press `q`.

### Looking at compressed files

If you tried any of the above commands on a compressed file then you’ll have gotten a string of gibberish printed to your screen. Not to worry, there’s a way of looking at the contents of a compressed file using `less`.

> Tip: To combine commands, you send one command to the other using a `|` (pipe). `|` can be typed by pressing `Shift` + `\`.

Print the first 10 lines of `stuff.txt.gz`:
```
less stuff.txt.gz | head
```

Print the first 30 lines of `stuff.txt.gz`:
```
less stuff.txt.gz | head -30
```

Print the last 10 lines of `stuff.txt.gz`:
```
less stuff.txt.gz | tail
```

> **Caution:** I would not recommend using the tail command on a large compressed file as it would take forever to return a result.

The next one is a bit more complicated. Say you want to look at the beginning of your DNA sequences, not the whole line. You can cut the line down to show the first 20 characters so it neatly fits on your screen and is easier to look at.

Print the first 20 characters of the first 10 lines of `stuff.txt.gz`:
```
less stuff.txt.gz | head | cut -c 1-20
```

Example `less stuff.txt.gz | head` output:
```
@HWI-ST876:512:HCK2TBCXX:1:1101:15860:3098 1:N:0:
CATGCCTCACCAAGTTTGGTGCATGGAGTAAAATGTAATTAAAGGATACAAATGGATTCCAGACATCATCCAGCAGAGATGGTTGTGTATATGTTCCATGGTTAGGTGTAACCTTTGCTAGAAGAACAACTAGTTGCGTACCCAGA
+
EHIIIEFE1FEGE@<1DE=<1<1<@1D11<<<<@EG?1<CFD1111<<<FF1FGECFEEDF1<DCDC@F11<1<<1<<1<11<<D<C11<C<E<<1<D1EHE11<<FHCF1G1<1C1<111<CFC@11<GH?DEH1F.CC?G1<D@
@HWI-ST876:512:HCK2TBCXX:1:1101:19253:3820 1:N:0:
CTTGCAAATCACCAGAAGGCGGTTCCTGAATGAATGGGAAGCCTTCAAGAAGGTGATAAGCAGGAGAACCATACGAAGGCGCATAACGATACCACTGACCCTCAGCAATCTTAAACTTCTTAGACGAATCACCAGAACGGAAAACA
+
CG<F11<1<DFC?1<CFH?GEHE<CCEC1<<<D1CDHH@1C1<<<D1<D1<CHH@C111<DDGE0D<11<1<<GCE10<C<C/<011DCE@/<C1<<GG1D11<1F1C<11DC1<C11<<C<D@?CF/EH?EH1<<<CHE00C###
@HWI-ST876:512:HCK2TBCXX:1:1101:6272:2502 1:N:0:
CATGCGCCGCTCTGTTTTCTTTTGGGTGGGGGGCTTGTTTTTCTTTTTAGAGGCAGAATGCTGGGGAGCCGGTCCATACCGTGGATTATAAACCGGCTCCTCAGCATTCTGATTGGCTGCAAGCCATGTTATAACCACTGAAAGTT
```

Example `less stuff.txt.gz | head | cut -c 1-20` output:
```
@HWI-ST876:512:HCK2T
CATGCCTCACCAAGTTTGGT
+
EHIIIEFE1FEGE@<1DE=<
@HWI-ST876:512:HCK2T
CTTGCAAATCACCAGAAGGC
+
CG<F11<1<DFC?1<CFH?G
@HWI-ST876:512:HCK2T
CATGCGCCGCTCTGTTTTCT
```
