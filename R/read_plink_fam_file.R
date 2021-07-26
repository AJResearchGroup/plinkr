#' Read a \code{PLINK}/\code{PLINK2} \code{.fam} file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_fam_file <- function(
  fam_filename,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(fam_filename))
  suppressWarnings(
    fam_table <- genio::read_fam(fam_filename, verbose = verbose)
  )
  fam_table
}
