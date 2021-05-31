# Installation

This page explains how to  

  * Install `plinkr`
  * Install all PLINK versions
  * Install a specific PLINK version

## Install `plinkr`

`plinkr` is not on CRAN yet. To install `plinkr`:

```
library(remotes)
install_github("richelbilderbeek/plinkr")
```

This assumes you have the `remotes` package installed.

## Install all PLINK versions

`plinkr` uses multiple version of PLINK. To install them all:

```
library(plinkr)
install_plinks()
```

Use `get_plink_versions()` to see which versions are supported.

## Install a specific PLINK version

`plinkr` works with multiple versions of `plink` by default.
It is possible to only install a single version:

 * Install PLINK v1.7
 * Install PLINK v1.9

Use `get_plink_versions()` to see which versions are supported.

### Install PLINK v1.7

To install only PLINK v1.7:

```
library(plinkr)
install_plink(create_plink_v1_7_options())
```


### Install PLINK v1.9

To install only PLINK v1.9:

```
library(plinkr)
install_plink(create_plink_v1_9_options())
```

