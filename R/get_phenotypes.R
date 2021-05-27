#' Get the phenotypes that are named after their genetic background
#' @return all the phenotypes that are named after their genetic background
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @author Richèl J.C. Bilderbeek
#' @export
get_phenotypes <- function() {
  c(
    "random",
    "additive",
    "epistatic"
  )
}
