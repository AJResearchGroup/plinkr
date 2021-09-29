#' Internal function, called by \link{check_assoc_qt_params}
#'
#' Check if the \code{assoc_qt_params} has the same number of
#' SNVs in the genetic mapping and the pedigree table.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_equal_number_of_snvs <- function(
  assoc_qt_params
) {
  # Call check_assoc_qt_params would result in recursion
  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("data" %in% names(assoc_qt_params))
  testthat::expect_silent(plinkr::check_data(assoc_qt_params$data))

  if (plinkr::is_plink_text_data(assoc_qt_params$data)) {
    n_snvs_in_ped_table <- (ncol(assoc_qt_params$data$ped_table) - 6) / 2
    n_snvs_in_map_table <- nrow(assoc_qt_params$data$map_table)
    if (n_snvs_in_ped_table != n_snvs_in_map_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.map) table \n",
        "and the pedigree (.tab) table \n",
        "Number of SNVs in genetic mapping (.map) table: ",
        n_snvs_in_map_table, " \n",
        "Number of SNVs in pedigree (.ped) table: ", n_snvs_in_ped_table
      )
    }
  } else if (plinkr::is_plink_bin_data(assoc_qt_params$data)) {
    n_snvs_in_bed_table <- nrow(assoc_qt_params$data$bed_table)
    n_snvs_in_bim_table <- nrow(assoc_qt_params$data$bim_table)
    if (n_snvs_in_bed_table != n_snvs_in_bed_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.map) table \n",
        "and the pedigree (.tab) table \n",
        "Number of SNVs in genetic mapping (.bim) table: ",
        n_snvs_in_bim_table, " \n",
        "Number of SNVs in genotype (.bed) table: ", n_snvs_in_bed_table
      )
    }
  } else {
    testthat::expect_true(plinkr::is_plink2_bin_data(assoc_qt_params$data))
    n_snvs_in_pgen_table <- ncol(assoc_qt_params$data$pgen_table)
    n_snvs_in_pvar_table <- nrow(assoc_qt_params$data$pvar_table)
    if (n_snvs_in_pgen_table != n_snvs_in_pvar_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.pvar) table \n",
        "and the individuals' SNP mapping (.pgen) table \n",
        "Number of SNVs in genetic mapping (.pvar) table: ",
        n_snvs_in_pgen_table, " \n",
        "Number of SNVs in genotype (.pgen) table: ",
        n_snvs_in_pvar_table
      )
    }
  }

  invisible(assoc_qt_params)
}
