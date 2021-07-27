Bootstrap: docker
From: r-base
# Create all the files needed
#Stage: build_stage

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev r-cran-stringi
    apt-get clean
    Rscript -e 'install.packages(c("remotes", "devtools"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%runscript
    Rscript -e 'plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%test
    Rscript -e 'plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

#Stage: copy_stage

#%files from build_stage
#    ../../.local/share/plinkr $HOME/.local/share/plinkr


