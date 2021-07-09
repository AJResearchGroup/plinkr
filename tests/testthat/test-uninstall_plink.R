test_that("use", {
  expect_error(
    uninstall_plink("nonsense"),
    "must be a list"
  )
})

test_that("cannot uninstall if PLINK is absent", {
  # Do codecov testing on Linux
  if (get_os() == "win") return()

  expect_error(
    uninstall_plink(plink_options = create_plink_v2_0_options(os = "win")),
    "Cannot uninstall a PLINK version that is absent"
  )

  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
