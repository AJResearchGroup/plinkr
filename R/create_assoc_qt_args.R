#' Create the command-line arguments to call `PLINK` or `PLINK2`
#' to do a quantitative trait analysis,
#' depending on the type of data.
#' @inheritParams default_params_doc
#' @return the command-line arguments
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_args <- function(
  assoc_qt_params,
  plink_options = create_plink_options()
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_params$data,
    plink_options = plink_options
  )

  if (plinkr::is_plink_text_data(assoc_qt_params$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_text_data(
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink_bin_data(assoc_qt_params$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink_bin_data(
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink2_bin_data(assoc_qt_params$data)) {
    return(
      plinkr::create_assoc_qt_args_on_plink2_bin_data(
        assoc_qt_params = assoc_qt_params,
        plink_options = plink_options
      )
    )
  }
  if (plinkr::is_plink_text_filenames(assoc_qt_params$data)) {
    testthat::expect_true(
      plink_options$plink_version %in% plinkr::get_plink1_versions()
    )
    args <- c(
      "--map", assoc_qt_params$data$map_filename,
      "--ped", assoc_qt_params$data$ped_filename,
      "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
      "--all-pheno",
      "--assoc",
      "--maf", assoc_qt_params$maf,
      "--out", assoc_qt_params$base_output_filename
    )
    if (plink_options$plink_version == "1.7") {
      args <- c(args, "--noweb")
    }
    if (plink_options$plink_version == "1.9") {
      args <- c(args, "--allow-extra-chr", "--chr-set", 95)
    }
    return(args)
  }
  if (plinkr::is_plink_bin_filenames(assoc_qt_params$data)) {
    testthat::expect_true(
      plink_options$plink_version %in% plinkr::get_plink1_versions()
    )
    args <- c(
      "--bed", assoc_qt_params$data$bed_filename,
      "--bim", assoc_qt_params$data$bim_filename,
      "--fam", assoc_qt_params$data$fam_filename,
      "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
      "--all-pheno",
      "--assoc",
      "--maf", assoc_qt_params$maf,
      "--out", assoc_qt_params$base_output_filename
    )
    if (plink_options$plink_version == "1.7") {
      args <- c(args, "--noweb")
    }
    if (plink_options$plink_version == "1.9") {
      args <- c(args, "--allow-extra-chr", "--chr-set", 95)
    }
    return(args)
  }
  testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_qt_params$data))
  testthat::expect_true(
    plink_options$plink_version %in% plinkr::get_plink2_versions()
  )
  return(
    c(
      "--pgen", assoc_qt_params$data$pgen_filename,
      "--psam", assoc_qt_params$data$psam_filename,
      "--pvar", assoc_qt_params$data$pvar_filename,
      "--glm",
      "--pheno", paste0(assoc_qt_params$base_input_filename, ".phe"),
      "--allow-extra-chr",
      "--chr-set", 95,
      "--maf", assoc_qt_params$maf,
      "--out", assoc_qt_params$base_output_filename
    )
  )
}
