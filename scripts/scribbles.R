
xor_phenotype <- function(snvs) {
  if (ncol(snvs) < 4) return(rep(1, nrow(snvs)))
  testthat::expect_true("snv_1a" %in% names(snvs))
  testthat::expect_true("snv_1b" %in% names(snvs))
  testthat::expect_true("snv_2a" %in% names(snvs))
  testthat::expect_true("snv_2b" %in% names(snvs))
  homozygous_a_locus_1 <- snvs$snv_1a == "A" & snvs$snv_1b == "A"
  homozygous_t_locus_1 <- snvs$snv_1a == "C" & snvs$snv_1b == "C"
  homozygous_a_locus_2 <- snvs$snv_2a == "A" & snvs$snv_2b == "A"
  homozygous_t_locus_2 <- snvs$snv_2a == "C" & snvs$snv_2b == "C"
  xor_1 <- homozygous_a_locus_1 & homozygous_t_locus_2
  xor_2 <- homozygous_t_locus_1 & homozygous_a_locus_2
  xors <- xor_1 | xor_2
  1 + as.numeric(xors)
}

snvs <- create_snvs(n_snps = 2, n_individuals = 16)
snvs$phenotype <- xor_phenotype(snvs)
snvs

simple_phenotype <- function(snvs) {
  if (ncol(snvs) < 2) return(rep(1, nrow(snvs)))
  testthat::expect_true("snv_1a" %in% names(snvs))
  testthat::expect_true("snv_1b" %in% names(snvs))
  homozygous_a_locus_1 <- snvs$snv_1a == "A" & snvs$snv_1b == "A"
  1 + homozygous_a_locus_1
}


snvs <- create_snvs(n_snps = 1, n_individuals = 4)
snvs$phenotype <- simple_phenotype(snvs)
snvs

snvs <- create_snvs(n_snps = 2, n_individuals = 16)
snvs$phenotype <- simple_phenotype(snvs)
snvs

xor_case_control_trait <- create_custom_trait(
  mafs = 0.49,
  n_snps = 2,
  calc_phenotype_function = xor_phenotype
)
simple_case_control_trait <- create_custom_trait(
  mafs = 0.49,
  n_snps = 2,
  calc_phenotype_function = simple_phenotype
)

n_individuals <- 10000
assoc_params_xor_case_control_trait <- create_demo_assoc_params(
  trait = xor_case_control_trait,
  n_individuals = n_individuals
)
assoc_params_simple_case_control_trait <- create_demo_assoc_params(
  trait = simple_case_control_trait,
  n_individuals = n_individuals
)
assoc_params_random_case_control_trait <- create_demo_assoc_params(
  trait = create_random_case_control_trait(
    mafs = 0.49,
    n_snps = 2
  ),
  n_individuals = n_individuals
)
assoc_params_epistatic_case_control_trait <- create_demo_assoc_params(
  trait = create_epistatic_trait(
    mafs = 0.49,
    n_snps = 2,
    regular_phenotype_value = 1,
    epistatic_phenotype_value = 2
  ),
  n_individuals = n_individuals
)
assoc(assoc_params_xor_case_control_trait)
assoc(assoc_params_simple_case_control_trait)
assoc(assoc_params_random_case_control_trait)
assoc(assoc_params_epistatic_case_control_trait)


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
