#' Check if the multiple sets of options to run PLINK are valid.
#'
#' Check if the multiple sets of options to run PLINK are valid.
#' Will \link{stop} if not.
#'
#' Note that this function does not check if PLINK is actually present in
#' that folder, similar to \link{normalizePath}
#' with \code{mustWork} set to \link{FALSE}
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' check_plink_optionses(create_plink_optionses())
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_optionses <- function(
  plink_optionses
) {
  if (!is.list(plink_optionses)) {
    stop(
      "'plink_optionses' must be a list  \n",
      "Actual class: ", class(plink_optionses), " \n",
      "Tip: use 'plinkr::create_plink_optionses()'\n"
    )
  }
  for (plink_options in plink_optionses) {
    plinkr::check_plink_options(plink_options)
  }
}
