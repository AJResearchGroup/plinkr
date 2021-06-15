
```
richel@N141CU:~$ /home/richel/.local/share/plinkr/plink_1_9_unix/plink --map ~/.cache/plinkr/fileb613233af34/assoc_input.map --ped ~/.cache/plinkr/fileb613233af34/assoc_input.ped --assoc --allow-extra-chr --maf 2.2250738585072e-308 --ci 0.95 --out ~/.cache/plinkr/fileb6138d3b3e7/assoc_output --noweb
PLINK v1.90b6.22 64-bit (16 Apr 2021)          www.cog-genomics.org/plink/1.9/
(C) 2005-2021 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output.log.
Options in effect:
  --allow-extra-chr
  --assoc
  --ci 0.95
  --maf 2.2250738585072e-308
  --map /home/richel/.cache/plinkr/fileb613233af34/assoc_input.map
  --noweb
  --out /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output
  --ped /home/richel/.cache/plinkr/fileb613233af34/assoc_input.ped

Note: --noweb has no effect since no web check is implemented yet.
7652 MB RAM detected; reserving 3826 MB for main workspace.

Error: Invalid chromosome code '95' on line 1 of .map file.
(This is disallowed for humans.  Check if the problem is with your data, or if
you forgot to define a different chromosome set with e.g. --chr-set.)
```





```
richel@N141CU:~/GitHubs/plinkr/scripts$ /home/richel/.local/share/plinkr/plink_1_9_unix/plink --map ~/.cache/plinkr/fileb613233af34/assoc_input.map --ped ~/.cache/plinkr/fileb613233af34/assoc_input.ped --assoc --chr-set 95 --allow-extra-chr --maf 2.2250738585072e-308 --ci 0.95 --out ~/.cache/plinkr/fileb6138d3b3e7/assoc_output --noweb
PLINK v1.90b6.22 64-bit (16 Apr 2021)          www.cog-genomics.org/plink/1.9/
(C) 2005-2021 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output.log.
Options in effect:
  --allow-extra-chr
  --assoc
  --chr-set 95
  --ci 0.95
  --maf 2.2250738585072e-308
  --map /home/richel/.cache/plinkr/fileb613233af34/assoc_input.map
  --noweb
  --out /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output
  --ped /home/richel/.cache/plinkr/fileb613233af34/assoc_input.ped

Note: --noweb has no effect since no web check is implemented yet.
7652 MB RAM detected; reserving 3826 MB for main workspace.
.ped scan complete (for binary autoconversion).
Performing single-pass .bed write (1 variant, 10 samples).
--file: /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output-temporary.bed +
/home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output-temporary.bim +
/home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output-temporary.fam written.
1 variant loaded from .bim file.
10 samples (10 males, 0 females) loaded from .fam.
10 phenotype values loaded from .fam.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 10 founders and 0 nonfounders present.
Calculating allele frequencies... done.
0 variants removed due to minor allele threshold(s)
(--maf/--max-maf/--mac/--max-mac).
1 variant and 10 samples pass filters and QC.
Among remaining phenotypes, 6 are cases and 4 are controls.
Writing C/C --assoc report to
/home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output.assoc ...
done.
```


```
richel@N141CU:~/GitHubs/plinkr/scripts$ /home/richel/.local/share/plinkr/plink_1_9_unix/plink --map ~/.cache/plinkr/fileb613233af34/assoc_input.map --ped ~/.cache/plinkr/fileb613233af34/assoc_input.ped --assoc --chr-set 96 --allow-extra-chr --maf 2.2250738585072e-308 --ci 0.95 --out ~/.cache/plinkr/fileb6138d3b3e7/assoc_output --noweb
PLINK v1.90b6.22 64-bit (16 Apr 2021)          www.cog-genomics.org/plink/1.9/
(C) 2005-2021 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output.log.
Options in effect:
  --allow-extra-chr
  --assoc
  --chr-set 96
  --ci 0.95
  --maf 2.2250738585072e-308
  --map /home/richel/.cache/plinkr/fileb613233af34/assoc_input.map
  --noweb
  --out /home/richel/.cache/plinkr/fileb6138d3b3e7/assoc_output
  --ped /home/richel/.cache/plinkr/fileb613233af34/assoc_input.ped

Error: Invalid --chr-set parameter '96'.
For more information, try "plink --help <flag name>" or "plink --help | more".
```
