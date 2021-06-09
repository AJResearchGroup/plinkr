#' Convert to binary files
#' @note this function is named after the PLINK \code{--make-bed}
#' parameter flag
#' @inheritParams default_params_doc
#' @return The full names of the created files
#' @author Richèl J.C. Bilderbeek
#' @export
make_bed <- function(
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  args <- c(
    "--file", base_input_filename,
    "--make-bed",
    "--out", base_output_filename
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  list.files(
    path = dirname(base_output_filename),
    pattern = tools::file_path_sans_ext(basename(base_output_filename)),
    full.names = TRUE
  )

}
