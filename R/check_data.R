#' Check if the data is valid
#'
#' Check if the data is valid.
#' The data can be in PLINK text, PLINK binary or PLINK2 binary format.
#' Will \link{stop} if the data is not in any of these formats
#' @inheritParams default_params_doc
#' @return nothing.
#' @seealso `plinkr` has the following functions to check if in-memory `data`
#' is valid:
#'
#'  * `PLINK` text data: use \link{check_plink_text_data}
#'  * `PLINK` binary data: use \link{check_plink_bin_data}
#'  * `PLINK2` binary data: use \link{check_plink2_bin_data}
#'  * any `PLINK`/`PLINK2` data: use \link{check_data}
#'  * quantitative trait analysis data: use \link{check_assoc_qt_data}
#'
#' @examples
#' check_data(data = create_test_plink_text_data())
#' check_data(data = create_test_plink_bin_data())
#' check_data(data = create_test_plink2_bin_data())
#' check_data(data = create_test_plink_text_filenames())
#' check_data(data = create_test_plink_bin_filenames())
#' check_data(data = create_test_plink2_bin_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
check_data <- function(data) {
  if (!is.list(data)) {
    stop(
      "'data' must be a list  \n",
      "Actual class: ", class(data), " \n",
      "Tip 1: for PLINK text data, use 'create_plink_text_data'. \n",
      "Tip 2: for PLINK binary data, use 'create_plink_bin_data'. \n",
      "Tip 3: for PLINK2 binary data, use 'create_plink2_bin_data'. \n"
    )
  }

  # No use to use the ideom below, as 'is_[x]' calls 'check_[x]':
  # if (plinkr::is_plink_text_data(data)) {                                     # nolint
  #   plinkr::check_plink_text_data(data)                                       # nolint
  # } else if ...                                                               # nolint
  if (plinkr::is_plink_text_data(data)) {
    return(invisible(data))
  } else if (plinkr::is_plink_bin_data(data)) {
    return(invisible(data))
  } else if (plinkr::is_plink2_bin_data(data)) {
    return(invisible(data))
  } else if (plinkr::is_plink_text_filenames(plink_text_filenames = data)) {
    return(invisible(data))
  } else if (plinkr::is_plink_bin_filenames(plink_bin_filenames = data)) {
    return(invisible(data))
  } else if (plinkr::is_plink2_bin_filenames(plink2_bin_filenames = data)) {
    return(invisible(data))
  } else if (plinkr::is_assoc_qt_data(assoc_qt_data = data)) {
    return(invisible(data))
  } else {
    stop(
      "Unknown data format. \n",
      "names(data): ", names(data), " \n",
      "Tip 1: for PLINK text data, use 'create_plink_text_data'. \n",
      "Tip 2: for PLINK binary data, use 'create_plink_bin_data'. \n",
      "Tip 3: for PLINK2 binary data, use 'create_plink2_bin_data'. \n",
      "Tip 4: for PLINK text files, use 'create_plink_text_files'. \n",
      "Tip 5: for PLINK binary files, use 'create_plink_bin_files'. \n",
      "Tip 6: for PLINK2 binary files, use 'create_plink2_bin_files'. \n"
    )
  }
}
