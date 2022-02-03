# https://github.com/richelbilderbeek/nsphs_ml_qt/issues/4
#
# Output must be in PLINK binary format
#
# Needed for https://github.com/richelbilderbeek/gcaer/issues/2
#
# Output must be in PLINK binary format
#
base_input_filename <- "~/nsphs_ml_qt_issue_4_bin"
phe_filename <- paste0(base_input_filename, ".phe")

set.seed(42)
n_individuals <- 10
n_traits <- 500
traits <- list()
for (i in seq_len(n_traits)) {
  traits[[i]] <- create_random_trait(mafs = 0.49 * i / n_traits)
}

assoc_qt_data <- plinkr::create_demo_assoc_qt_data(
  n_individuals = n_individuals,
  traits = traits
)

minor_allele_frequencies <- plinkr::get_minor_alelle_frequencies(assoc_qt_data)



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
