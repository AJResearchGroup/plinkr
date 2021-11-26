#' Convert PLINK binary files to PLINK plain-text files
#' @inheritParams default_params_doc
#' @return the a list with elements:
#'  * `log_filename`: the full path to the created log file
#'  * `map_filename`: the full path to the created `.map` file
#'  * `ped_filename`: the full path to the created `.ped` file
#' @seealso these are the functions to convert between the `PLINK` and
#' `PLINK2` files:
#'
#'  * To convert from PLINK1 text files
#'    * to PLINK1 binary files:
#'      use \link{convert_plink_text_files_to_plink_bin_files}
#'    * to PLINK2 binary files,
#'      use \link{convert_plink_text_files_to_plink2_bin_files}
#'  * To convert from PLINK1 binary files
#'    * to PLINK text files,
#'      use \link{convert_plink_bin_files_to_plink_text_files}
#'    * to PLINK2 binary files,
#'      use \link{convert_plink_bin_files_to_plink2_bin_files}
#'  * To convert from PLINK2 binary files
#'    * to PLINK text files,
#'      use \link{convert_plink2_bin_files_to_plink_text_files}
#'    * to PLINK binary files,
#'      use \link{convert_plink2_bin_files_to_plink_bin_files}
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_files_to_plink_text_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  args <- plinkr::create_convert_plink_bin_files_to_plink_text_files_args(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options
  )
  dir.create(
    dirname(base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  plink_text_filenames <- list.files(
    path = dirname(base_output_filename),
    pattern = tools::file_path_sans_ext(basename(base_output_filename)),
    full.names = TRUE
  )
  log_filename <- stringr::str_subset(plink_bin_filenames, "\\.log$")
  map_filename <- stringr::str_subset(plink_bin_filenames, "\\.map$")
  ped_filename <- stringr::str_subset(plink_bin_filenames, "\\.ped$")
  testthat::expect_equal(1, length(log_filename))
  testthat::expect_equal(1, length(map_filename))
  testthat::expect_equal(1, length(ped_filename))
  list(
    log_filename = log_filename,
    map_filename = map_filename,
    ped_filename = ped_filename
  )
}
