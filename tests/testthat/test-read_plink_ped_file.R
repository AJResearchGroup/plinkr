test_that("minimal use", {

  ped_filenames <- stringr::str_subset(get_plinkr_filenames(), "\\.ped$")
  for (ped_filename in ped_filenames) {
    expect_silent(
      read_plink_ped_file(
        ped_filename = ped_filename
      )
    )
  }
})

test_that("minimal use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed()) return()
  expect_silent(
    read_plink_ped_file(
      ped_filename = get_plink_example_filename(
        example_filename = "test.ped",
        create_plink_v1_7_options()
      )
    )
  )
})

test_that("use, v1.7", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  t <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      create_plink_v1_7_options()
    )
  )
  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  expect_true("FID" %in% names(t))
  expect_true("IID" %in% names(t))
  expect_true("within_family_id_father" %in% names(t))
  expect_true("within_family_id_mother" %in% names(t))
  expect_true("sex_code" %in% names(t))
  expect_true("case_control_code" %in% names(t))
  expect_true("snv_1a" %in% names(t))
  expect_true("snv_1b" %in% names(t))
  expect_true("snv_2a" %in% names(t))
  expect_true("snv_2b" %in% names(t))
})

test_that("use, v1.9", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  t <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "toy.ped",
      create_plink_v1_9_options()
    )
  )
  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  expect_true("FID" %in% names(t))
  expect_true("IID" %in% names(t))
  expect_true("within_family_id_father" %in% names(t))
  expect_true("within_family_id_mother" %in% names(t))
  expect_true("sex_code" %in% names(t))
  expect_true("case_control_code" %in% names(t))
  expect_true("snv_1a" %in% names(t))
  expect_true("snv_1b" %in% names(t))
  expect_true("snv_2a" %in% names(t))
  expect_true("snv_2b" %in% names(t))
})


test_that("save and load result from get_test_ped_table()", {
  ped_filename <- get_plinkr_tempfilename()
  ped_table <- get_test_ped_table()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  ped_table_again <- read_plink_ped_file(ped_filename = ped_filename)
  expect_identical(ped_table, ped_table_again)
  file.remove(ped_filename)
})

test_that("save and load result from create_demo_ped_table()", {
  ped_filename <- get_plinkr_tempfilename()
  ped_table <- create_demo_ped_table()
  save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  ped_table_again <- read_plink_ped_file(ped_filename = ped_filename)
  expect_identical(ped_table, ped_table_again)
  file.remove(ped_filename)
})

test_that("read PLINK tutorial files", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_tutorial_data_installed()) return()
  ped_filename <- stringr::str_subset(
    get_plink_tutorial_data_filenames(), "hapmap1.ped"
  )
  expect_silent(read_plink_ped_file(ped_filename))
})
