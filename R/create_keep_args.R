#' Create the CLI arguments to call `PLINK` with the `--keep` flag
#'
#' Create the CLI arguments to call `PLINK` with the `--keep` flag
#' @inheritParams default_params_doc
#' @return the CLI arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_keep_args <- function(
  bfile,
  sample_ids_filename,
  base_output_filename
) {
  c(
    "--bfile", bfile,
    "--keep", sample_ids_filename,
    "--make-bed",
    "--out", base_output_filename
  )
}
