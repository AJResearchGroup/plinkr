#' Create a demo phenotype table
#' @inheritParams default_params_doc
#' @export
create_demo_phenotype_table <- function(
  ped_table = create_demo_ped_table(),
  phenotypes = get_phenotypes()
) {
  plinkr::check_ped_table(ped_table)
  plinkr::check_phenotypes(phenotypes)
  phenotype_table <- ped_table[, 1:2]
  for (phenotype in phenotypes) {
    if (phenotype == "random") {
      phenotype_table$random <- stats::runif(nrow(phenotype_table))
    } else {
      testthat::expect_equal(phenotype, "additive")
      stop("TODO")
    }
  }
  phenotype_table
}
