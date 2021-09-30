#' Check if the `PLINK` bin data is valid.
#'
#' Check if the `PLINK` bin data is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' plink_bin_data <- create_test_plink_bin_data()
#' check_plink_bin_data(plink_bin_data)
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_bin_data <- function(
  plink_bin_data
) {
  if (!is.list(plink_bin_data)) {
    stop(
      "'plink_bin_data' must be a list  \n",
      "Actual class: ", class(plink_bin_data), " \n",
      "Tip: use 'plinkr::create_plink_bin_data()'\n"
    )
  }
  testthat::expect_true("bed_table" %in% names(plink_bin_data))
  testthat::expect_true("bim_table" %in% names(plink_bin_data))
  testthat::expect_true("fam_table" %in% names(plink_bin_data))
  plinkr::check_bed_table(plink_bin_data$bed_table)
  plinkr::check_bim_table(plink_bin_data$bim_table)
  plinkr::check_fam_table(plink_bin_data$fam_table)
  plinkr::check_equal_number_of_snvs(plink_bin_data)
}
