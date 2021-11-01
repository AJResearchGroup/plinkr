#' Let \code{PLINK}/\code{PLINK2}
#' do a binary-trait/case-control association
#'
#' Let \code{PLINK}/\code{PLINK2}
#' do a binary-trait/case-control association
#' from PLINK1 binary filenames
#' @note This function is named after the \code{--assoc} \code{--adjust} flags
#' used by \code{PLINK}
#' @inheritParams default_params_doc
#' @return a \link{list} with the following columns:
#'
#' * \code{assoc_table}: a \link[tibble]{tibble} with associations
#'   found by \code{PLINK}.
#'   See \link{read_plink_assoc_file} for an explanation of the
#'   column names.
#' * \code{assoc_adjusted_table}: a \link[tibble]{tibble} with
#'   adjusted associations found by \code{PLINK}.
#'   See \link{read_plink_assoc_adjusted_file} for an explanation of the
#'   column names.
#' * \code{log}: the log file as text as created by \code{PLINK}
#'
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_adjust_from_bfile <- function(
  bfile,
  out,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  base_binary_filenames <- bfile
  base_assoc_filenames <- out
  args <- c(
    "--bfile", base_binary_filenames,
    "--assoc",
    "--adjust",
    "--out", base_assoc_filenames
  )
  if (plink_options$plink_version == "1.7" && sum(args == "--noweb") == 0) {
    args <- c(args, "--noweb")
  }
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  assoc_filenames <- list.files(
    dirname(base_assoc_filenames),
    pattern = basename(base_assoc_filenames),
    full.names = TRUE
  )
  base_assoc_filename <- paste0(basename(base_assoc_filenames), ".assoc")
  base_assoc_adjusted_filename <- paste0(
    basename(base_assoc_filenames),
    ".assoc.adjusted"
  )
  base_log_filename <- paste0(basename(base_assoc_filenames), ".log")
  assoc_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_assoc_filename, "$")
  )
  assoc_adjusted_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_assoc_adjusted_filename, "$")
  )
  log_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_log_filename, "$")
  )
  testthat::expect_true(file.exists(assoc_filename))
  testthat::expect_true(file.exists(assoc_adjusted_filename))
testthat::expect_true(file.exists(log_filename))
  assoc_result <- list(
    assoc_table = plinkr::read_plink_assoc_file(assoc_filename),
    assoc_adjusted_table = plinkr::read_plink_assoc_adjusted_file(
      assoc_adjusted_filename
    ),
    log = plinkr::read_plink_log_file(log_filename)
  )
  file.remove(assoc_filenames)
  assoc_result
}
