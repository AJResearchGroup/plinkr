# plinkr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/plinkr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/plinkr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/plinkr/branch/develop)

Work with [PLINK](http://zzz.bwh.harvard.edu/plink/) from R

 * Doing the first PLINK example: [YouTube](https://youtu.be/LsfKQw2oIUg) [download (.ogv)](http://richelbilderbeek.nl/plinkr_basic_usage.ogv)
 * Detect an association with one or more quantitative traits: [YouTube](https://youtu.be/IicNdc8sDfI) [download (.ogv)](http://richelbilderbeek.nl/plinkr_assoc_qt.ogv)
 * Detect an association with ideal quantitative traits: [YouTube](https://youtu.be/oXGy83WiHm4) [download (.ogv)](http://richelbilderbeek.nl/plinkr_demo_qt_assoc.ogv)

## Examples

### Installing PLINKs

`plinkr` uses multiple version of PLINK. To install them all:

```
library(plinkr)
install_plinks()
```

Use `get_plink_versions()` to see which versions are supported.

### Running PLINK

Run PLINK:

```
library(plinkr)
run_plink("--help")
```

To call a specific version of PLINK:

```
run_plink("--help", plink_version = "1.7")
```

Of course, you can also call PLINK to detect genetic associations :-) :

```
# Use the PLINK v1.9 example files
ped_filename <- get_plink_example_filename("toy.ped")
map_filename <- get_plink_example_filename("toy.map")

# Do a case-control association
plinkr::run_plink(
  args = c(
    "--ped", ped_filename, 
    "--map", map_filename
  )
)
```

For other examples, see the vignette `basic_usage.Rmd` for basic usage,
as taken from the PLINK website.

### Demonstrate a quantitative trait analysis

```
library(plinkr)
assoc_qt_params <- create_demo_assoc_qt_params()
assoc_qt(assoc_qt_params)
```

## FAQ

### On which operating systems can I run `plinkr`?

`plinkr` is tested by GitHub Actions to work on Linux, Mac and Windows.
(note: that does not mean I trust it to work on Mac or Windows until
real users confirm this)

### Why is this package not on CRAN?

Because no real users have yet tested it, except me.

When it moves to CRAN, the `install` and `uninstall` functions will move
to a non-CRAN package, as these functions violate CRAN policy.

### Can plinkr handle SNPs with three or four alleles?

No. PLINK cannot, so plinkr cannot.


