#' Get the marker correlation coefficients (also known as `r`)
#' from genetic data in a table
#'
#' Similar to PLINK, the correlation coefficients are measured
#' for markers on the same chromosome
#' @inheritParams default_params_doc
#' @return an `ld_table`, see \link{read_plink_ld_file}
#' @seealso use \link{get_marker_correlation_coefficients} to
#' only get the marker correlation coefficients
#' @examples
#' if (is_plink_installed()) {
#'   # Create example PLINK text data
#'   assoc_qt_data <- create_demo_assoc_qt_data()
#'   # PLINK checks for LD on markers on the same chromosome
#'   assoc_qt_data$data$map_table$CHR <- 1
#'
#'   # PLINK uses a default value of ld_window_r2 = 0.2,
#'   # which, in this examples, does not give a result
#'   get_marker_correlation_coefficients_table(
#'     assoc_qt_data$data
#'   )
#'
#'   # Show all values
#'   get_marker_correlation_coefficients_table(
#'     assoc_qt_data$data,
#'     ld_window_r2 = 0.0
#'   )
#'
#'   # PLINK binary data
#'   assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
#'     assoc_qt_data$data
#'   )
#'   get_marker_correlation_coefficients_table(
#'     assoc_qt_data$data,
#'     ld_window_r2 = 0.0
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_marker_correlation_coefficients_table <- function( # nolint indeed a long function name
  data,
  ld_window_r2 = 0.2,
  plink_options = create_plink_options(),
  temp_folder = plinkr::get_plinkr_tempfilename(),
  verbose = FALSE
) {
  plinkr::check_data(data)
  plinkr::check_ld_window_r2(ld_window_r2)
  if (plinkr::is_plink_text_data(data)) {
    plink_temp_filename <- file.path(
      temp_folder,
      "get_marker_correlation_coefficients"
    )
    plink_text_filenames <- plinkr::save_plink_text_data(
      plink_text_data = data,
      base_input_filename = plink_temp_filename,
      verbose = verbose
    )
    args <- c(
      "--file", plink_temp_filename,
      "--r",
      "--ld-window-r2", ld_window_r2,
      "--out", plink_temp_filename
    )
    plinkr::run_plink(
      args = args,
      plink_options = plink_options,
      verbose = verbose
    )
    file.remove(as.character(unlist(plink_text_filenames)))
    ld_filename <- paste0(plink_temp_filename, ".ld")
    testthat::expect_true(file.exists(ld_filename))
    ld_table <- plinkr::read_plink_ld_file(ld_filename = ld_filename)
    file.remove(ld_filename)
    return(ld_table)
  }
  if (plinkr::is_plink_bin_data(data)) {
    plink_temp_filename <- file.path(
      temp_folder,
      "get_marker_correlation_coefficients"
    )
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = data,
      base_input_filename = plink_temp_filename,
      verbose = verbose
    )
    args <- c(
      "--bfile", plink_temp_filename,
      "--r",
      "--ld-window-r2", ld_window_r2,
      "--out", plink_temp_filename
    )
    plinkr::run_plink(
      args = args,
      plink_options = plink_options,
      verbose = verbose
    )
    file.remove(as.character(unlist(plink_bin_filenames)))

    ld_filename <- paste0(plink_temp_filename, ".ld")
    testthat::expect_true(file.exists(ld_filename))
    ld_table <- plinkr::read_plink_ld_file(ld_filename = ld_filename)
    file.remove(ld_filename)
    return(ld_table)
  }
  stop("Only implemented PLINK text data and PLINK binary data")
}
