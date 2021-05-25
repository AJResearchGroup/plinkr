#' Check if a \code{.ped} is valid. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing.
#'   Will \link{stop} if the pedigree table is invalid.
#' @export
check_ped_table <- function(ped_table) {
  if (!tibble::is_tibble(ped_table)) {
    stop(
      "'ped_table' must a tibble. \n",
      "Current class: ", paste(class(ped_table), collapse = " ")
    )
  }
  col_names <- c(
    "family_id",
    "within_family_id",
    "within_family_id_father",
    "within_family_id_mother",
    "sex_code",
    "case_control_code",
    "snv_1a",
    "snv_1b"
  )
  n_col_names <- length(col_names)
  testthat::expect_true(
    all(names(ped_table)[seq(1, n_col_names)] == col_names)
  )
}
