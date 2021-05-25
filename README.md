# plinkr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/plinkr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/plinkr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/plinkr/branch/develop)

Work with [PLINK](http://zzz.bwh.harvard.edu/plink/) from R

 * Doing the first PLINK example: [YouTube](https://youtu.be/LsfKQw2oIUg) [download (.ogv)](http://richelbilderbeek.nl/plinkr_basic_usage.ogv)
 * Detect an association with one or more quantitative traits: [YouTube](https://youtu.be/IicNdc8sDfI) [download (.ogv)](http://richelbilderbeek.nl/plinkr_assoc_qt.ogv)

## Examples

### Installing PLINKs

`plinkr` uses multiple version of PLINK. To install them all:

```
library(plinkr)
install_plinks()
```

### Demonstrate a quantitative trait analysis

```
library(plinkr)
assoc_qt_params <- create_demo_assoc_qt_params()
assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
```

## Features

 * [x] Check if PLINK is installed, stop if not
 * [x] Detect an association with one or more quantitative trait
 * [x] Determine if PLINK is installed, yes/no
 * [x] Get the help text of PLINK
 * [x] Get the version of PLINK
 * [x] Install PLINK
 * [x] PLINK versions 1.7 and 1.9
 * [x] Run PLINK
 * [x] Uninstall PLINK
