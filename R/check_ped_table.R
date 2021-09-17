#' Check if a `.ped` table is valid. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing.
#'   Will \link{stop} if the pedigree table is invalid.
#' @examples
#' check_ped_table(get_test_ped_table())
#' check_ped_table(read_plink_ped_file(get_plinkr_filename("toy_v1_9.ped")))
#' @author Richèl J.C. Bilderbeek
#' @export
check_ped_table <- function(ped_table) {
  if (!tibble::is_tibble(ped_table)) {
    stop(
      "'ped_table' must a tibble. \n",
      "Current class: ", paste(class(ped_table), collapse = " ")
    )
  }
  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  expected_names_lhs <- c(
    "FID",
    "IID",
    "within_family_id_father",
    "within_family_id_mother",
    "sex_code",
    "case_control_code"
  )
  actual_names_lhs <- names(ped_table)[seq(1, 6)]
  testthat::expect_equal(actual_names_lhs, expected_names_lhs)
  n_snvs <- (ncol(ped_table) - 6) / 2
  expected_names_rhs <- paste0(
    "snv_",
    rep(seq(from = 1, to = n_snvs), each = 2),
    rep(c("a", "b"), times = n_snvs)
  )
  actual_names_rhs <- names(ped_table)[-seq(1, 6)]
  testthat::expect_equal(actual_names_rhs, expected_names_rhs)
}
