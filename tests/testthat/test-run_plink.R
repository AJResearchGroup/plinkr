test_that("show help, v1.7", {
  if (!is_plink_installed()) return()
  expect_silent(
    run_plink(
      args = c("--help", "--noweb"),
      plink_options = create_plink_v1_7_options()
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("show help, v1.9", {
  if (!is_plink_installed()) return()
  expect_silent(
    run_plink(
      args = "--help",
      plink_options = create_plink_v1_9_options()
    )
  )
})

test_that("show help, v2.0", {
  if (!is_plink_installed()) return()
  expect_silent(
    run_plink(
      args = "--help",
      plink_options = create_plink_v2_0_options()
    )
  )
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

test_that("error", {
  if (!is_plink_installed()) return()
  args <- c(
    "--nonsense"
  )
  expect_error(
    run_plink(args),
    "you should be able to copy-paste this"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("warnings", {
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
    n_individuals = 10
  )
  ped_filename <- get_plinkr_tempfilename(fileext = ".ped")
  map_filename <- get_plinkr_tempfilename(fileext = ".map")
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_ped_table(
    ped_table = assoc_qt_data$data$ped_table,
    ped_filename = ped_filename
  )
  save_map_table(
    map_table = assoc_qt_data$data$map_table,
    map_filename = map_filename
  )
  save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = phe_filename
  )
  args <- c(
    "--ped", ped_filename,
    "--map", map_filename,
    "--assoc",
    "--pheno", phe_filename
  )
  expect_warning(
    run_plink(args),
    "Variant 1 quadallelic; setting rarest alleles missing"
  )
  file.remove(ped_filename)
  file.remove(map_filename)
  file.remove(phe_filename)
})

test_that("assoc_qt the PLINK way", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  set.seed(314)
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = rep(list(create_random_trait(n_snps = 1)), 2),
    n_individuals = 10
  )
  ped_filename <- get_plinkr_tempfilename(fileext = ".ped")
  map_filename <- get_plinkr_tempfilename(fileext = ".map")
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_ped_table(
    ped_table = assoc_qt_data$data$ped_table,
    ped_filename = ped_filename
  )
  save_map_table(
    map_table = assoc_qt_data$data$map_table,
    map_filename = map_filename
  )
  save_phe_table(
    phe_table = assoc_qt_data$phenotype_data$phe_table,
    phe_filename = phe_filename
  )
  args <- c(
    "--ped", ped_filename,
    "--map", map_filename,
    "--assoc",
    "--pheno", phe_filename,
    "--all-pheno"
  )
  expect_silent(run_plink(args))

  qassoc_filenames <- paste0(
    "plink.", names(assoc_qt_data$phenotype_data$phe_table)[c(-1, -2)],
    ".qassoc"
  )
  expect_true(all(file.exists(qassoc_filenames)))
  file.remove(ped_filename)
  file.remove(map_filename)
  file.remove(phe_filename)
  file.remove(qassoc_filenames)

  expect_silent(check_empty_plinkr_folder())
})

test_that("assoc_qt the PLINK way with phenotype file with header", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed()) return()
  clear_plinkr_cache()

  # Without header works
  args <- c(
    "--ped", get_plinkr_filename("test_v1_7.ped"),
    "--map", get_plinkr_filename("test_v1_7.map"),
    "--assoc",
    "--pheno", get_plinkr_filename("pheno.raw"),
    "--all-pheno"
  )
  expect_silent(run_plink(args))
  qassoc_filenames <- "plink.P1.qassoc"
  expect_true(all(file.exists(qassoc_filenames)))
  file.remove(qassoc_filenames)

  # With header
  args <- c(
    "--ped", get_plinkr_filename("test_v1_7.ped"),
    "--map", get_plinkr_filename("test_v1_7.map"),
    "--assoc",
    "--pheno", get_plinkr_filename("pheno_with_header.phe"),
    "--all-pheno"
  )
  expect_silent(run_plink(args))
  qassoc_filenames <- "plink.P1.qassoc"
  expect_true(all(file.exists(qassoc_filenames)))
  file.remove(qassoc_filenames)

  expect_silent(check_empty_plinkr_folder())
})

test_that("detect invalid combinations of commands", {
  if (!is_plink_installed()) return()
  clear_plinkr_cache()

  # From https://zzz.bwh.harvard.edu/plink/data.shtml#covar
  #
  # Not all commands accept covariates, and PLINK will not always give you
  # an error or warning. The basic association (--assoc, --mh, --model, --tdt,
  # --dfam, and --qfam) do not accept covariates, neither do the basic
  # haplotype association methods (--hap-assoc, --hap-tdt).
  expect_error(
    run_plink(
      args = c("--assoc", "--covar")
    ),
    "'--assoc' does not accept covariates"
  )

  expect_silent(check_empty_plinkr_folder())
})
