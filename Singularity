# The plinkr R package, with the multiple PLINK versions installed
Bootstrap: docker
From: r-base

# The tidyverse R package
# Bootstrap: library
# From: philarevalo/default/rocker-tidyverse-rstan:1.0.0

# The tidyverse R package again
# Sorry Hindrek
# From: hindrek/r/tidyverse:1.0.0

# Worked until problems with stringr
# Bootstrap: docker
# From: r-base

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    # apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev r-cran-stringi libicu-dev
    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev
    apt-get clean
    Rscript -e 'install.packages(c("remotes", "devtools"))'
    # Rscript -e 'install.packages(c("remotes", "devtools", "stringi", "stringr"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'

    # From https://github.com/tidyverse/stringr/issues/320#issuecomment-560991587
    #Rscript -e 'remove.packages("stringi")'
    #Rscript -e 'remove.packages("stringr")'
    #Rscript -e 'install.packages(c("stringi", "stringr"))'

    Rscript -e 'plinkr::install_plinks(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%runscript
echo "'plinkr.sif' running with arguments '$@'"
Rscript "$@"

%test
    Rscript -e 'plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%help

This container has the R package plinkr and multiple versions of PLINK installed.

To make the container run a script called, e.g. `script.R`, do:

```
singularity run plinkr.sif script.R
```

Within the script, set `plink_folder` to `/opt/plinkr`, for example:

```
library(plinkr)

# The options for the multiple versions of PLINK
plink_optionses <- create_plink_optionses(plink_folder = "/opt/plinkr")

# Use PLINK v1.9, i.e. plink_optionses[[2]]
assoc(
  assoc_params = create_demo_assoc_params(),
  plink_options = plink_optionses[[2]]
)
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME plinkr
 
    DESCRIPTION The plinkr R package, with the multiple PLINK versions installed

    USAGE simply run the container

    URL https://github.com/richelbilderbeek/plinkr

    VERSION 0.18.0.4
