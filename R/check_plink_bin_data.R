#' Check if the `PLINK` bin data is valid.
#'
#' Check if the `PLINK` bin data is valid.
#' Will \link{stop} if not.
#'
#' Valid `PLINK` binary data has the following properties:
#'  * The `bed_table` must be valid, as checked by \link{check_bed_table}
#'  * The `bim_table` must be valid, as checked by \link{check_bim_table}
#'  * The `fam_table` must be valid, as checked by \link{check_fam_table}
#'  * The number of SNVs must match,
#'    as checked by \link{check_equal_number_of_snvs}
#'  * The column names of the `bed_table` must match the `id`s in the
#'    `fam_table`
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

  testthat::expect_true("id" %in% names(plink_bin_data$fam_table))
  fam_table_ids <- stringr::str_trim(plink_bin_data$fam_table$id)
  bed_table_colnames <- stringr::str_trim(colnames(plink_bin_data$bed_table))

  if (!all(fam_table_ids == bed_table_colnames)) {
    stop(
      "Mismatch between the 'id' column in the .fam table ",
        "and the column names in the .bed table \n",
      "'id' column values in the .fam table: ",
        paste0(fam_table_ids, collapse = ", "),
      " \n",
      "column names in .bed table): ",
      paste0(bed_table_colnames, collapse = ", "),
      " \n"
    )
  }
  invisible(plink_bin_data)
}
