# Random scribbles

assoc_params <- create_demo_assoc_params(
  trait = create_custom_trait(
    n_snps = 1,
    calc_phenotype_function = function(snvs) {
      # Show the input
      message(paste0(knitr::kable(snvs), collapse = "\n"))

      # Return as much 1s as individuals
      rep(1, nrow(snvs))
    }
  ),
  n_individuals = 100
)


assoc_params <- create_demo_assoc_params(
  trait = create_custom_trait(
    n_snps = 4,
    calc_phenotype_function = function(snvs) {
      message(names(snvs))
      testthat::expect_true(tibble::is_tibble(snvs))
      message(paste0(knitr::kable(snvs), collapse = "\n"))
      if (ncol(snvs) < 8) return(rep(1, nrow(snvs)))
      testthat::expect_true("snv_4b" %in% names(snvs))
      rep(2, nrow(snvs))
      value <- 1 + (snvs$snv_4a != snvs$snv_2a & snvs$snv_4b != snvs$snv_2b)
      message(paste0(value, collapse = "\n"))
      value
    }
  ),
  n_individuals = 100
)
assoc_params$ped_table$case_control_code
assoc(assoc_params)


assoc_params <- create_demo_assoc_params(
  trait = create_random_trait(n_snps = 2)
)
assoc(assoc_params)

create_random_trait(n_snps = 2)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    create_epistatic_trait(maf = 0.49),
    create_additive_trait(),
    create_random_trait()
  ),
  n_individuals = 100
)
assoc_qt(assoc_qt_params)
