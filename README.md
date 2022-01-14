# plinkr

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/plinkr/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/plinkr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/plinkr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/plinkr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/plinkr/branch/develop)

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

`plinkr` can seamlessly run any `PLINK` or `PLINK2` versions.

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

`plinkr` can seamlessly use `PLINK`/`PLINK2` in-memory-data or files.

```
library(plinkr)
assoc_qt_params <- create_demo_assoc_qt_params()
assoc_qt(assoc_qt_params)
```

To convert the in-memory data to PLINK binary format and do the same
quantitative trait analysis:

```
assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
  assoc_qt_params$data
)
assoc_qt(assoc_qt_params)
```

 * See the vignette `demo_assoc_qt` for a walk-through of
   the data that is simulated by default
 * See the vignette `create_demo_assoc_qt_params` for many
   examples how data can be simulated

### Associations

Association type|Data type        |General function          |Specialized function
----------------|-----------------|--------------------------|------------------------------------------
Case-control    |PLINK1 text data |`assoc`                   |`assoc_on_plink_text_data`
Case-control    |PLINK1 bin data  |`assoc`                   |`assoc_on_plink_bin_data`
Case-control    |PLINK2 bin data  |`assoc`                   |`assoc_on_plink2_bin_data`
Case-control    |PLINK1 text files|`assoc` :construction:    |`assoc_on_plink_text_files` :construction:
Case-control    |PLINK1 bin files |`assoc` :construction:    |`assoc_on_plink_bin_files` :construction:
Case-control    |PLINK2 bin files |`assoc` :construction:    |`assoc_on_plink2_bin_files` :construction:
Quantitative    |PLINK1 text data |`assoc_qt`                |`assoc_qt_on_plink_text_data`
Quantitative    |PLINK1 bin data  |`assoc_qt`                |`assoc_qt_on_plink_bin_data`
Quantitative    |PLINK2 bin data  |`assoc_qt`                |`assoc_qt_on_plink2_bin_data`
Quantitative    |PLINK1 text files|`assoc_qt` :construction: |`assoc_qt_on_plink_text_files` :construction:
Quantitative    |PLINK1 bin files |`assoc_qt` :construction: |`assoc_qt_on_plink_bin_files` :construction:
Quantitative    |PLINK2 bin files |`assoc_qt` :construction: |`assoc_qt_on_plink2_bin_files` :construction:

### PLINK and PLINK2 files conversions

`plinkr` allows to convert between any PLINK and PLINK2 files.

From               |To                 |Function name
-------------------|-------------------|----------------------------------------------
PLINK1 text files  |PLINK1 binary files|`convert_plink_text_files_to_plink_bin_files`
PLINK1 text files  |PLINK2 binary files|`convert_plink_text_files_to_plink2_bin_files`
PLINK1 binary files|PLINK text files   |`convert_plink_bin_files_to_plink_text_files`
PLINK1 binary files|PLINK2 binary files|`convert_plink_bin_files_to_plink2_bin_files`
PLINK2 binary files|PLINK text files   |`convert_plink2_bin_files_to_plink_text_files` :construction:
PLINK2 binary files|PLINK binary files |`convert_plink2_bin_files_to_plink_bin_files`
:construction:     |:construction:     |:construction:
any type of files  |PLINK text files   |`convert_files_to_plink_text_files` :construction:
any type of files  |PLINK1 binary files|`convert_files_to_plink_bin_files` :construction:
any type of files  |PLINK2 binary files|`convert_files_to_plink2_bin_files` :construction:
PLINK1 binary files|SAIGE files        |`create_bgen_files_for_saige` :construction:
PLINK1 binary files|PLINK2 VCF files   |`convert_plink_bin_files_to_plink_vcf_files` :construction:

### PLINK and PLINK2 data conversions

`plinkr` allows to convert between any PLINK and PLINK2 data.

From              |To                |Function name
------------------|------------------|--------------------------------------------
PLINK1 text data  |PLINK1 binary data|`convert_plink_text_data_to_plink_bin_data`
PLINK1 text data  |PLINK2 binary data|`convert_plink_text_data_to_plink2_bin_data`
PLINK1 binary data|PLINK text data   |`convert_plink_bin_data_to_plink_text_data` :construction:
PLINK1 binary data|PLINK2 binary data|`convert_plink_bin_data_to_plink2_bin_data`
PLINK2 binary data|PLINK text data   |`convert_plink2_bin_data_to_plink_text_data` :construction:
PLINK2 binary data|PLINK binary data |`convert_plink2_bin_data_to_plink_bin_data`

## Singularity container

 * [Find the latest 'plinkr' Singularity container](https://cloud.sylabs.io/library/search;query=plinkr)

## FAQ

See [doc/faq.md](doc/faq.md)

