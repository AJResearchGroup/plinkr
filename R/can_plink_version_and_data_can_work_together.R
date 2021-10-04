#' Determine if the `data` and the version of `PLINK`/`PLINK2` can work together
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `data` and the version
#' of `PLINK`/`PLINK2` can work together
#' @author Richèl J.C. Bilderbeek
#' @export
can_plink_version_and_data_can_work_together <- function(
  data,
  plink_options,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_plink_version_and_data_can_work_together(
      data = data,
      plink_options = plink_options
    )
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
