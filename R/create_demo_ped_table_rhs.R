#' Internal function
#'
#' Internal function to create the right-hand side
#' of a demo pedigree \code{.ped} table
#' for all traits
#' @inheritParams default_params_doc
#' @examples
#' create_demo_ped_table_rhs()
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_ped_table_rhs <- function(
  traits = create_demo_traits(),
  n_individuals = 4
) {
  plinkr::check_n_individuals(n_individuals)
  plinkr::check_traits(traits)

  # traits must be a list of traits
  if (plinkr::is_one_trait(traits)) traits <- list(traits)
  testthat::expect_false(plinkr::is_one_trait(traits))

  tibbles <- list()
  for (i in seq_along(traits)) {
    tibbles[[i]] <- plinkr::create_demo_ped_table_rhs_trait(
      n_individuals = n_individuals,
      trait = traits[[i]]
    )
  }
  t <- dplyr::bind_cols(tibbles, .name_repair = "minimal")

  if (ncol(t) == 0) return(t)

  new_names <- paste0(
    "snv_",
    rep(seq(from = 1, to = ncol(t) / 2), each = 2),
    rep(c("a", "b"), times = ncol(t) / 2)
  )
  testthat::expect_equal(length(names(t)), length(new_names))
  names(t) <- new_names
  t
}
