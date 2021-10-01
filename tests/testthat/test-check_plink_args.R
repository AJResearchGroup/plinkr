test_that("basic use", {
  expect_silent(check_plink_args(args = "--version"))

  expect_error(
    check_plink_args(args = c()),
    "'args' must have at least one element"
  )
})

test_that("detect invalid combinations of commands", {
  # From https://zzz.bwh.harvard.edu/plink/data.shtml#covar
  #
  # Not all commands accept covariates, and PLINK will not always give you
  # an error or warning. The basic association (--assoc, --mh, --model, --tdt,
  # --dfam, and --qfam) do not accept covariates, neither do the basic
  # haplotype association methods (--hap-assoc, --hap-tdt).
  expect_error(
    check_plink_args(args = c("--assoc", "--covar")),
    "'--assoc' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--mh", "--covar")),
    "'--mh' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--model", "--covar")),
    "'--model' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--tdt", "--covar")),
    "'--tdt' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--dfam", "--covar")),
    "'--dfam' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--qfam", "--covar")),
    "'--qfam' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--hap-assoc", "--covar")),
    "'--hap-assoc' does not accept covariates"
  )
  expect_error(
    check_plink_args(args = c("--hap-tdt", "--covar")),
    "'--hap-tdt' does not accept covariates"
  )
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})
