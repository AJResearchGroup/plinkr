#' Let \code{PLINK}/\code{PLINK2}
#' calculate the missing rates summary statistic.
#'
#' Let \code{PLINK}/\code{PLINK2}
#' calculate the missing rates summary statistic
#' from PLINK1 binary filenames
#' @note This function is named after the \code{--missing} flag
#' used by \code{PLINK}
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'  * \code{imiss_table} table with the missing genotype data per individual
#'  * \code{lmiss_table} table with the missing genotype data per SNP
#'  * \code{log} the log text
#' @author Richèl J.C. Bilderbeek
#' @export
missing_from_bfile <- function(
  bfile,
  out
) {
  base_binary_filenames <- bfile
  base_miss_stat_filenames <- out
  plinkr::run_plink(
    args = c(
      "--bfile", base_binary_filenames,
      "--missing",
      "--out", base_miss_stat_filenames
    ),
    plink_options = create_plink_v1_7_options()
  )
  miss_stat_filenames <- list.files(
    dirname(base_miss_stat_filenames),
    pattern = basename(base_miss_stat_filenames),
    full.names = TRUE
  )
  base_imiss_filename <- paste0(basename(base_miss_stat_filenames), ".imiss")
  base_lmiss_filename <- paste0(basename(base_miss_stat_filenames), ".lmiss")
  base_log_filename <- paste0(basename(base_miss_stat_filenames), ".log")
  imiss_filename <- stringr::str_subset(
    miss_stat_filenames,
    paste0(base_imiss_filename, "$")
  )
  lmiss_filename <- stringr::str_subset(
    miss_stat_filenames,
    paste0(base_lmiss_filename, "$")
  )
  log_filename <- stringr::str_subset(
    miss_stat_filenames,
    paste0(base_log_filename, "$")
  )
  testthat::expect_true(file.exists(imiss_filename))
  testthat::expect_true(file.exists(lmiss_filename))
  testthat::expect_true(file.exists(log_filename))
  missing_result <- list(
    imiss_table = plinkr::read_plink_imiss_file(imiss_filename),
    lmiss_table = plinkr::read_plink_lmiss_file(lmiss_filename),
    log = plinkr::read_plink_log_file(log_filename)
  )
  file.remove(miss_stat_filenames)
  missing_result


}
