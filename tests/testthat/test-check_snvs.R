test_that("use", {
  expect_silent(check_snvs(tibble::tibble(lhs = "A", rhs = "C")))
})

test_that("only two nucleotide", {
  expect_error(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A"),
        rhs = c("C", "T")
      )
    )
  )
})

test_that("nonsense nucleotide", {
  expect_error(
    check_snvs(
      snvs = tibble::tibble(
        lhs = "A",
        rhs = "X"
      )
    )
  )
})
