#' Create a set of \code{assoc_qt} parameters
#' to demonstrate PLINKs \code{--assoc_qt} functionality
#'
#' This function creates:
#'  * Individuals that have all combinations of SNPs exactly once,
#'    as created by the \link{create_demo_ped_table} function
#'  * All SNPs that are on different chromosomes
#'    as created by the \link{create_demo_map_table} function
#'  * Traits that follow different genotype to phenotype mapping:
#'    * `control`: a trait that is random
#'    * `additive`: a trait that is perfectly additive,
#'      each `A` denotes an increase of 0.1,
#'      each `C` denotes an increase of 0.2,
#'      each `G` denotes an increase of 0.3,
#'      each `T` denotes an increase of 0.4
#'
#' @note This function is named after the \code{--assoc-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @export
create_demo_assoc_qt_params <- function(maf = 0.05) {
  ped_table <- plinkr::create_demo_ped_table(n_snps = 1)
  map_table <- plinkr::create_demo_map_table(n_snps = 1)
  phenotype_table <- ped_table[, 1:2]
  phenotype_table$random <- stats::runif(nrow(phenotype_table))

  plinkr::create_assoc_qt_params(
    ped_table = ped_table,
    map_table = map_table,
    phenotype_table = phenotype_table,
    maf = maf
  )
}
