#' Do a minimal PLINK self test
#' @inheritParams default_params_doc
#' @return nothing. Will stop with an error message if the self-test fails
#' @author Richèl J.C. Bilderbeek
#' @export
do_plink_self_test <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder(),
  add_noweb = TRUE
) {
  plinkr::check_plink_is_installed(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  ped_filename <- NA
  map_filename <- NA
  if (plink_version == "1.7") {
    ped_filename <- plinkr::get_plink_example_filename(
      example_filename = "test.ped",
      plink_version = plink_version
    )
    map_filename <- plinkr::get_plink_example_filename(
      example_filename = "test.map",
      plink_version = plink_version
    )
  } else {
    testthat::expect_equal(plink_version, "1.9")
    ped_filename <- plinkr::get_plink_example_filename(
      example_filename = "toy.ped",
      plink_version = plink_version
    )
    map_filename <- plinkr::get_plink_example_filename(
      example_filename = "toy.map",
      plink_version = plink_version
    )
  }
  testthat::expect_false(is.na(ped_filename))
  testthat::expect_false(is.na(map_filename))

  # plink --ped file1.ped --map file1.map --maf 0.05 --assoc
  plinkr::run_plink(
    plink_folder = plink_folder,
    args = c(
      "--ped", ped_filename,
      "--map", map_filename,
      "--maf", "0.05",
      "--assoc"
    ),
    add_noweb = add_noweb
  )
}
