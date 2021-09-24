#' Read a PLINK \code{.ped} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
#'   * \code{within_family_id_father} Within-family ID of father
#'       (\code{0} if father isn't in dataset)
#'   * \code{within_family_id_mother} Within-family ID of mother
#'       (\code{0} if mother isn't in dataset)
#'   * \code{sex_code} Sex code
#'       (\code{1} = male, \code{2} = female, \code{0} = unknown)
#'   * \code{case_control_code} Case control code
#'       (\code{1} = control, \code{2} = case,
#'       \code{9}/\code{0}/non-numeric = missing data if case/control)
#'   * \code{snv_[x][y]} Nucleotide for the \code{x}th variant
#'     for haplotype \code{y} (\code{y} is either \code{a} or \code{b})
#'     in the \code{.map file} (\code{0} = no call)
#'
#' The columns names \code{FID} (the family ID) and
#' \code{IID} (the within-family ID) is due to following the PLINK
#' naming convention as for the phenotype column names
#' for the same data, as can be read at
#' \url{https://www.cog-genomics.org/plink/1.9/input#pheno}.
#' @examples
#'  if (is_plink_installed(create_plink_v1_7_options())) {
#'    read_plink_ped_file(
#'      get_plink_example_filename(
#'        example_filename = "test.ped",
#'        create_plink_v1_7_options()
#'      )
#'    )
#'  }
#'  if (is_plink_installed(create_plink_v1_9_options())) {
#'    read_plink_ped_file(
#'      get_plink_example_filename(
#'        example_filename = "toy.ped",
#'        create_plink_v1_9_options()
#'      )
#'    )
#'  }
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_ped_file <- function(ped_filename) {
  testthat::expect_true(file.exists(ped_filename))

  # stringi::str_trim **sometimes** gives an 'embedded nul in string' error.
  # This has been reported at https://github.com/gagolews/stringi/issues/458 .
  # Until then, just try multiple times :-)
  table <- NA
  while (length(table) == 1 && is.na(table)) {
    # Use str_trim as PLINK adds whitespace around text

    # FAILS
    # table <- stringr::str_split(
    #   stringi::stri_trim_both( # Workaround at https://github.com/gagolews/stringi/issues/458 # nolint
    #     as.character( # Workaround at https://github.com/gagolews/stringi/issues/458 # nolint
    #       readr::read_lines(
    #         file = ped_filename,
    #         skip_empty_rows = TRUE
    #       )
    #     )
    #   ),
    #   pattern = "[:blank:]+",
    #   simplify = TRUE
    # )

    tryCatch(
      table <- stringr::str_split(
        string = stringr::str_trim(
          readr::read_lines(
            file = ped_filename,
            skip_empty_rows = TRUE
          )
        ),
        pattern = "[:blank:]+",
        simplify = TRUE
      ),
      error = function(e) {} # nolint ignore error
    )
  }
  t <- tibble::as_tibble(table, .name_repair = "minimal")
  testthat::expect_true(ncol(t) >= 6)
  testthat::expect_equal(ncol(t) %% 2, 0)
  n_allele_calls <- (ncol(t) - 6) / 2
  t_str <- tidyr::expand_grid(seq_len(n_allele_calls), c("a", "b"))
  names(t_str) <- c("allele", "variant")
  t_str$text <- paste0(t_str$allele, t_str$variant)

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  names <- c(
    "FID",
    "IID",
    "within_family_id_father",
    "within_family_id_mother",
    "sex_code",
    "case_control_code",
    paste0("snv_", t_str$text)
  )
  names(t) <- names

  suppressWarnings(t$FID <- as.numeric(t$FID)) # nolint can be NA, use PLINK notation
  t$IID <- as.numeric(t$IID) # nolint use PLINK notation
  t$within_family_id_father <- as.numeric(t$within_family_id_father)
  t$within_family_id_mother <- as.numeric(t$within_family_id_mother)
  t$sex_code <- as.numeric(t$sex_code)
  t$case_control_code <- as.numeric(t$case_control_code)

  t
}
