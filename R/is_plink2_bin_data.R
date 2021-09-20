#' Determine if the `plink2_bin_data` is indeed `PLINK2` binary data
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink2_bin_data <- function(
  plink2_bin_data
) {
  result <- FALSE
  tryCatch({
    plinkr::check_plink2_bin_data(plink2_bin_data = plink2_bin_data)
    result <- TRUE
  }, error = function(e) {} # nolint indeed ignore error
  )
  result
}
