# Check that the versions match of:
#
# * DESCRIPTION
# * Singulatity
# * scripts/upload_singularity_container.sh
#
# Usage:
#
#   Rscript check_versions_match.R

testthat::expect_true(stringr::str_detect(getwd(), "/plinkr$"))
testthat::expect_true(file.exists("DESCRIPTION"))
testthat::expect_true(file.exists("Singularity"))
testthat::expect_true(file.exists("scripts/upload_singularity_container.sh"))

description_version <- stringr::str_match(
  stringr::str_subset(readr::read_lines("DESCRIPTION"), "Version: .*"),
  "Version: (.*)"
)[1, 2]
message("version found in DESCRIPTION: ", description_version)

singularity_version <- stringr::str_match(
  stringr::str_subset(readr::read_lines("Singularity"), "VERSION .*"),
  ".*VERSION (.*)"
)[1, 2]
message("version found in Singularity: ", singularity_version)

upload_version <- stringr::str_match(
  stringr::str_subset(readr::read_lines("scripts/upload_singularity_container.sh"), "singularity push"),
  ".*richelbilderbeek.*:(.*)"
)[1, 2]
message("version found for pushing to Singularity: ", upload_version)

testthat::expect_equal(description_version, singularity_version)
testthat::expect_equal(description_version, upload_version)
