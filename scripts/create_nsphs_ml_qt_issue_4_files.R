# https://github.com/richelbilderbeek/nsphs_ml_qt/issues/4
#
# * Must have SNPs with MAF < 1%, to test if PLINK filters these away
# * Must have SNPs in LD > 0.2 to test if PLINK filters these away
# * Output must be in PLINK binary format
#
# There will be (for 500 individuals:
# * 9 SNP with MAF < 1%
# *
#
#
#
base_input_filename <- "~/GitHubs/nsphs_ml_qt/inst/extdata/nsphs_ml_qt_issue_4_bin"
base_input_filename <- "~/nsphs_ml_qt_issue_4_bin"
phe_filename <- paste0(base_input_filename, ".phe")

set.seed(42)
n_individuals <- 500 # To detect a MAF < 0.01
n_snps <- 500
n_traits <- n_snps # 1 trait per SNP
traits <- list()
for (i in seq_len(n_traits)) {
  traits[[i]] <- plinkr::create_random_trait(mafs = 0.49 * i / n_traits) # 1 trait per SNP
}

assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
  n_individuals = n_individuals,
  traits = traits
)
# Put all on the same chromosome, as PLINK checks for LD on same chromosomes only
assoc_qt_data$data$map_table$CHR <- 1

# Add LD for a common allele, as there is none just yet:
testthat::expect_equal(
  length(
    plinkr::get_marker_correlation_coefficients(
      data = assoc_qt_data$data,
      ld_window_r2 = 0.2 # PLINK default threshold
    )
  ),
  0 # Nope, no LD yet
)
# Add LDs in the even SNps (human based counting),
# e.g. snv_2a, snv_2b, snv_4a, snv_4b, etc
# First SNP is at index 7
lds <- seq(from = 0.0, to = 1.0, length.out = n_snps * 2)
lds[ seq(from = 1, to = n_snps * 2, by = 4) ] <- 0.0
lds[ seq(from = 2, to = n_snps * 2, by = 4) ] <- 0.0
for (snp_index in seq(3, n_snps * 2)) {
  f_same <- lds[snp_index]
  if (n_individuals * f_same < 1.0) next
  which_same <- seq(1, n_individuals * f_same)
  assoc_qt_data$data$ped_table[which_same, snp_index + 6] <- assoc_qt_data$data$ped_table[which_same, snp_index - 2 + 6]
}

testthat::expect_true(
  length(
    plinkr::get_marker_correlation_coefficients(
      data = assoc_qt_data$data,
      ld_window_r2 = 0.2 # PLINK default threshold
    )
  ) > 0
)

minor_allele_frequencies <- plinkr::get_minor_alelle_frequencies(assoc_qt_data$data)
minor_allele_frequencies
n_rare_snps <- sum(minor_allele_frequencies < 0.01)
testthat::expect_true(n_rare_snps > 0)
n_common_snps <- sum(minor_allele_frequencies >= 0.01)
testthat::expect_equal(n_snps, n_rare_snps + n_common_snps)

marker_correlation_coefficients_table <- plinkr::get_marker_correlation_coefficients_table(
  data = assoc_qt_data$data,
  ld_window_r2 = 0.2
)
marker_correlation_coefficients_table
hist(marker_correlation_coefficients_table$R)

# Convert PLINK1 text format to PLINK1 binary format
assoc_qt_data$data <- plinkr::convert_plink_text_data_to_plink_bin_data(
  assoc_qt_data$data
)

plinkr::save_plink_bin_data(
  plink_bin_data = assoc_qt_data$data,
  base_input_filename = base_input_filename
)
plinkr::save_phe_table(
  phe_table = assoc_qt_data$phenotype_data$phe_table,
  phe_filename = phe_filename
)


# Read again and verify
# * Must have SNPs with MAF < 1%, to test if PLINK filters these away
# * Must have SNPs in LD > 0.2 to test if PLINK filters these away
# * Output must be in PLINK binary format
plink_bin_data <- read_plink_bin_data(
  base_input_filename = base_input_filename
)
plink_bin_data$phe_table <- plinkr::read_plink_phe_file(phe_filename)
minor_allele_frequencies <- plinkr::get_minor_alelle_frequencies(plink_bin_data)
n_rare_snps <- sum(minor_allele_frequencies < 0.01)
testthat::expect_true(n_rare_snps > 0)
marker_correlation_coefficients_table <- plinkr::get_marker_correlation_coefficients_table(
  data = plink_bin_data,
  ld_window_r2 = 0.2
)
testthat::expect_true(length(marker_correlation_coefficients_table$R) > 0)


# Use plink
