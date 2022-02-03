#' Get the minor allele frequencies from genetic data
#' @inheritParams default_params_doc
#' @return the minor allele frequecies
#' @examples
#' if (is_plink_installed()) {
#'   assoc_qt_data <- create_demo_assoc_qt_data()
#'
#'   # PLINK text data
#'   get_minor_alelle_frequencies(
#'     data = assoc_qt_data$data
#'   )
#'
#'   # PLINK binary data
#'   assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
#'     assoc_qt_data$data
#'   get_minor_alelle_frequencies(
#'     data = assoc_qt_data$data
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_minor_alelle_frequencies <- function(
  data,
  plink_temp_folder = plinkr::get_plinkr_tempfilename(),
  verbose = FALSE
) {
  plinkr::check_data(data)
  if (plinkr::is_plink_text_data(data)) {
    plink_temp_filename <- file.path(
      plink_temp_folder,
      "get_minor_alelle_frequencies"
    )
    plink_text_filenames <- plinkr::save_plink_text_data(
      plink_text_data = data,
      base_input_filename = plink_temp_filename,
      verbose = verbose
    )
    args <- c(
      "--file", plink_temp_filename,
      "--freq",
      "--out", plink_temp_filename
    )
    plinkr::run_plink(args = args, verbose = verbose)
    file.remove(as.character(unlist(plink_text_filenames)))

    frq_filename <- paste0(plink_temp_filename, ".frq")
    testthat::expect_true(file.exists(frq_filename))
    frq_table <- plinkr::read_plink_frq_file(frq_filename = frq_filename)
    file.remove(frq_filename)
    return(frq_table$MAF)
  }
  if (plinkr::is_plink_bin_data(data)) {
    plink_temp_filename <- file.path(
      plink_temp_folder,
      "get_minor_alelle_frequencies"
    )
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = data,
      base_input_filename = plink_temp_filename,
      verbose = verbose
    )
    args <- c(
      "--bfile", plink_temp_filename,
      "--freq",
      "--out", plink_temp_filename
    )
    plinkr::run_plink(args = args, verbose = verbose)
    file.remove(as.character(unlist(plink_bin_filenames)))

    frq_filename <- paste0(plink_temp_filename, ".frq")
    testthat::expect_true(file.exists(frq_filename))
    frq_table <- plinkr::read_plink_frq_file(frq_filename = frq_filename)

    file.remove(frq_filename)
    return(frq_table$MAF)
  }
  stop("Only implemented PLINK text data and PLINK binary data")
}
