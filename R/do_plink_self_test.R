#' Do a minimal PLINK self test
#' @inheritParams default_params_doc
#' @return nothing. Will stop with an error message if the self-test fails
#' @author Richèl J.C. Bilderbeek
#' @export
do_plink_self_test <- function(
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_plink_is_installed(plink_options)
  base_filename <- NA
  if (plink_options$plink_version == "1.7") {
    base_filename <- "test"
  } else {
    testthat::expect_equal(plink_options$plink_version, "1.9")
    base_filename <- "toy"
  }
  ped_filename <- plinkr::get_plink_example_filename(
    example_filename = paste0(base_filename, ".ped"),
    plink_options = plink_options
  )
  map_filename <- plinkr::get_plink_example_filename(
    example_filename = paste0(base_filename, ".map"),
    plink_options = plink_options
  )

  # plink --ped file1.ped --map file1.map --maf 0.05 --assoc
  args <- c(
    "--ped", ped_filename,
    "--map", map_filename,
    "--maf", "0.05",
    "--assoc"
  )
  if (plink_options$plink_version == "1.7" && sum(args == "--noweb") == 0) {
    args <- c(args, "--noweb")
  }
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
}
