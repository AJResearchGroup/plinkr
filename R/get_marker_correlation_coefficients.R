#' Get the marker correlation coefficients (also known as `r`)
#' from genetic data.
#'
#' Similar to PLINK, the correlation coefficients are measured
#' for markers on the same chromosome
#' @inheritParams default_params_doc
#' @return the marker correlation coefficients,
#' which will be in range `[ld_window_r2, 1.0]`
#' and `[-1.0, -ld_window_r2]`
#' @seealso use \link{get_marker_correlation_coefficients_table} to
#' see the marker correlation coefficients between markers in a table
#' @examples
#' if (is_plink_installed()) {
#'   # Create example PLINK text data
#'   assoc_qt_data <- create_demo_assoc_qt_data()
#'   # PLINK checks for LD on markers on the same chromosome
#'   assoc_qt_data$data$map_table$CHR <- 1
#'
#'   # PLINK uses a default value of ld_window_r2 = 0.2,
#'   # which, in this examples, does not give a result
#'   get_marker_correlation_coefficients(
#'     assoc_qt_data$data
#'   )
#'
#'   # Show all values
#'   get_marker_correlation_coefficients(
#'     assoc_qt_data$data,
#'     ld_window_r2 = 0.0
#'   )
#'
#'   # PLINK binary data
#'   assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
#'     assoc_qt_data$data
#'   )
#'   get_marker_correlation_coefficients(
#'     assoc_qt_data$data,
#'     ld_window_r2 = 0.0
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_marker_correlation_coefficients <- function( # nolint indeed a long function name
  data,
  ld_window_r2 = 0.2,
  plink_options = create_plink_options(),
  temp_folder = plinkr::get_plinkr_tempfilename(),
  verbose = FALSE
) {
  ld_table <- get_marker_correlation_coefficients_table(
    data = data,
    ld_window_r2 = ld_window_r2,
    plink_options = plink_options,
    temp_folder = temp_folder,
    verbose = verbose
  )
  ld_table$R
}
