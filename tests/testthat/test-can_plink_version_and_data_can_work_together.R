test_that("use", {
  # Tested in detail by 'check_plink_version_and_data_can_work_together'
  expect_true(
    can_plink_version_and_data_can_work_together(
      data = create_test_plink_text_data(),
      plink_options = create_plink_v1_7_options()
    )
  )
  expect_false(
    can_plink_version_and_data_can_work_together(
      data = create_test_plink_text_data(),
      plink_options = create_plink_v2_0_options()
    )
  )
})
