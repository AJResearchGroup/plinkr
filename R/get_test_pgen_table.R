#' Get a simple `.pgen` table
#'
#' Get a simple `.pgen` table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the plinkr example file called
#' `toy_v1_9_after_make-bed_after_make-pgen.pgen`.
#' @return a `.pgen` table
#' @note The function has the word `get` in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word `create` is used.
#' @examples
#' get_test_pgen_table()
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_pgen_table <- function() {
  plinkr::read_plink2_pgen_file_from_files(
    pgen_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pgen"
    ),
    psam_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    ),
    pvar_filename = plinkr::get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
}
