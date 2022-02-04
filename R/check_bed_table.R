#' Check if a \code{.bed} table is valid.
#'
#' Check if a \code{.bed} table is valid.
#' Will \link{stop} if not
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
  if (!"array" %in% class(bed_table) || !"matrix" %in% class(bed_table)) {
    stop(
      "'bed_table' does not have class type 'c(\"matrix\", \"array\")'. \n",
      "'class(bed_table)': ", class(bed_table)
    )
  }
  testthat::expect_true("matrix" %in% class(bed_table))
  testthat::expect_true(all(is.na(bed_table) | bed_table >= 0))
  testthat::expect_true(all(is.na(bed_table) | bed_table <= 4))
}
