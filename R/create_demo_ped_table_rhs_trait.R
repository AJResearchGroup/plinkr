#' Internal function
#'
#' Internal function to create the right-hand side
#' of a demo pedigree \code{.ped} table
#' for one trait
#' @inheritParams default_params_doc
#' @examples
#' create_demo_ped_table_rhs()
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_ped_table_rhs_trait <- function( # nolint indeed a long function name
  trait = create_random_trait(),
  n_individuals = 4
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_trait(trait)
  testthat::expect_true(plinkr::is_one_trait(trait)) # Unsure

  mafs <- trait$mafs
  major_allele_frequency <- 1.0 - sum(mafs)
  freqs <- c(major_allele_frequency, mafs)
  if (length(freqs) == 2) freqs <- c(freqs, 0.0)
  if (length(freqs) == 3) freqs <- c(freqs, 0.0)
  testthat::expect_equal(length(freqs), 4)
  testthat::expect_equal(sum(freqs), 1.0)
  n_a <- round(n_individuals * freqs[1])
  n_c <- round(n_individuals * freqs[2])
  n_g <- round(n_individuals * freqs[3])
  n_t <- round(n_individuals * freqs[4])

  # Make sure the sum is correct
  n_a <- n_a - (n_a + n_c + n_g + n_t - n_individuals)
  testthat::expect_equal(
    n_a + n_c + n_g + n_t,
    n_individuals
  )
  nsp_calls <- c(
    rep("A", n_a),
    rep("C", n_c),
    rep("G", n_g),
    rep("T", n_t)
  )
  tibble::tibble(
    a = sample(nsp_calls),
    b = sample(nsp_calls)
  )
}
