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
        "--ci", assoc_params$confidence_interval,
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
        "--ci", assoc_params$confidence_interval,
        "--out", assoc_params$base_output_filename
      )
    )
  }
  testthat::expect_true(plink_options$plink_version == "2.0")
  c(
    "--bed", paste0(assoc_params$base_input_filename, ".bed"),
    "--bim", paste0(assoc_params$base_input_filename, ".bim"),
    "--fam", paste0(assoc_params$base_input_filename, ".fam"),
    "--glm",
    "--allow-extra-chr",
    "--maf", assoc_params$maf,
    "--ci", assoc_params$confidence_interval,
    "--out", assoc_params$base_output_filename
  )
}
