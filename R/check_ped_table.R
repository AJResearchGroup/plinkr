#' Check if a \code{.ped} is valid. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing.
#'   Will \link{stop} if the pedigree table is invalid.
#' @author Richèl J.C. Bilderbeek
#' @export
check_ped_table <- function(ped_table) {
  if (!tibble::is_tibble(ped_table)) {
    stop(
      "'ped_table' must a tibble. \n",
      "Current class: ", paste(class(ped_table), collapse = " ")
    )
  }

  expected_names_lhs <- c(
    "family_id",
    "within_family_id",
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
