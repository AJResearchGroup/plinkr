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
  } else if (plinkr::is_random_samples_selector(sample_selector)) {
    testthat::expect_true("n_samples" %in% names(sample_selector))
    n_samples <- sample_selector$n_samples
    fam_table <- plinkr::read_plink_fam_file(
      plink_bin_filenames$fam_filename
    )[, c(1, 2)]
    testthat::expect_true(n_samples <= nrow(fam_table))
    indices <- sample(
      x = seq(1, nrow(fam_table)),
      size = n_samples,
      replace = FALSE
    )
    sorted_indices <- sort(indices)
    return(fam_table[sorted_indices, ])
  } else {
    stop("Sample selector not implemented yet")
  }
}
