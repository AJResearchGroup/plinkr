setwd("~/GitHubs/plinkr/scripts/bug_report_genio_issue_10")
getwd()

plink_bin_data = create_test_plink_bin_data()
# colnames(plink_bin_data$bed_table)

plink_bin_filenames <- save_plink_bin_data(
  plink_bin_data = create_test_plink_bin_data(),
  base_input_filename = base_input_filename
)


base_input_filename <- "text_data"
base_output_filename <- "bin_data"

# Create PLINK text files
plink_text_data <- plinkr::create_demo_assoc_data()
text_data_filenames <- plinkr::save_plink_text_data(
  plink_text_data = plink_text_data$data,
  base_input_filename = base_input_filename
)


# Convert to PLINK binary format
plinkr::run_plink(
  args = c(
    "--file", base_input_filename,
    "--make-bed",
    "--out", base_output_filename
  )
)

# Column names in genotype matrix do not agree with FAM `id` column!
# Row names in genotype matrix do not agree with BIM `id` column!

plink_bin_data <- genio::read_plink(base_output_filename)
plink_bin_data

genio::write_plink(
  file = "genio_output",
  X = plink_bin_data$X,
  bim = plink_bin_data$bim,
  fam = plink_bin_data$fam
)


plink_bin_data <- create_test_plink_bin_data()
plink_bin_data$fam_table$id <- as.character(seq(1, 6))
plinkr::save_plink_bin_data(
  plink_bin_data = plink_bin_data,
  base_input_filename = tempfile()
)
