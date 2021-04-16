test_that("un- or install", {
  skip("WIP")
  if (!is_on_ci()) return()

  if (is_plink_installed()) {
    uninstall_plink()
    expect_false(is_plink_installed())
    install_plink()
    expect_true(is_plink_installed())
  } else {
    install_plink()
    expect_true(is_plink_installed())
    uninstall_plink()
    expect_false(is_plink_installed())
  }
})
