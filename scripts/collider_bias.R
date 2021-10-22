n_individuals <- 1000
assoc_qt_params <- create_demo_assoc_qt_data(
  n_individuals = n_individuals,
  traits = create_random_trait()
)

female_indices <- seq(1, n_individuals / 2)
male_indices <- seq(1 + (n_individuals / 2), n_individuals)
male_sex_code <- 1 # As used by PLINK
female_sex_code <- 2 # As used by PLINK
testthat::expect_equal(length(female_indices), length(male_indices))
n_males <- length(male_indices)
n_females <- length(female_indices)
testthat::expect_equal(n_females, n_males)

assoc_qt_params$data$ped_table$sex_code[male_indices] <- male_sex_code
assoc_qt_params$data$ped_table$sex_code[female_indices] <- female_sex_code
assoc_qt_params$phe_table$random <- NULL
assoc_qt_params$phe_table$height <- NA
assoc_qt_params$phe_table$height[male_indices] <- rnorm(
  n = n_males,
  mean = 168.2, # cm, from Afghanistan from https://en.wikipedia.org/wiki/Average_human_height_by_country
  sd = 20.0 # cm, just a guess
)
assoc_qt_params$phe_table$height[female_indices] <- rnorm(
  n = n_females,
  mean = 155.3, # cm, from Afghanistan from https://en.wikipedia.org/wiki/Average_human_height_by_country
  sd = 20.0 # cm, just a guess
)


plink_output_base_filename <- file.path(get_plinkr_tempfilename(), "plink_output")
dir.create(dirname(plink_output_base_filename), showWarnings = FALSE, recursive = TRUE)
run_plink(
  args = c("--dummy", "2", "2", "--freq", "--make-bed", "--out", plink_output_base_filename),
  plink_options = create_plink_v1_9_options()
)
plink_output_filenames <- list.files(path = dirname(plink_output_base_filename), full.names = TRUE)
bed_filename <- stringr::str_subset(plink_output_filenames, ".bed$")
bim_filename <- stringr::str_subset(plink_output_filenames, ".bim$")
fam_filename <- stringr::str_subset(plink_output_filenames, ".fam$")
