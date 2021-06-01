set.seed(314)
xor_phenotype <- function(snvs) {
  if (ncol(snvs) < 8) return(rep(1, nrow(snvs)))
  testthat::expect_true("snv_2a" %in% names(snvs))
  testthat::expect_true("snv_2b" %in% names(snvs))
  testthat::expect_true("snv_4a" %in% names(snvs))
  testthat::expect_true("snv_4b" %in% names(snvs))
  homozygous_a_locus_1 <- snvs$snv_2a == "A" & snvs$snv_2b == "A"
  homozygous_t_locus_1 <- snvs$snv_2a == "C" & snvs$snv_2b == "C"
  homozygous_a_locus_2 <- snvs$snv_4a == "A" & snvs$snv_4b == "A"
  homozygous_t_locus_2 <- snvs$snv_4a == "C" & snvs$snv_4b == "C"
  xor_1 <- homozygous_a_locus_1 & homozygous_t_locus_2
  xor_2 <- homozygous_t_locus_1 & homozygous_a_locus_2
  xors <- xor_1 | xor_2
  1 + as.numeric(xors)
}
check_calc_phenotype_function(xor_phenotype)

assoc_params <- create_demo_assoc_params(
  trait = create_custom_trait(
    mafs = 0.49,
    n_snps = 10,
    calc_phenotype_function = xor_phenotype
  ),
  n_individuals = 5000
)
testthat::expect_true(sum(assoc_params$ped_table$case_control_code == 1) > 500)
testthat::expect_true(sum(assoc_params$ped_table$case_control_code == 2) > 500)
cases <- which(assoc_params$ped_table$case_control_code == 1)[1:500]
controls <- which(assoc_params$ped_table$case_control_code == 2)[1:500]
assoc_params$ped_table <- assoc_params$ped_table[c(cases, controls), ]
assoc_params$ped_table$family_id <- seq_len(1000)
testthat::expect_equal(500, sum(assoc_params$ped_table$case_control_code == 1))
testthat::expect_true(500, sum(assoc_params$ped_table$case_control_code == 2))
assoc_results <- assoc(assoc_params)


# Hide the case-control values
assoc_params$ped_table$case_control_code <- 0
ped_filename <- "~/mystery.ped"
map_filename <- "~/mystery.map"
plinkr::save_ped_table_to_file(
  ped_table = assoc_params$ped_table,
  ped_filename = ped_filename
)
plinkr::save_map_table_to_file(
  map_table = assoc_params$map_table,
  map_filename = map_filename
)
plinkr::read_plink_log_file("plink.log")
plinkr::read_plink_assoc_file("plink.assoc")
readr::write_csv(assoc_results, file = "~/mystery.assoc")
