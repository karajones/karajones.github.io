### File conversion
#### Admixture: ipyrad vcf to plink bed
Programs you will need:
- [vcftools](https://vcftools.github.io/index.html "vcftools")
- [plink 1.9](https://www.cog-genomics.org/plink2 "plink 1.9")

VCF files output by ipyrad contain all the SNPs found at each locus. But for Admixture, you need unlinked SNPs (i.e. only one SNP per locus). To make sure that the SNPs in your final file are unlinked, you will need to `thin` the SNPs to the length of your sequence reads using vcftools. For example, if you are using 150 bp single-end reads, then you would use `--thin 150`. For 100 bp paired-end reads, you would use `--thin 200`.

The following code will input a file called `test.vcf` containing SNPs from sequences with 150 bp single-end reads and output a file called `test.recode.vcf`:
~~~
vcftools --vcf test.vcf --recode --thin 150 --out test
~~~

```
VCFtools - v0.1.14
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf test.vcf
	--thin 150
	--out test
	--recode

After filtering, kept 27 out of 27 Individuals
Outputting VCF file...
After filtering, kept 505 out of a possible 5512 Sites
Run Time = 0.00 seconds
```

Next, convert the vcf to a plink ped format in vcftools[^1]. Since ipyrad using locus numbers instead of chromosomes, all the locus numbers will be replaced with zeros. The program will then output two files: `test.ped` and `test.map`.
~~~
vcftools --vcf test.recode.vcf --out test --plink
~~~

```
VCFtools - v0.1.14
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf test.recode.vcf
	--out test
	--plink

After filtering, kept 27 out of 27 Individuals
Writing PLINK PED and MAP files ... 

Unrecognized values used for CHROM: locus_462 - Replacing with 0.
Unrecognized values used for CHROM: locus_1020 - Replacing with 0.
...
Unrecognized values used for CHROM: locus_173973 - Replacing with 0.
Done.
After filtering, kept 505 out of a possible 505 Sites
Run Time = 0.00 seconds
```

Finally, convert the `ped` file to a `bed` file:
~~~
plink --file test --make-bed --allow-extra-chr 0 --out test
~~~

```
PLINK v1.90b3.30 64-bit (27 Jan 2016)      https://www.cog-genomics.org/plink2
(C) 2005-2016 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to test.log.
Options in effect:
  --allow-extra-chr 0
  --file test
  --make-bed
  --out test

8192 MB RAM detected; reserving 4096 MB for main workspace.
.ped scan complete (for binary autoconversion).
Performing single-pass .bed write (494 variants, 27 people).
--file: test-temporary.bed + test-temporary.bim + test-temporary.fam written.
494 variants loaded from .bim file.
27 people (0 males, 0 females, 27 ambiguous) loaded from .fam.
Ambiguous sex IDs written to test.nosex .
Using 1 thread (no multithreaded calculations invoked.
Before main variant filters, 27 founders and 0 nonfounders present.
Calculating allele frequencies... done.
Total genotyping rate is 0.98703.
494 variants and 27 people pass filters and QC.
Note: No phenotypes present.
--make-bed to test.bed + test.bim + test.fam ... done.
```

You will need to following three files to run Admixture: `test.bed`, `test.bim` and `test.fam`.

[^1]:	If you are using Pyrad, rather than ipyrad, then this next step will need to be altered. Open test.recode.vcf in a text editor and change all of values in the first column to be 0. (You can do this easily by copy and pasting the file into Excel.) Then run: `plink --file test --make-bed --allow-extra-chr 0 --out test`
