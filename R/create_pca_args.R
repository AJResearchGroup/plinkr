#' Create the CLI arguments to call `PLINK` with the `--pca` flag
#'
#' Create the CLI arguments to call `PLINK` with the `--pca` flag
#' @inheritParams default_params_doc
#' @return the CLI arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_pca_args <- function(
  bfile,
  base_output_filename
) {
  c(
    "--bfile", bfile,
    "--pca",
    "--make-bed",
    "--out", base_output_filename
  )
}
