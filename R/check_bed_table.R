#' Check if a \code{.bed} table is valid.
#'
#' Check if a \code{.bed} table is valid.
#' Will \link{stop} if not
#'
#' The `class` of a `bed_table` must be:
#'  * `matrix`: on older versions of R, probably before v4.0
#'  * c(`matrix`, `array`): on newer versions of R, probably from v4.0
#'
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{bed_table} is invalid
#' @examples
#' # Simple .bed table
#' check_bed_table(get_test_bed_table())
#'
#' # Read a .bed table from file, one needs a .bim and .fam for that as well
#' bim_table <- read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
#' fam_table <- read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
#' bed_table <- read_plink_bed_file(
#'   bed_filename = get_plinkr_filename("toy_data.bed"),
#'   names_loci = bim_table$id,
#'   names_ind = fam_table$id
#' )
#' check_bed_table(bed_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_bed_table <- function(bed_table) {
  is_matrix_class <- class(bed_table) == "matrix"
  is_matrix_array_class <- class(bed_table) == c("matrix", "array")
  if (!is_matrix_class && !is_matrix_array_class) {
    stop(
      "'bed_table' does not have class types 'c(\"matrix\", \"array\")', ",
        "nor '\"matrix\"' \n",
      "'class(bed_table)': ", class(bed_table)
    )
  }
  testthat::expect_true("matrix" %in% class(bed_table))
  testthat::expect_true(all(is.na(bed_table) | bed_table >= 0))
  testthat::expect_true(all(is.na(bed_table) | bed_table <= 4))
}
