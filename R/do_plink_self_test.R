#' Do a minimal PLINK self test
#' @inheritParams default_params_doc
#' @return nothing. Will stop with an error message if the self-test fails
#' @export
do_plink_self_test <- function(
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_is_installed(plink_folder = plink_folder)
  # plink --ped file1.ped --map file1.map --maf 0.05 --assoc
  plinkr::run_plink(
    plink_folder = plink_folder,
    args = c(
      "--noweb",
      "--ped", plinkr::get_plink_example_filename("test.ped"),
      "--map", plinkr::get_plink_example_filename("test.map"),
      "--maf", "0.05",
      "--assoc"
    )
  )
}
