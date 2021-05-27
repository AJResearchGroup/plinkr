#' Create some traits with a clear genetic architecture and a known
#' minor allele frequency for demonstration purposes.
#'
#' Create some traits with a clear genetic architecture and a known
#' minor allele frequency for demonstration purposes.
#' @author Richèl J.C. Bilderbeek
#' @export
create_demo_traits <- function() {
  list(
    plinkr::create_random_trait(),
    plinkr::create_additive_trait(),
    plinkr::create_epistatic_trait()
  )
}
