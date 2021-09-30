#' Internal function
#'
#' Check if the data has the same number of
#' SNVs in its tables.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @examples
#' check_equal_number_of_snvs(create_test_plink_text_data())
#' check_equal_number_of_snvs(create_test_plink_bin_data())
#' check_equal_number_of_snvs(create_test_plink2_bin_data())
#' @author Richèl J.C. Bilderbeek
#' @export
check_equal_number_of_snvs <- function(
  data
) {
  # Do not use 'check_data' as this results in recursion
  # testthat::expect_silent(plinkr::check_data(data)) # nolint indeed, that code :-)


  if ("ped_table" %in% names(data)) {
    testthat::expect_true("map_table" %in% names(data))
    n_snvs_in_ped_table <- (ncol(data$ped_table) - 6) / 2
    n_snvs_in_map_table <- nrow(data$map_table)
    if (n_snvs_in_ped_table != n_snvs_in_map_table) {
      stop(
        "Different number of SNVs in the genetic mapping (.map) table \n",
        "and the pedigree (.tab) table \n",
        "Number of SNVs in genetic mapping (.map) table: ",
        n_snvs_in_map_table, " \n",
        "Number of SNVs in pedigree (.ped) table: ", n_snvs_in_ped_table
      )
    }
  } else if ("bed_table" %in% names(data)) {
    testthat::expect_true("bim_table" %in% names(data))
    n_snvs_in_bed_table <- nrow(data$bed_table)
    n_snvs_in_bim_table <- nrow(data$bim_table)
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
    testthat::expect_true("pgen_table" %in% names(data))
    testthat::expect_true("pvar_table" %in% names(data))
    testthat::expect_true("psam_table" %in% names(data))
    n_snvs_in_pgen_table <- ncol(data$pgen_table)
    n_snvs_in_pvar_table <- nrow(data$pvar_table)
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

  invisible(data)
}
