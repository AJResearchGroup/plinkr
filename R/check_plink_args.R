#' Check if the PLINK version is valid, will stop if not
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_plink_args("--version")
#' @export
check_plink_args <- function(
  args,
  plink_options = create_plink_options()
) {

  if (length(args) == 0) {
    stop(
      "'args' must have at least one element"
    )
  }

  if (plink_options$plink_version == "1.7") {

    if ("--allow-extra-chr" %in% args) {
      stop(
        "'args' invalid: '--allow-extra-chr' ",
        "did not yet exist in PLINK v1.7. \n",
        "Tip: use 'plink_options = create_plink_v1_9_options()' ",
        "to use PLINK v1.9 instead"
      )
    }
    if ("--chr-set" %in% args) {
      stop(
        "'args' invalid: '--chr-set' ",
        "did not yet exist in PLINK v1.7. \n",
        "Tip: use 'plink_options = create_plink_v1_9_options()' ",
        "to use PLINK v1.9 instead"
      )
    }


    if (!"--noweb" %in% args) {
      stop(
        "'args' must have '--noweb' for PLINK version 1.7, ",
        "as 'plinkr' will freeze otherwise \n",
        "args: ", paste(args, collapse = " "), " \n",
        "Tip: add '--noweb' to 'args'"
      )
    }
  } else {
    if ("--noweb" %in% args) {
      stop(
        "'args' must not have '--noweb' for PLINK version above v1.7, ",
        "as this flag is obsolete \n",
        "plink version: ", plink_options$plink_version, " \n",
        "args: ", paste(args, collapse = " "), " \n",
        "Tip: remove '--noweb' from 'args'"
      )
    }
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
