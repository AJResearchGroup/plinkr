#' Check the \code{mafs}, the minor allele frequencies.
#'
#' Check the \code{mafs}, the minor allele frequencies,
#' will \link{stop} if these are invalid.
#' @inheritParams default_params_doc
#' @examples
#' check_mafs(0.25)
#' check_mafs(c(0.1, 0.01))
#' check_mafs(c(0.1, 0.01, 0.001))
#' @author Richèl J.C. Bilderbeek
#' @export
check_mafs <- function(mafs) {
  testthat::expect_true(is.numeric(mafs))
  testthat::expect_true(length(mafs) >= 1)
  testthat::expect_true(length(mafs) <= 3)
  for (i in seq_along(mafs)) {
    tryCatch(
      expr = plinkr::check_maf(mafs[[i]]),
      error = function(e) {
        stop(
          "Error in ", i, "th maf: \n",
          e$message
        )
      }
    )
  }

  if (!all(mafs == sort(mafs, decreasing = TRUE))) {
    stop(
      "'mafs' must be ordered from common (hight values) ",
        "to rare (low values) \n",
      "mafs: ", paste(mafs, collapse = " "), " \n",
      " \n",
      "Tip: use 'sort(mafs, decreasing = TRUE)' to do so"
    )
  }
  if (sum(mafs) >= 1.0) {
    stop(
      "The sum of the 'mafs' must be below 1.0 \n",
      "mafs: ", paste(mafs, collapse = " "), " \n",
      "sum(mafs): ", sum(mafs)
    )
  }
  major_allele_freq <- 1.0 - sum(mafs)
  minor_allele_freq <- max(mafs)
  if (minor_allele_freq >= major_allele_freq) {
    stop(
      "The major allele frequency must exceed ",
        "the heighest minor allele frequency. \n",
      "mafs: ", paste(mafs, collapse = " "), " \n",
      "major allele frequency: ", major_allele_freq,
        " (simply equal to '1.0 - sum(mafs)') \n",
      "heightest MAF: ", minor_allele_freq
    )
  }
}
