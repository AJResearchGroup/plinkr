#' Read a \code{PLINK}/\code{PLINK2} \code{.bim} file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_bim_file <- function(
  bim_filename,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(bim_filename))
  suppressWarnings(
    bim_table <- genio::read_bim(bim_filename, verbose = verbose)
  )
  bim_table
}
