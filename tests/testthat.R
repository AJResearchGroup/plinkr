library(testthat)
library(plinkr)

# Tests must not cause undeleted files
clear_plinkr_cache()
check_empty_plinkr_folder()

test_check("plinkr")

if (get_os() == "unix") check_empty_plinkr_folder()
