#' Read a `PLINK2` `.psam` file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
 read_plink2_psam_file <- function(
  psam_filename
) {
   testthat::expect_true(file.exists(psam_filename))
   df <- data.table::fread(psam_filename)
   names(df) <- c("FID", names(df)[-1])
   psam_table <- tibble::tibble(df)
   psam_table
}
