#' Read a PLINK \code{.ld} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * `CHR_A`	Chromosome code for first variant
#'   * `BP_A`	Base-pair coordinate of first variant
#'   * `SNP_A`	ID of first variant
#'   * (`MAF_A`: Allele 1 frequency for first variant. Requires `with-freqs`)
#'   * `CHR_B`	Chromosome code for second variant
#'   * `BP_B`	Base-pair coordinate of second variant
#'   * `SNP_B`	ID of second variant
#'   * (`PHASE`: In-phase allele pairs. Requires `in-phase`)
#'   * (`MAF_B`	Allele 1 frequency for second variant. Requires `with-freqs`)
#'   * `R` or `R2`: for `R`: the correlation coefficient,
#'     for `R2`, the squared correlation coefficient
#'
#' These column names are the names used by \code{PLINK}, the description is
#' taken from the PLINK 1.9 File format reference at
#' \url{https://www.cog-genomics.org/plink/1.9/formats#ld}
#' @examples
#' if (1 == 2) {
#'   ld_filename <- get_plinkr_filename("miss_stat.ld")
#'   read_plink_ld_file(ld_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_ld_file <- function(ld_filename) {
  table <- stringr::str_split(
    string = stringr::str_trim(
      readr::read_lines(
        file = ld_filename,
        skip_empty_rows = TRUE
      )
    ),
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  if (nrow(table) == 2) {
    t <- tibble::as_tibble_row(table[-1, ], .name_repair = "minimal")
  } else {
    t <- tibble::as_tibble(table[-1, ], .name_repair = "minimal")
  }
  names(t) <- table[1, ]
  expected_names <- c(
    "CHR_A",
    "BP_A",
    "SNP_A",
    "CHR_B",
    "BP_B",
    "SNP_B",
    "R"
  )
  # Last column could also be R2
  testthat::expect_equal(expected_names, names(t))


  t$CHR_A <- as.numeric(t$CHR_A) # nolint use PLINK notation
  t$BP_A <- as.numeric(t$BP_A) # nolint use PLINK notation
  t$SNP_A <- as.character(t$SNP_A) # nolint use PLINK notation
  t$CHR_B <- as.numeric(t$CHR_B) # nolint use PLINK notation
  t$BP_B <- as.numeric(t$BP_B) # nolint use PLINK notation
  t$SNP_B <- as.character(t$SNP_B) # nolint use PLINK notation
  t$R <- as.numeric(t$R) # nolint use PLINK notation
  t
}
