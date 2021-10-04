#' Read a `PLINK2` `.psam` file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
 read_plink2_psam_file <- function(
  psam_filename
) {
   testthat::expect_true(file.exists(psam_filename))
   df <- data.table::fread(psam_filename, data.table = FALSE)
   names(df) <- c("FID", names(df)[-1])
   psam_table <- tibble::as_tibble(df)

   psam_table$FID <- as.character(psam_table$FID) # nolint PLINK2 notation
   psam_table$IID <- as.character(psam_table$IID) # nolint PLINK2 notation
   psam_table
}
