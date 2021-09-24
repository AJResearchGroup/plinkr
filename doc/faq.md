# FAQ

 * Installation
 * General
 * Technical

## Installation

See [install.md](install.md)

## General

### On which operating systems can I run `plinkr`?

On Linux and Windows.

`plinkr` is tested to work on Linux by GitHub Actions,
and tested to work on Windows by AppVeyor.

### Why is this package not on CRAN?

Because no real users have yet tested it, except me.

When it moves to CRAN, the `install` and `uninstall` functions will move
to a non-CRAN package, as these functions violate CRAN policy.

## Technical

### Which PLINK versions are supported?

 * [PLINK v1.7](http://zzz.bwh.harvard.edu/plink/)
 * [PLINK v1.9](https://www.cog-genomics.org/plink/1.9/)
 * [PLINK2 v2.0](https://www.cog-genomics.org/plink/2.0/) 

### Can plinkr handle SNPs with three or four alleles?

No. PLINK cannot, so plinkr cannot.

### How can I use a version of PLINK I have installed elsewhere?

The `create_custom_plink_options` allows to do so.
If the PLINK executable can be found at `my_plink_path/plink3.mp4`,
create a `plink_options` as such:

```
plink_options <- create_custom_plink_options("my_plink_path/plink3.mp4")
```

This `plink_options` can be used in all functions that call PLINK,
for example:

```
get_plink_version(plink_options)
```

### Are there packages like `plinkr`?

Yes, there are R packages that have a subset of the `plinkr` functionality

### Why don't you use packages with the (subset of) the `plinkr` functionality?

I do if I can, if I dare rely on those packages.

These are package(s) I dare rely on:

 * [genio](https://github.com/OchoaLab/genio)

These are package(s) I dare not rely on:

 * [quartzbio/plinker_pkg](https://github.com/quartzbio/plinker_pkg):
   discontinued since 2018

### What is unique about `plinkr`?

 * It can use multiple version of PLINK and PLINK2,
   allowing for a direct comparison
 * It can simulate data
 * It follows all (if not, let me know) quality guidelines
   as described im the literature, specifically the
   Tidyverse guidelines

