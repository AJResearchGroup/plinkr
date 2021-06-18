# News

Newest versions at top.

## plinkr 0.14 (unreleased)

### NEW FEATURES

 * Add vignette with PLINK tutorial
 * Add `install_plink_tutorial_data` and `uninstall_plink_tutorial_data`
   to install and uninstall the PLINK tutorial data
 * Add `read_plink_lmiss_file` to read PLINK `.lmiss` files

### MINOR IMPROVEMENTS

 * Use `--noweb` flag only in PLINK versions that support it

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.13 (2021-06-17)

### NEW FEATURES

 * Phenotype files can have phenotype names

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.12 (2021-06-16)

### NEW FEATURES

 * Can read `.bed`, `.bim` and `.fam` files
 * Check that maximally 95 chromosomes are used, as this is a (default)
   PLINK limit, see https://www.cog-genomics.org/plink/1.9/input#chr_set
 * Handle multiple phenotypes using in the PLINK way, using `--all-pheno`
 * Add `save_qassoc_table_to_file` to save the results of a quantitive
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

## plinkr 0.11 (2021-06-09)

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

## plinkr 0.10 (2021-06-02)

### NEW FEATURES

 * `install_plinks` also installs PLINK2

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.9 (2021-05-31)

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

## plinkr 0.8 (2021-5-27)

### NEW FEATURES

 * Add tri- and quadallelic traits
 * Add epistatic trait

### MINOR IMPROVEMENTS

 * PLINK warnings are detected and put into R warning

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.7 (2021-05-27)

### NEW FEATURES

 * None

### MINOR IMPROVEMENTS

 * Improved interface of ´create_demo_assoc_qt_params´

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.6 (2021-05-26)

### NEW FEATURES

 * First version of ´create_demo_assoc_qt_params´ to nicely demonstrate
   a quantitative trait analysis

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

## plinkr 0.5 (2021-05-26)

### NEW FEATURES

 * `run_plink` is stable
 * Ready for users

### MINOR IMPROVEMENTS

 * None

### BUG FIXES

 * None

### DEPRECATED AND DEFUNCT

 * None

