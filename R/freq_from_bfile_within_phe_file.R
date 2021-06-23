#' Let \code{PLINK}/\code{PLINK2}
#' calculate the allele frequencies
#' per phenotype.
#'
#' Let \code{PLINK}/\code{PLINK2}
#' calculate the allele frequencies
#' per phenotype, from PLINK1 binary filenames
#' @note This function is named after the \code{--freq} flag
#' used by \code{PLINK}
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'  * \code{frq_table} table with ?
#'  * \code{log} the log text
#' @author Richèl J.C. Bilderbeek
#' @export
freq_from_bfile_within_phe_file <- function( # nolint indeed a long function name
  bfile,
  phe_filename,
  out
) {
  base_binary_filenames <- bfile
  base_freq_stat_filenames <- out
  plinkr::run_plink(
    args = c(
      "--bfile", base_binary_filenames,
      "--freq",
      "--within", phe_filename,
      "--out", base_freq_stat_filenames
    )
  )
  freq_stat_filenames <- list.files(
    dirname(base_freq_stat_filenames),
    pattern = basename(base_freq_stat_filenames),
    full.names = TRUE
  )
  base_frq_filename <- paste0(basename(base_freq_stat_filenames), ".frq.strat")
  base_log_filename <- paste0(basename(base_freq_stat_filenames), ".log")
  frq_strat_filename <- stringr::str_subset(
    freq_stat_filenames,
    paste0(base_frq_filename, "$")
  )
  log_filename <- stringr::str_subset(
    freq_stat_filenames,
    paste0(base_log_filename, "$")
  )
  testthat::expect_true(file.exists(frq_strat_filename))
  testthat::expect_true(file.exists(log_filename))
  freq_stat_result <- list(
    frq_strat_table = plinkr::read_plink_frq_strat_file(
      frq_strat_filename = frq_strat_filename
    ),
    log = plinkr::read_plink_log_file(log_filename)
  )
  file.remove(freq_stat_filenames)
  freq_stat_result
}
