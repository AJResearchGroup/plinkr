test_that("un- or install in temp plink folder", {
  if (!is_on_ci()) return()

  for (os in c("unix", "mac", "win")) {
    plink_folder <- get_plinkr_tempfilename()
    plink_optionses <- create_plink_optionses(
      plink_folder = plink_folder,
      os = os
    )
    for (plink_options in plink_optionses) {
      expect_false(is_plink_installed(plink_options))
    }
    expect_silent(install_plinks(plink_optionses))

    for (plink_options in plink_optionses) {
      expect_true(is_plink_installed(plink_options))
    }

    expect_silent(uninstall_plinks(plink_optionses))

    for (plink_options in plink_optionses) {
      expect_false(is_plink_installed(plink_options))
    }
    unlink(plink_folder, recursive = TRUE)
  }

})
