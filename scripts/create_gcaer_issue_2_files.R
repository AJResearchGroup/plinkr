# Needed for https://github.com/richelbilderbeek/gcaer/issues/2
#
# Output must be in PLINK binary format
#
library(plinkr)

# Simulate data in PLINK1 text format
assoc_qt_params <- create_demo_assoc_qt_data(
  n_individuals = 10,
  traits = create_demo_traits()
)

# Convert PLINK1 text format to PLINK1 binary format
base_input_filename <- "~/gcaer_issue_2_text"
ped_filename <- paste0(base_input_filename, ".ped")
map_filename <- paste0(base_input_filename, ".map")
phe_filename <- paste0(base_input_filename, ".phe")
base_output_filename <- "~/gcaer_issue_2_bin"
plinkr::save_ped_table(
  ped_table = assoc_qt_params$data$ped_table,
  ped_filename = ped_filename
)
plinkr::save_map_table(
  map_table = assoc_qt_params$data$map_table,
  map_filename = map_filename
)
plinkr::save_phe_table(
  phe_table = assoc_qt_params$phe_table,
  phe_filename = phe_filename
)
plink_bin_filenames <- plinkr::convert_plink_text_files_to_plink_bin_files(
  base_input_filename = base_input_filename,
  base_output_filename = base_output_filename
)

# Done!

# But hey, if you want to inspect the data:
bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)
fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)
bed_table <- read_plink_bed_file(
  bed_filename = plink_bin_filenames$bed_filename,
  names_loci = bim_table$id,
  names_ind = fam_table$id
)

plinkr::read_plink_bed_file(plink_bin_filenames$bed_filename)
