#' Convert a `PLINK2` `.psam` table to a `PLINK` `.fam` table
#'
#' Convert a `PLINK2` `.psam` table to a `PLINK` `.fam` table
#' @inheritParams default_params_doc
#' @return a `PLINK` `.fam` table
#' @author Richèl J.C. Bilderbeek
#' @export
convert_psam_table_to_fam_table <- function( # nolint indeed a long function name
  psam_table,
  verbose = FALSE
) {
  plinkr::check_psam_table(psam_table)
  # FID IID          SEX PHENO1
  # <int> <chr>      <int>  <int>
  #     1 1000000000     1      1
  #     1 1000000001     1      2
  #
  # to
  #
  # fam   id    pat   mat     sex pheno
  # <chr> <chr> <chr> <chr> <int> <dbl>
  # per0  per0  0     0         2     2
  # per1  per1  0     0         2     1

  # Note that 'psam_table$PHENO1' may be absent [why?],
  # yet 'fam_table$pheno' must exist
  pheno <- 0
  if ("PHENO1" %in% names(psam_table)) {
    pheno <- psam_table$PHENO1 # nolingt PLINK2 variable name
  }
  fam_table <- tibble::tibble(
    fam = as.character(psam_table$FID),
    id = psam_table$IID,
    pat = 0,
    mat = 0,
    sex = psam_table$SEX,
    pheno = pheno
  )
  plinkr::check_fam_table(fam_table)
  fam_table
}
