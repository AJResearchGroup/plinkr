#' Check if a list of traits is valid.
#'
#' Check if a list of traits
#' (each with a clear genetic architecture and a known minor allele frequency)
#' is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @examples
#' check_traits(create_additive_trait())
#' check_traits(create_random_trait())
#' check_traits(list(create_additive_trait(), create_random_trait()))
#' @export
#' @author Richèl J.C. Bilderbeek
check_traits <- function(traits) {
  testthat::expect_true(is.list(traits))
  if (plinkr::is_one_trait(traits)) return()

  for (i in seq_along(traits)) {
    tryCatch(
      expr = plinkr::check_trait(traits[[i]]),
      error = function(e) {
        stop(
          "Error in ", i, "th trait: \n",
          e$message
        )
      }
    )
  }
}
