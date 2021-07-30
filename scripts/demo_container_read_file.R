library(plinkr)

plink_optionses <- create_plink_optionses(plink_folder = "/opt/plinkr")
# PLINK v1.9
plink_options <- plink_optionses[[2]]

testthat::expect_true(is_plink_installed(plink_options = plink_options))


# Use the PLINK v1.9 example files
ped_filename <- "inst/extdata/toy_v1_9.ped"
map_filename <- "inst/extdata/toy_v1_9.map"
message("ped_filename: ", ped_filename)
message("map_filename: ", map_filename)
testthat::expect_true(file.exists(ped_filename))
testthat::expect_true(file.exists(map_filename))

# Do a case-control association
log_text <- run_plink(
  args = c(
   "--ped", ped_filename,
   "--map", map_filename
  ),
  plink_options = plink_options
)
cat(log_text)

# Read the results
bim_table <- read_plink_bim_file("plink.bim")
fam_table <- read_plink_fam_file("plink.fam")
bed_table <- read_plink_bed_file(
  "plink.bed",
  names_loci = bim_table$id,
  names_ind = fam_table$id
)

knitr::kable(bim_table)
knitr::kable(fam_table)
knitr::kable(bed_table)

# Delete the created files
invisible(file.remove("plink.bed"))
invisible(file.remove("plink.fam"))
invisible(file.remove("plink.log"))
