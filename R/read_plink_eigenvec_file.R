#' Read a `PLINK`/`PLINK2` `.eigenvec` file
#'
#' Read a `PLINK`/`PLINK2` `.eigenvec` file.
#'
#' By default, \link{pca} (the function to do principal
#' component analysis) uses 20 eigenvecues
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'   * `fam`: the family ID, also know as `FID`
#'   * `id`: the within-family ID, also know as `IID`
#'   * `pc_[x]`: the `[x]`th principle component
#' @seealso use \link{get_test_eigenvec_table} to get an
#' eigenvecue table, to be used in testing
#' @examples
#' read_plink_eigenvec_file(
#'   eigenvec_filename = get_plinkr_filename("pca.eigenvec")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_eigenvec_file <- function(
  eigenvec_filename
) {
  testthat::expect_true(file.exists(eigenvec_filename))
  text_lines <- readr::read_lines(eigenvec_filename)
  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  float_matrix <- text_matrix[, c(-1, -2)]
  mode(float_matrix) <- "numeric"
  t_fid_and_iid <- tibble::as_tibble(
    text_matrix[, c(1, 2)],
    .name_repair = "minimal"
  )
  names(t_fid_and_iid) <- c("fam", "id")
  t_pcas <- tibble::as_tibble(
    float_matrix,
    .name_repair = "minimal"
  )
  names(t_pcas) <- paste0("pc_", seq(1, ncol(t_pcas)))
  t <- dplyr::bind_cols(t_fid_and_iid, t_pcas)
  testthat::expect_true(ncol(t) >= 2)
  t
}
