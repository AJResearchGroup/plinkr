#' Internal function, called by \link{check_assoc_qt_params}
#'
#' Check if the \code{assoc_qt_params} has the same number of
#' SNVs in the genetic mapping and the pedigree table.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @export
check_equal_number_of_snvs <- function(
  assoc_qt_params
) {
  # Call check_assoc_qt_params would result in recursion
  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("ped_table" %in% names(assoc_qt_params))
  testthat::expect_true("map_table" %in% names(assoc_qt_params))
  testthat::expect_silent(plinkr::check_ped_table(assoc_qt_params$ped_table))
  testthat::expect_silent(plinkr::check_map_table(assoc_qt_params$map_table))

  n_snvs_in_ped_table <- (ncol(assoc_qt_params$ped_table) - 6) / 2
  n_snvs_in_map_table <- nrow(assoc_qt_params$map_table)
  if (n_snvs_in_ped_table != n_snvs_in_map_table) {
    stop(
      "Different number of SNVs in the genetic mapping (.map) table \n",
      "and the pedigree (.tab) table \n",
      "Number of SNVs in genetic mapping (.map) table: ",
        n_snvs_in_map_table, " \n",
      "Number of SNVs in pedigree (.ped) table: ", n_snvs_in_ped_table
    )
  }

}
