test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(
    read_plink_ped_file(
      ped_filename = get_plink_example_filename(
        example_filename = "test.ped",
        plink_version = "1.7"
      )
    )
  )
})

test_that("use, v1.7", {
  t <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      plink_version = "1.7"
    )
  )
  expect_true("family_id" %in% names(t))
  expect_true("within_family_id" %in% names(t))
  expect_true("within_family_id_father" %in% names(t))
  expect_true("within_family_id_mother" %in% names(t))
  expect_true("sex_code" %in% names(t))
  expect_true("phenotype_value" %in% names(t))
  expect_true("allele_call_1a" %in% names(t))
  expect_true("allele_call_1b" %in% names(t))
  expect_true("allele_call_2a" %in% names(t))
  expect_true("allele_call_2b" %in% names(t))
})

test_that("use, v1.9", {
  t <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "toy.ped",
      plink_version = "1.9"
    )
  )
  expect_true("family_id" %in% names(t))
  expect_true("within_family_id" %in% names(t))
  expect_true("within_family_id_father" %in% names(t))
  expect_true("within_family_id_mother" %in% names(t))
  expect_true("sex_code" %in% names(t))
  expect_true("phenotype_value" %in% names(t))
  expect_true("allele_call_1a" %in% names(t))
  expect_true("allele_call_1b" %in% names(t))
  expect_true("allele_call_2a" %in% names(t))
  expect_true("allele_call_2b" %in% names(t))
})
