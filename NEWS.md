# News

Newest versions at top.

## plinkr v0.20.2 (2022-05-19)

### NEW FEATURES

 * Add 'pca'
 * Add 'plot_pca_results'

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.20.1 (2021-05-04)

### NEW FEATURES

 * Add 'check_sample_selector'
 * Add 'check_single_sample_selector'
 * Add 'create_keep_args'
 * Add 'create_random_samples_selector'
 * Add 'create_select_samples_args'
 * Add 'create_select_single_sample_args'
 * Add 'create_selected_sample_ids'
 * Add 'create_single_sample_selector'
 * Add 'create_test_single_sample_selector'
 * Add 'get_n_samples'
 * Add 'is_fam_table'
 * Add 'is_psam_table'
 * Add 'is_single_sample_selector'
 * Add 'select_samples'
 * Can use the PLINK '--allow-no-sex' flag in 'assoc_qt'
 * Can use the PLINK '--ci' flag in 'assoc_qt'

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.20 (2022-04-26)

### NEW FEATURES

 * Add 'select_snps'
 * Add 'create_chromosome_selector'
 * Add 'create_single_snp_selector'
 * Add 'create_random_snps_selector'
 * Add 'create_snp_range_selector'
 * Add 'create_snp_window_selector'
 * Use attributes to distinguish between `pgen_table` and `bed_table`

### MINOR IMPROVEMENTS

 * 'assoc' now follows uniform interface

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * Uses `genio` v1.1.0

## plinkr v0.19.2 (2022-03-15)

### NEW FEATURES

 * None

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * 'assoc_qt_params' has no 'data' nor 'phe_table' anymore, 
   as these are part of 'assoc_qt_data'

## plinkr v0.19.1 (2022-03-08)

### NEW FEATURES

 * Added 'check_phe_file_ok_for_qt'
 * Added 'check_phe_table_ok_for_qt'
 * Added 'get_n_snps'
 * Added 'get_n_snps_from_bed_table'
 * Added 'get_n_snps_from_bim_table'
 * Added 'get_n_snps_from_map_table'
 * Added 'get_n_snps_from_ped_table'
 * Added 'get_n_snps_from_pgen_table'
 * Added 'get_n_snps_from_pvar_table'
 * Added 'is_bed_table'
 * Added 'is_bim_table'
 * Added 'is_map_table'
 * Added 'is_ped_table'
 * Added 'is_pgen_table'
 * Added 'is_pvar_table'

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * Added 'check_phe' does not check if a table of phenotypic
   values can be used in a quantitative trait analysis

## plinkr v0.19 (2022-02-25)

### NEW FEATURES

 * Use 'rocker/tidyverse' as the base for the Singularity container

### MINOR IMPROVEMENTS

 * Improve Singularity doc

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.18.0.3 (2022-02-22)

### NEW FEATURES

 * None

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * A phenotype table's IID is of type character

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.18.0.2 (2022-02-21)

### NEW FEATURES

 * Added 'check_fam_filename'
 * Added 'check_phe_filename'
 * Added 'check_sample_ids'
 * Added 'check_sample_ids_filename'
 * Added 'get_marker_correlation_coefficients'
 * Added 'get_minor_alelle_frequencies'
 * Added 'get_sample_ids_from_fam_file'
 * Added 'get_sample_ids_from_fam_table'
 * Added 'get_sample_ids_from_phe_file'
 * Added 'get_sample_ids_from_phe_table'
 * Added 'get_test_sample_ids'
 * Added 'keep'
 * Added 'save_sample_ids'

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.18.0.1 (2022-01-13)

### NEW FEATURES

 * Added `convert_plink_bin_files_to_plink_text_files`
 * Added `rename_fids` to rename all family IDs in any in-memory data
 * Added `rename_iids` to rename all within-family IDs in any in-memory data

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.18 (2021-11-02)

### NEW FEATURES

 * Uniform interface

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * Renamed `create_demo_assoc_qt_params` to `create_demo_assoc_qt_data`
 * Removed `assoc_qt_nth_trait`

## plinkr v0.17.1 (2021-10-04)

### NEW FEATURES

 * Added 'compare_assoc_qt_speed' to compare speed of PLINK versions and
   types of data, #26
 * Check PLINK arguments to give an error for commands that are ignored,
   as PLINK will not always give you an error or warning

### MINOR IMPROVEMENTS

 * Use `stringi` version v1.7.5, #21
 * Simplify some `get_test_` functions
 * Improve code coverage

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.17 (2021-10-01)

### NEW FEATURES

 * Can convert PLINK2 binary files to PLINK1 binary files
 * Can do `assoc_qt` with PLINK2 binary data

### MINOR IMPROVEMENTS

 * `pgen_table` can have SNP IDs as column names and individuals' IDs as row names

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * Remove redundant '_to_file' in 'save_[something]' function names

## plinkr v0.16.2 (2021-09-28)

### NEW FEATURES

 * Can convert PLINK1 text files to PLINK1 binary files to PLINK2 binary files

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * `stringi::stri_trim_both` and `stringi::stri_split_regex` **sometimes** 
   gives an 'embedded nul in string' error or a segfault.
   This has been reported at https://github.com/gagolews/stringi/issues/458.
   Until then, a workaround with base R is used

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.16.1 (2021-09-23)

### NEW FEATURES

 * None

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * stringr::str_trim **sometimes** gives an 'embedded nul in string' error.
   This has been reported at https://github.com/tidyverse/stringr/issues/399.
   Until then, a workaround is used

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.16 (2021-09-22)

### NEW FEATURES

 * Use a `data` function argument, that can be either 
   be PLINK1 text data (read from `.ped` and `.map` files),
   PLINK 1 binary data (read from `.bed`, `.bim` and `.fam` files)
   or PLINK2 binary data (not yet implemented)

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.15.2 (2021-07-30)

### NEW FEATURES

 * Nonse

### MINOR IMPROVEMENTS

 * Singularity container is tested to run plinkr scripts

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.15.1 (2021-07-28)

### NEW FEATURES

 * Nonse

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * Singularity version matches package version

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.15 (2021-07-28)

### NEW FEATURES

 * Added a Singularity container with `plinkr` and the PLINKs installed
 * Start of using the three types of data: `create_plink_text_data`, 
   `create_plink_bin_data` and `create_plink2_bin_data`

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.14 (2021-07-01)

### NEW FEATURES

 * Add vignette with PLINK tutorial
 * Add `install_plink_tutorial_data` and `uninstall_plink_tutorial_data`
   to install and uninstall the PLINK tutorial data
 * Add `read_plink_assoc_adjusted_file` to read PLINK `.assoc.adjusted` files
 * Add `read_plink_lmiss_file` to read PLINK `.lmiss` files
 * Add `read_plink_imiss_file` to read PLINK `.imiss` files
 * Add `read_plink_frq_file` to read PLINK `.frq` files
 * Add `read_plink_frq_strat_file` to read PLINK `.frq.strat` files
 * Add `missing_from_bfile` to run a PLINK `--missing` analysis from
   PLINK binary files
 * Add `freq_from_bfile` to run a PLINK `--freq` analysis from
   PLINK binary files
 * Add `freq_from_bfile_within_phe_file` to run a PLINK `--freq` analysis from
   PLINK binary files with a stratification on the phenotype
 * Add `assoc_from_bfile` to run a PLINK `--assoc` analysis from
   PLINK binary files
 * Add `assoc_adjust_from_bfile` to run a PLINK `--assoc --adjust` analysis from
   PLINK binary files
 * Add `assoc_qt_covar` to do a quantitative traits analysis with covariates

### MINOR IMPROVEMENTS

 * Add vignette to demonstrate how example files are created
 * Use `--noweb` flag only in PLINK versions that support it

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * All function with `phenotype` in it (e.g. `read_phenotype_file`), 
   use `phe` instead (e.g. `read_phe_file`). This to have a naming
   scheme consistent with PLINK
 * `assoc_` functions return a list with an association table and
   a log (instead of just the association table), to ensure all
   info by PLINK is used
 * Example phenotype files with the `.raw` extension have been renamed 
   to have a `.phe` file extension, except for `pheno.raw`, as that filename
   is used in the PLINK tutorial

## plinkr v0.13 (2021-06-17)

### NEW FEATURES

 * Phenotype files can have phenotype names

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.12 (2021-06-16)

### NEW FEATURES

 * Can read `.bed`, `.bim` and `.fam` files
 * Check that maximally 95 chromosomes are used, as this is a (default)
   PLINK limit, see https://www.cog-genomics.org/plink/1.9/input#chr_set
 * Handle multiple phenotypes using in the PLINK way, using `--all-pheno`
 * Add `save_qassoc_table` to save the results of a quantitive
   association to file in the same way PLINK creates a `.qassoc` file
 * Renamed column names `family_id` to `FID`, as this is the abbreviation
   PLINK uses, see https://www.cog-genomics.org/plink/1.9/input#pheno
 * Renamed column names `within_family_id` to `IID`, as this is the abbreviation
   PLINK uses, see https://www.cog-genomics.org/plink/1.9/input#pheno

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.11 (2021-06-09)

### NEW FEATURES

 * Add confidence interval for `assoc`
 * `read_plink_assoc_file` can read `.assoc` files with a confidence interval
 * Add `make_bed` to convert the (non-binary) `.map` and `.ped` files 
   to their binary `.bed`, `.bim` and `.fam` equivalents

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.10 (2021-06-02)

### NEW FEATURES

 * `install_plinks` also installs PLINK2

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.9 (2021-05-31)

### NEW FEATURES

 * Add `assoc` to detect associations for a binary trait
 * Allow to use a custom version of PLINK, #4, thanks @HadrienG
 * Can run PLINK on Mac, #5, thanks @HadrienG 

### MINOR IMPROVEMENTS

 * `create_demo_assoc_qt_params` can now accept multiple additive and epistatic traits
 * All temporary files are cleaned up

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * Functions that call PLINK must use a `plink_options` parameter

## plinkr v0.8 (2021-5-27)

### NEW FEATURES

 * Add tri- and quadallelic traits
 * Add epistatic trait

### MINOR IMPROVEMENTS

 * PLINK warnings are detected and put into R warning

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.7 (2021-05-27)

### NEW FEATURES

 * None

### MINOR IMPROVEMENTS

 * Improved interface of ´create_demo_assoc_qt_params´

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.6 (2021-05-26)

### NEW FEATURES

 * First version of ´create_demo_assoc_qt_params´ to nicely demonstrate
   a quantitative trait analysis

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr v0.5 (2021-05-26)

### NEW FEATURES

 * `run_plink` is stable
 * Ready for users

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

