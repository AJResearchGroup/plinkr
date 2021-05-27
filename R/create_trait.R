#' Create a trait with a clear genetic architecture and a known
#' minor allele frequency.
#'
#' Create a trait with a clear genetic architecture and a known
#' minor allele frequency.
#' @inheritParams default_params_doc
#' @examples
#' create_trait(phenotype = "random")
#' create_trait(phenotype = "random", maf = 0.01)
#' @export
#' @author Richèl J.C. Bilderbeek
create_trait <- function(
  phenotype,
  mafs = 0.25
) {
  plinkr::check_phenotypes(phenotype)
  plinkr::check_mafs(mafs)
  list(
    phenotype = phenotype,
    mafs = mafs
  )
}
