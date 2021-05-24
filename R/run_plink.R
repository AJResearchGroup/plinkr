#' Run PLINK from arguments
#' @inheritParams default_params_doc
#' @param args arguments for the PLINK executable
#' @return the text that PLINK returns
#' @export
run_plink <- function(
  args,
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder(),
  add_noweb = TRUE,
  verbose = FALSE
) {
  plinkr::check_plink_is_installed(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  if (add_noweb) {
    args <- c(args, "--noweb")
  }
  plink_exe_path <- plinkr::get_plink_exe_path(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  if (verbose) {
    message(
      "Running: '", plink_exe_path, " ", paste(args, collapse = " "), "'. \n",
      "Tip: you should be able to copy paste this :-)"
    )
  }
  system2(
    command = normalizePath(plink_exe_path),
    args = args,
    stdout = TRUE
  )
}
