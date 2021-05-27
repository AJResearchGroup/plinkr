#' Determine if the input is one trait
#'
#' Determine if the input is one trait.
#' Not a list of one trait.
#' Not a list of two traits.
#' One trait exactly.
#' @inheritParams default_params_doc
#' @examples
#' # Yes, this is one trait
#' is_one_trait(create_additive_trait())
#' is_one_trait(create_random_trait())
#'
#' # No, these are not one trait
#' is_one_trait(list(create_demo_traits()))
#' is_one_trait(create_demo_traits())
#' is_one_trait("nonsense")
#' is_one_trait("")
#' is_one_trait(3.14)
#' is_one_trait(42)
#' is_one_trait(NA)
#' is_one_trait(NULL)
#' is_one_trait(Inf)
#' is_one_trait(c())
#' @export
#' @author Richèl J.C. Bilderbeek
is_one_trait <- function(trait) {
  is_valid <- FALSE
  try({
      plinkr::check_trait(trait)
      is_valid <- TRUE
    }, silent = TRUE
  )
  if (!is_valid) return(FALSE)
  # Detect if 'c(t, t)' is used
  length(names(trait)) == length(unique(names(trait)))
}
