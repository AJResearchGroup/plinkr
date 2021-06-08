# plinkr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/plinkr/actions)|[![AppVeyor logo](man/figures/AppVeyor.png)](https://ci.appveyor.com/project/richelbilderbeek/plinkr/)                                                                                 |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=master)   |[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/richelbilderbeek/plinkr?branch=master&svg=true)](https://ci.appveyor.com/project/richelbilderbeek/plinkr) |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/plinkr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/richelbilderbeek/plinkr?branch=develop&svg=true)](https://ci.appveyor.com/project/richelbilderbeek/plinkr)|[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/plinkr/branch/develop)

Work with PLINK and PLINK2 from R.

 * Doing the first PLINK example: [YouTube](https://youtu.be/LsfKQw2oIUg) [download (.ogv)](http://richelbilderbeek.nl/plinkr_basic_usage.ogv)
 * Detect an association with one or more quantitative traits: [YouTube](https://youtu.be/IicNdc8sDfI) [download (.ogv)](http://richelbilderbeek.nl/plinkr_assoc_qt.ogv)
 * Detect an association with ideal quantitative traits: [YouTube](https://youtu.be/oXGy83WiHm4) [download (.ogv)](http://richelbilderbeek.nl/plinkr_demo_qt_assoc.ogv)
 * Simulate quantitative traits: [YouTube](https://youtu.be/H0XlLVsFry4) [download (.ogv)](http://richelbilderbeek.nl/plinkr_create_demo_assoc_qt_params.ogv)
 * Simulate custom traits: [YouTube](https://youtu.be/5X1kLkiQbtw) [download (.ogv)](http://richelbilderbeek.nl/plinkr_create_custom_trait.ogv)
 * Detect an association with a binary trait/case-control phenotype: [YouTube](https://youtu.be/LhXQcDQvZS0) [download (.ogv)](http://richelbilderbeek.nl/plinkr_assoc.ogv)

## Installation

See [doc/install.md](doc/install.md)

## Examples

### Running PLINK

Run PLINK:

```
library(plinkr)
run_plink("--help")
```

To call a specific version of PLINK:

```
run_plink("--help", create_plink_v1_7_options())
run_plink("--help", create_plink_v1_9_options())
run_plink("--help", create_plink_v2_0_options())
```

Of course, you can also call PLINK to detect genetic associations :-) :

```
# Use the PLINK v1.9 example files
plink_v1_9 <- create_plink_v1_9_options()
ped_filename <- get_plink_example_filename("toy.ped", plink_v1_9)
map_filename <- get_plink_example_filename("toy.map", plink_v1_9)

# Do a case-control association
plinkr::run_plink(
  args = c(
    "--ped", ped_filename, 
    "--map", map_filename
  )
)
```

 * See the vignette `basic_usage` for basic usage of PLINK, 
   as taken from the PLINK website, which shows a 
   quantitative trait analysis
 * See the vignette `test_assoc_qt` for the same basic usage of PLINK,
   using the `plinkr` interface
 * See the vignette `demo_assoc_qt` for doing a quantitative trait
   analysis using simulated data and the `plinkr` interface

### Demonstrate a quantitative trait analysis

```
library(plinkr)
assoc_qt_params <- create_demo_assoc_qt_params()
assoc_qt(assoc_qt_params)
```

 * See the vignette `demo_assoc_qt` for a walk-through of
   the data that is simulated by default
 * See the vignette `create_demo_assoc_qt_params` for many
   examples how data can be simulated

## FAQ

See [doc/faq.md](doc/faq.md)
