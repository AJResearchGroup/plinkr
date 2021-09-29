
test_that("use", {
  #  1 | PLINK         | PLINK1 text data| OK
  expect_silent(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink_text_data(),
      plink_options = create_plink_v1_9_options()
    )
  )
  #  2 | PLINK         | PLINK1 bin data | OK
  expect_silent(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink_bin_data(),
      plink_options = create_plink_v1_9_options()
    )
  )
  #  3 | PLINK         | PLINK2 bin data | Error
  expect_error(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink2_bin_data(),
      plink_options = create_plink_v1_9_options()
    )
  )
  #  4 | PLINK2        | PLINK1 text data| Error
  expect_error(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink_text_data(),
      plink_options = create_plink_v2_0_options()
    )
  )
  #  5 | PLINK2        | PLINK1 bin data | Error
  expect_error(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink_bin_data(),
      plink_options = create_plink_v2_0_options()
    )
  )
  #  6 | PLINK2        | PLINK2 bin data | OK
  expect_silent(
    check_plink_version_and_data_can_work_together(
      data = create_test_plink2_bin_data(),
      plink_options = create_plink_v2_0_options()
    )
  )
})
