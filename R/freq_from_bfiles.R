#' Let \code{PLINK}/\code{PLINK2}
#' calculate the allele frequencies.
#'
#' Let \code{PLINK}/\code{PLINK2}
#' calculate the allele frequencies
#' from PLINK1 binary filenames
#' @note This function is named after the \code{--freq} flag
#' used by \code{PLINK}
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'  * \code{frq_table} table with ?
#'  * \code{log} the log text
#' @author Richèl J.C. Bilderbeek
#' @export
freq_from_bfile <- function(
  bfile,
  out
) {
  base_binary_filenames <- bfile
  base_freq_stat_filenames <- out
  plinkr::run_plink(
    args = c(
      "--bfile", base_binary_filenames,
      "--freq",
      "--out", base_freq_stat_filenames
    )
  )
  freq_stat_filenames <- list.files(
    dirname(base_freq_stat_filenames),
    pattern = basename(base_freq_stat_filenames),
    full.names = TRUE
  )
  base_frq_filename <- paste0(basename(base_freq_stat_filenames), ".frq")
  base_log_filename <- paste0(basename(base_freq_stat_filenames), ".log")
  frq_filename <- stringr::str_subset(
    freq_stat_filenames,
    paste0(base_frq_filename, "$")
  )
  log_filename <- stringr::str_subset(
    freq_stat_filenames,
    paste0(base_log_filename, "$")
  )
  testthat::expect_true(file.exists(frq_filename))
  testthat::expect_true(file.exists(log_filename))
  freq_stat_result <- list(
    frq_table = plinkr::read_plink_frq_file(frq_filename),
    log = plinkr::read_plink_log_file(log_filename)
  )
  file.remove(freq_stat_filenames)
  freq_stat_result
}
