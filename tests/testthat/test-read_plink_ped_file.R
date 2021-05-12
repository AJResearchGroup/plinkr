test_that("minumal use", {
  expect_silent(
    read_plink_ped_file(
      ped_filename = get_plink_example_filename("test.ped")
    )
  )
})

test_that("use", {
  t <- read_plink_ped_file(
    ped_filename = get_plink_example_filename("test.ped")
  )
  expect_true("family_id" %in% names(t))
  expect_true("within_family_id" %in% names(t))
  expect_true("within_family_id_father" %in% names(t))
  expect_true("within_family_id_mother" %in% names(t))
  expect_true("sex_code" %in% names(t))
  expect_true("phenotype_value" %in% names(t))
  expect_true("allele_call_1_1" %in% names(t))
  expect_true("allele_call_1_2" %in% names(t))
  expect_true("allele_call_2_1" %in% names(t))
  expect_true("allele_call_2_2" %in% names(t))
})
