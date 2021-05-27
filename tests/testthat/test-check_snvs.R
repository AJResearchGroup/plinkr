test_that("use", {
  expect_silent(check_snvs(tibble::tibble(lhs = "A", rhs = "C")))
})

test_that("only two, three of four nucleotide", {
  expect_silent(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A", "A"),
        rhs = c("A", "A", "A")
      )
    )
  )
  expect_silent(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A", "A"),
        rhs = c("A", "A", "C")
      )
    )
  )
  expect_silent(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A", "A"),
        rhs = c("A", "G", "C")
      )
    )
  )
  expect_silent(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A", "A"),
        rhs = c("T", "G", "C")
      )
    )
  )
  expect_error(
    check_snvs(
      snvs = tibble::tibble(
        lhs = c("A", "A", "X"),
        rhs = c("T", "G", "C")
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
