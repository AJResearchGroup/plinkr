#' Determine if the `data` is indeed `PLINK` bin data
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `data` is indeed `PLINK` binary data
#' @seealso `plinkr` has multiple functions to test if a type of data is valid:
#'
#'  * `PLINK` text data: use \link{is_plink_text_data}
#'  * `PLINK` binary data: use \link{is_plink_bin_data}
#'  * `PLINK2` binary data: use \link{is_plink2_bin_data}
#'  * any type of `PLINK`/`PLINK2` data: use \link{is_data}
#'  * associative trait analysis data: use \link{is_assoc_qt_data}
#'
#' @examples
#' is_data(data = create_test_plink_text_data())
#' is_data(data = create_test_plink_bin_data())
#' is_data(data = create_test_plink2_bin_data())
#' is_data(data = create_test_plink_text_filenames())
#' is_data(data = create_test_plink_bin_filenames())
#' is_data(data = create_test_plink2_bin_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
is_data <- function(
  data,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_data(data = data)
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
