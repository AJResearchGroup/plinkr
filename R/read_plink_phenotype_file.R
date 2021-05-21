#' Read a PLINK raw phenotype file
#' @inheritParams default_params_doc
#' @return a tibble
#' @examples
#' read_plink_phenotype_file(
#'   phenotype_filename = get_plinkr_filename("pheno.raw")
#' )
#' @export
read_plink_phenotype_file <- function(phenotype_filename) {
  testthat::expect_true(file.exists(phenotype_filename))
  text_lines <- readr::read_lines(phenotype_filename)

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <-  tibble::as_tibble(
    text_matrix[-1, ],
    .name_repair = "minimal"
  )
  testthat::expect_equal(3, ncol(t))
  names(t) <- c("family_id", "individual_id", "phenotype")
  # Converting the full text_matrix to numeric may be better...
  t$family_id <- as.numeric(t$family_id)
  t$individual_id <- as.numeric(t$individual_id)
  t$phenotype <- as.numeric(t$phenotype)
  t
}
