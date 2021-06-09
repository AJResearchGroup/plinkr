# News

Newest versions at top.

## plinkr 0.12 (unreleased)

### NEW FEATURES

 * ?Add vignette with PLINK tutorial

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

