#' Create the command-line arguments to convert PLINK binary
#' files to PLINK text files
#'
#' @note the first argument is the first argument, not the path to
#' the `PLINK` or `PLINK2` binary
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @examples
#' create_convert_plink_bin_files_to_plink_text_files_args(
#'   base_input_filename = "base_input_filename",
#'   base_output_filename = "base_output_filename"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_convert_plink_bin_files_to_plink_text_files_args <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_v1_9_options()
) {
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(
    base_output_filename = base_output_filename
  )
  plinkr::check_plink_options(plink_options)
  # From https://www.cog-genomics.org/plink/1.9/data#recode
  # plink --bfile binary_fileset --recode --out new_text_fileset
  args <- c(
    "--bfile", base_input_filename,
    "--recode",
    "--out",
    base_output_filename
  )
  args
}
