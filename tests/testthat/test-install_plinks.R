test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  plink_folder <- tempfile()

  for (plink_version in get_plink_versions()) {
    expect_false(
      is_plink_installed(
        plink_version = plink_version,
        plink_folder = plink_folder
      )
    )
  }

  expect_silent(install_plinks(plink_folder = plink_folder))

  for (plink_version in get_plink_versions()) {
    expect_true(
      is_plink_installed(
        plink_version = plink_version,
        plink_folder = plink_folder
      )
    )
  }

  expect_silent(uninstall_plinks(plink_folder = plink_folder))

  for (plink_version in get_plink_versions()) {
    expect_false(
      is_plink_installed(
        plink_version = plink_version,
        plink_folder = plink_folder
      )
    )
  }
})
