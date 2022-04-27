#' Create a table of the selected sample IDs
#' @inheritParams default_params_doc
#' @return a `sample_ids` (see \link{check_sample_ids})
#' @author Richèl J.C. Bilderbeek
#' @export
create_selected_sample_ids <- function(
  plink_bin_filenames,
  sample_selector
) {
  plinkr::check_plink_bin_filenames(plink_bin_filenames)
  plinkr::check_sample_selector(sample_selector)
  if (plinkr::is_single_sample_selector(sample_selector)) {
    testthat::expect_true("fid" %in% names(sample_selector))
    testthat::expect_true("iid" %in% names(sample_selector))
    return(
      tibble::tibble(
        fam = sample_selector$fid,
        id = sample_selector$iid,
      )
    )
  } else {
    stop("Sample selector not implemented yet")
  }
}
