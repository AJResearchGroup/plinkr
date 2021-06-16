test_that("show help", {
  if (!is_plink_installed()) return()
  expect_silent(run_plink(args = "--help"))
})

test_that("verbose", {
  if (!is_plink_installed()) return()
  expect_message(
    run_plink(
      args = "--help",
      plink_options = create_plink_options(),
      verbose = TRUE
    )
  )
})

test_that("no duplicate --noweb flag", {
  if (!is_plink_installed()) return()
  expect_error(
    run_plink(args = "--noweb"),
    "Duplicate --noweb flag"
  )
})



test_that("warnings", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_demo_assoc_qt_params(
    traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  ped_filename <- get_plinkr_tempfilename()
  map_filename <- get_plinkr_tempfilename()
  phenotype_filename <- get_plinkr_tempfilename()
  save_ped_table_to_file(
    ped_table = assoc_qt_params$ped_table,
    ped_filename = ped_filename
  )
  save_map_table_to_file(
    map_table = assoc_qt_params$map_table,
    map_filename = map_filename
  )
  save_phenotype_table_to_file(
    phenotype_table = assoc_qt_params$phenotype_table,
    phenotype_filename = phenotype_filename
  )
  args <- c(
    "--ped", ped_filename,
    "--map", map_filename,
    "--assoc",
    "--pheno", phenotype_filename
  )
  expect_warning(
    run_plink(args),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
  file.remove(ped_filename)
  file.remove(map_filename)
  file.remove(phenotype_filename)
})
