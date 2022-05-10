#' Create the command-line arguments to call PLINK or PLINK2
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_args <- function(
  assoc_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version == "1.7") {
    return(
      c(
        "--map", paste0(assoc_params$base_input_filename, ".map"),
        "--ped", paste0(assoc_params$base_input_filename, ".ped"),
        "--assoc",
        "--maf", assoc_params$maf,
        "--out", assoc_params$base_output_filename,
        "--noweb" # Will freeze otherwise
      )
    )
  }
  if (plink_options$plink_version == "1.9") {
    return(
      c(
        "--map", paste0(assoc_params$base_input_filename, ".map"),
        "--ped", paste0(assoc_params$base_input_filename, ".ped"),
        "--assoc",
        "--chr-set", 95,
        "--maf", assoc_params$maf,
        "--out", assoc_params$base_output_filename
      )
    )
  }
  testthat::expect_true(plink_options$plink_version == "2.0")
  if (plinkr::is_plink2_bin_data(assoc_data$data)) {
    args <- c(
      "--pfile", assoc_params$base_input_filename,
      "--glm",
      "--allow-extra-chr",
      "--maf", assoc_params$maf,
      "--out", assoc_params$base_output_filename
    )
    if (plink_options$plink_version == "2.0") {
      if (!is.na(assoc_params$confidence_interval)) {
        args <- c(args, "--ci", assoc_params$confidence_interval)
      }
    }
  } else {
    testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_data$data))
    args <- c(
      "--pgen", assoc_data$data$pgen_filename,
      "--psam", assoc_data$data$psam_filename,
      "--pvar", assoc_data$data$pvar_filename,
      "--glm",
      "--allow-extra-chr",
      "--maf", assoc_params$maf,
      "--out", assoc_params$base_output_filename
    )
    testthat::expect_true(plink_options$plink_version == "2.0")
    if (!is.na(assoc_params$confidence_interval)) {
      args <- c(args, "--ci", assoc_params$confidence_interval)
    }
  }
  args
}
