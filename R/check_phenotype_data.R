#' Check if the `phenotype_data` is valid
#'
#' Check if the `phenotype_data` is valid.
#' The `phenotype_data` can be a filename (`phe_filename`)
#' or a \link[tibble]{tibble} (`phe_table`)
#'
#' Will \link{stop} if the data is not in any of these formats
#' @inheritParams default_params_doc
#' @examples
#' check_phenotype_data(phenotype_data = create_test_phenotype_data())
#' check_phenotype_data(phenotype_data = create_test_phenotype_filename())
#' @author Richèl J.C. Bilderbeek
#' @export
check_phenotype_data <- function(phenotype_data) {
  if (!is.list(phenotype_data)) {
    stop(
      "'phenotype_data' must be a list  \n",
      "Actual class: ", class(phenotype_data), " \n",
      "Tip 1: for using in-memory data, use 'create_phenotype_data'. \n",
      "Tip 2: for using a filename, use 'create_phenotype_filename'. \n"
    )
  }

  # No use to use the ideom below, as 'is_[x]' calls 'check_[x]':
  # if (plinkr::is_plink_text_data(data)) {                                     # nolint
  #   plinkr::check_plink_text_data(data)                                       # nolint
  # } else if ...                                                               # nolint
  if (plinkr::is_phenotype_data_table(phenotype_data)) {
    return(invisible(phenotype_data))
  }
  if (plinkr::is_phenotype_data_filename(phenotype_data)) {
    return(invisible(phenotype_data))
  }
  stop(
    "Unknown data format. \n",
    "names(data): ", names(phenotype_data), " \n",
    "Tip 1: for using in-memory data, use 'create_phenotype_data'. \n",
    "Tip 2: for using a filename, use 'create_phenotype_filename'. \n"
  )
}
