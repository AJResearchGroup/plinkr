#' Check if the `PLINK2` bin data is valid.
#'
#' Check if the `PLINK2` bin data is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso `plinkr` has the following functions to check if in-memory `data`
#' is valid:
#'
#'  * `PLINK` text data: use \link{check_plink_text_data}
#'  * `PLINK` binary data: use \link{check_plink_bin_data}
#'  * `PLINK2` binary data: use \link{check_plink2_bin_data}
#'  * any `PLINK`/`PLINK2` data: use \link{check_data}
#'  * quantitative trait analysis data: use \link{check_assoc_qt_data}
#'
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink2_bin_data <- function(
  plink2_bin_data
) {
  if (!is.list(plink2_bin_data)) {
    stop(
      "'plink2_bin_data' must be a list  \n",
      "Actual class: ", class(plink2_bin_data), " \n",
      "Tip: use 'plinkr::create_plink2_bin_data()'\n"
    )
  }
  testthat::expect_true("pgen_table" %in% names(plink2_bin_data))
  testthat::expect_true("psam_table" %in% names(plink2_bin_data))
  testthat::expect_true("pvar_table" %in% names(plink2_bin_data))

  plinkr::check_pgen_table(plink2_bin_data$pgen_table)
  plinkr::check_psam_table(plink2_bin_data$psam_table)
  plinkr::check_pvar_table(plink2_bin_data$pvar_table)
  plinkr::check_equal_number_of_snvs(plink2_bin_data)

  testthat::expect_true("IID" %in% names(plink2_bin_data$psam_table))
  psam_table_iids <- stringr::str_trim(plink2_bin_data$psam_table$IID)
  pgen_table_rownames <- stringr::str_trim(rownames(plink2_bin_data$pgen_table))

  if (!all(psam_table_iids == pgen_table_rownames)) {
    stop(
      "Mismatch between the 'IID' column in the .psam table ",
      "and the rownames in the .pgen table \n",
      "'IID' column values in the .psam table: ",
      paste0(psam_table_iids, collapse = ", "),
      " \n",
      "rownames in the .pgen table: ",
      paste0(pgen_table_rownames, collapse = ", "),
      " \n"
    )
  }


  invisible(plink2_bin_data)
}
