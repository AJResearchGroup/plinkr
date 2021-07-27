test_that("use", {
  suppressMessages(
    expect_message(plinkr_report())
  )
})

test_that("use", {
  suppressMessages(
    expect_message(
      plinkr_report(
        plink_optionses = create_plink_optionses(
          plink_folder = "nonsense"
        )
      )
    )
  )
})
