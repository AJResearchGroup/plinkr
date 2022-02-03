# https://github.com/richelbilderbeek/nsphs_ml_qt/issues/4
#
# * Must have SNPs with MAF < 1%, to test if PLINK filters these away
# * Must have SNPs in LD > 0.2 to test if PLINK filters these away
# * Output must be in PLINK binary format
#
#
#
#
base_input_filename <- "~/nsphs_ml_qt_issue_4_bin"
phe_filename <- paste0(base_input_filename, ".phe")

set.seed(42)
n_individuals <- 500 # To detect a MAF < 0.01
n_snps <- 500
n_traits <- n_snps # 1 trait per SNP
traits <- list()
for (i in seq_len(n_traits)) {
  traits[[i]] <- create_random_trait(mafs = 0.49 * i / n_traits) # 1 trait per SNP
}

assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
  n_individuals = n_individuals,
  traits = traits
)
assoc_qt_data$data$map_table$CHR <- 1 + ((assoc_qt_data$data$map_table$CHR - 1) %% 20)
minor_allele_frequencies <- plinkr::get_minor_alelle_frequencies(assoc_qt_data$data)
minor_allele_frequencies
n_rare_snps <- sum(minor_allele_frequencies < 0.01)
testthat::expect_true(n_rare_snps > 0)
n_common_snps <- sum(minor_allele_frequencies >= 0.01)
testthat::expect_equal(n_snps, n_rare_snps + n_common_snps)

HIERO

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
