#' Read a PLINK \code{.ped} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{family_id} The family ID (\code{FID})
#'   * \code{within_family_id} Within-family ID
#'       (\code{IID}, cannot be zero)
#'   * \code{within_family_id_father} Within-family ID of father
#'       (\code{0} if father isn't in dataset)
#'   * \code{within_family_id_mother} Within-family ID of mother
#'       (\code{0} if mother isn't in dataset)
#'   * \code{sex_code} Sex code
#'       (\code{1} = male, \code{2} = female, \code{0} = unknown)
#'   * \code{phenotype_value} Phenotype value
#'       (\code{1} = control, \code{2} = case,
#'       \code{9}/\code{0}/non-numeric = missing data if case/control)
#'   * \code{allele_call_[x][y]} Allele calls for the \code{x}th variant
#'     for haplotype \code{y} (\code{y} is either \code{a} or \code{b})
#'     in the \code{.map file} (\code{0} = no call)
#' @examples
#'  if (is_plink_installed()) {
#'    read_plink_ped_file(
#'      get_plink_example_filename("test.ped")
#'    )
#'  }
#' @export
read_plink_ped_file <- function(ped_filename) {
  table <- stringr::str_split(
    string = readr::read_lines(
      file = ped_filename,
      skip_empty_rows = TRUE
    ),
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <- tibble::as_tibble(table, .name_repair = "minimal")
  testthat::expect_true(ncol(t) >= 6)
  testthat::expect_equal(ncol(t) %% 2, 0)
  n_allele_calls <- (ncol(t) - 6) / 2
  t_str <- tidyr::expand_grid(seq_len(n_allele_calls), c("a", "b"))
  names(t_str) <- c("allele", "variant")
  t_str$text <- paste0(t_str$allele, t_str$variant)

  names <- c(
    "family_id",
    "within_family_id",
    "within_family_id_father",
    "within_family_id_mother",
    "sex_code",
    "phenotype_value",
    paste0("allele_call_", t_str$text)
  )

  names(t) <- names
  t
}
