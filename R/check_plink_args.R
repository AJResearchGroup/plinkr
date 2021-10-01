#' Check if the PLINK version is valid, will stop if not
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_plink_args("--version")
#' @export
check_plink_args <- function(args) {

  if (length(args) == 0) {
    stop(
      "'args' must have at least one element"
    )
  }
  if ("--covar" %in% args) {
    bad_other_args <- c(
      "--assoc",
      "--mh",
      "--model",
      "--tdt",
      "--dfam",
      "--qfam",
      "--hap-assoc",
      "--hap-tdt"
    )
    for (bad_other_arg in bad_other_args) {
      if (bad_other_arg %in% args) {
        stop(
          "'", bad_other_arg, "' does not accept covariates ('--covar'). \n",
          "args: ", paste(args, collapse = " "), " \n",
          "See https://zzz.bwh.harvard.edu/plink/data.shtml#covar"
        )
      }
    }
  }
 invisible(args)
}
