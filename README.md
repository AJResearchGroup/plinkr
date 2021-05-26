# plinkr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/plinkr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/plinkr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/plinkr/branch/develop)

Work with [PLINK](http://zzz.bwh.harvard.edu/plink/) from R

:construction: Users wanted! Go ahead and post an Issue with a feature request, or send me an email. Any suggestions are welcome, but I won't promise I'll implement them :-)

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

Use `get_plink_versions()` to see which versions are supported.

Of course, you can also call PLINK to detect genetic associations:

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
assoc_qt_results <- assoc_qt(assoc_qt_params)
```

## Features

If one of these do not work as expected, 
please submit a bug report,
see [CONTRIBUTING.md](CONTRIBUTING.md).

### Stable

Function name                 | Description
------------------------------|-----------------------------------------------------
`check_plink_install`         | check if PLINK is installed, stop if not
`is_plink_installed`          | determine if PLINK is installed, yes/no
`get_plink_version`           | get the version of PLINK
`get_test_map_table`          | get a test genetic mapping table
`get_test_ped_table`          | get a test pedigree table
`install_plinks`              | install PLINKs
`read_plink_assoc_file`       | read a PLINK `.assoc` file
`read_plink_log_file`         | read a PLINK `.log` file
`read_plink_map_file`         | read a PLINK `.map` file
`read_plink_ped_file`         | read a PLINK `.ped` file
`read_plink_phenotype_file`   | read a PLINK phenotype file
`read_plink_qassoc_file`      | read a PLINK `.qassoc` file
`read_plink_simfreq_file`     | read a PLINK `.simfreq` file
`run_plink`                   | run PLINK
`save_map_table_to_file`      | save a genetic mapping table to a PLINK `.map` file
`save_ped_table_to_file`      | save a pedigree table to a PLINK `.ped` file
`save_phenotype_table_to_file`| save a phenotype table to a PLINK phenotype file
`uninstall_plinks`            | uninstall PLINKs

Interface is likely to stay the same. 

### Unstable

Function name                 | Description
------------------------------|---------------------------------------------------------------------
`assoc_qt`                    | detect an association with one or more quantitative traits
`create_demo_assoc_qt_params` | create parameters to demonstrate a quantitative trait analysis
`create_demo_map_table`       | create a genetic map to demonstrate a quantitative trait analysis 
`create_demo_ped_table`       | create a pedigree table to demonstrate a quantitative trait analysis 
`create_demo_phenotype_table` | create a phenotype map to demonstrate a quantitative trait analysis 

Interface may change.

## FAQ

### On which operating systems can I run `plinkr`?

`plinkr` is tested by GitHub Actions to work on Linux, Mac and Windows.
(note: that does not mean I trust it to work on Mac or Windows)

### Why is this package not on CRAN?

Because no real users have yet tested it, except me.

When it moves to CRAN, the `install` and `uninstall` functions will move
to a non-CRAN package, as these functions violate CRAN policy.

