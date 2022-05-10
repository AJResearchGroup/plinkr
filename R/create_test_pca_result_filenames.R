#' Create a `pca_result_filenames` to be used in testing.
#'
#' Create a `pca_result_filenames` to be used in testing.
#' @return a list with filenames
#' @seealso Use \link{pca} to do a principal component analysis.
#' @examples
#' create_test_pca_result_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_pca_result_filenames <- function( # nolint indeed a long function name
) {
  list(
    bed_filename = plinkr::get_plinkr_filename("pca.bed"),
    bim_filename = plinkr::get_plinkr_filename("pca.bim"),
    eigenval_filename = plinkr::get_plinkr_filename("pca.eigenval"),
    eigenvec_filename = plinkr::get_plinkr_filename("pca.eigenvec"),
    fam_filename = plinkr::get_plinkr_filename("pca.fam"),
    log_filename = plinkr::get_plinkr_filename("pca.log")
  )
}
