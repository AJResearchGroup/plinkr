#' Check if the `PLINK2` bin data is valid.
#'
#' Check if the `PLINK2` bin data is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink2_bin_data <- function(
  plink2_bin_data
) {
  if (!is.list(plink2_bin_data)) {
    stop(
      "'plink2_bin_data' must be a list  \n",
      "Actual class: ", class(plink2_bin_data), " \n",
      "Tip: use 'plinkr::create_plink2_bin_data()'\n"
    )
  }
  # No idea yet what the elements are
  testthat::expect_true("unknown_table_name" %in% names(plink2_bin_data))
  invisible(plink2_bin_data)
}
