Bootstrap: docker
From: r-base

%runscript
    Rscript -e 'plinkr::plinkr_report()'

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev r-cran-stringi
    apt-get clean
    Rscript -e 'install.packages(c("remotes", "devtools"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks()'

%test
    Rscript -e 'plinkr::plinkr_report()'

