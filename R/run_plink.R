#' Run PLINK from arguments
#' @inheritParams default_params_doc
#' @return the text that PLINK returns
#' @examples
#' if (is_plink_installed(create_plink_v1_7_options())) {
#'   run_plink("--help", create_plink_v1_7_options())
#' }
#'
#' if (is_plink_installed(create_plink_v1_9_options())) {
#'   run_plink("--help", create_plink_v1_9_options())
#' }
#'
#' if (is_plink_installed(create_plink_v2_0_options())) {
#'   run_plink("--help", create_plink_v2_0_options())
#' }
#'
#' plink_options <- create_plink_v1_9_options()
#' if (is_plink_installed(plink_options)) {
#'
#'   # Use the PLINK v1.9 example files
#'   ped_filename <- get_plink_example_filename(
#'     "toy.ped", plink_options
#'  )
#'   map_filename <- get_plink_example_filename(
#'     "toy.map", plink_options
#'   )
#'
#'   # Do a case-control association
#'   run_plink(
#'     args = c(
#'      "--ped", ped_filename,
#'      "--map", map_filename
#'     ),
#'     plink_options
#'   )
#'
#'   # Delete the created files
#'   file.remove("plink.bed")
#'   file.remove("plink.fam")
#'   file.remove("plink.log")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_plink <- function(
  args,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_plink_args(args)
  plinkr::check_plink_options(plink_options)
  plinkr::check_plink_is_installed(plink_options)

  # Will freeze otherwise
  if (plink_options$plink_version == "1.7" && sum(args == "--noweb") == 0) {
    args <- c(args, "--noweb")
  }
  plink_exe_path <- plink_options$plink_exe_path
  if (verbose) {
    message(
      "Running: '", plink_exe_path, " ", paste(args, collapse = " "), "'. \n",
      "Tip: you should be able to copy paste this :-)"
    )
  }
  suppressWarnings(
    text <- system2(
      command = normalizePath(plink_exe_path),
      args = args,
      stdout = TRUE,
      stderr = TRUE
    )
  )
  error_line_index <- stringr::str_which(text, "Error:")
  if (length(error_line_index) != 0) {
    error_text <- text[seq(from = error_line_index, to = length(text))]
    stop(
      paste0(error_text, collapse = " \n"),
      " \n",
      "Called PLINK with commands: \n",
      normalizePath(plink_exe_path), " ", paste0(args, collapse = " "), "\n",
      "Tip: you should be able to copy-paste this"
    )
  }
  warnings <- stringr::str_subset(text, "Warning")
  if (length(warnings) != 0) warning(warnings)
  text
}
