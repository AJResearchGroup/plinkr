#' Compare speed when using \link{assoc_qt} for one `assoc_qt_params`
#' for (one or) multiple versions of `PLINK`/`PLINK2`
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
compare_assoc_qt_speed <- function(
  n_individuals = 5,
  n_phenotypes = 3,
  n_snps_per_phenotype = 4,
  plink_optionses = create_plink_optionses(),
  verbose = FALSE
) {
  if (verbose) {
    message(
      Sys.time(), ": simulating data for ", n_individuals, " individuals, ",
      n_phenotypes, " phenotypes and ", n_snps_per_phenotype,
      " SNPS per phenotype"
    )
  }
  assoc_qt_params <- plinkr::create_demo_assoc_qt_params(
    n_individuals = n_individuals,
    traits = rep(
      list(plinkr::create_random_trait(n_snps = n_snps_per_phenotype)),
      times = n_phenotypes
    )
  )
  assoc_qt_params$data$map_table$CHR <- 1 # nolint PLINK2 variable naming

  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_optionses(plink_optionses)

  if (verbose) {
    message(Sys.time(), ": converting the data")
  }

  testthat::expect_true(plinkr::is_plink_text_data(assoc_qt_params$data))
  plink_text_data <- assoc_qt_params$data
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )

  #
  base_output_plink1_filename <- plinkr::get_plinkr_tempfilename(
    pattern = "convert_plink_text_data_to_plink2_bin_data", fileext = ""
  )
  base_output_plink2_filename <- plinkr::get_plinkr_tempfilename(
    pattern = "convert_plink_text_data_to_plink2_bin_data", fileext = ""
  )
  plink2_bin_data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data,
    base_output_plink1_filename = base_output_plink1_filename,
    base_output_plink2_filename = base_output_plink2_filename
  )
  testthat::expect_silent(check_plink_text_data(plink_text_data))
  testthat::expect_silent(check_plink_bin_data(plink_bin_data))
  testthat::expect_silent(check_plink2_bin_data(plink2_bin_data))

  if (verbose) {
    message(Sys.time(), ": saving the data to file")
  }
  plink_text_filenames <- save_plink_text_data(plink_text_data)
  plink_bin_filenames <- save_plink_bin_data(plink_bin_data)
  plink2_bin_filenames <- save_plink2_bin_data(plink2_bin_data)
  save_phe_table(
    assoc_qt_params$phe_table,
    phe_filename = paste0(assoc_qt_params$base_input_filename, ".phe")
  )
  testthat::expect_silent(check_plink_text_filenames(plink_text_filenames))
  testthat::expect_silent(check_plink_bin_filenames(plink_bin_filenames))
  testthat::expect_silent(check_plink2_bin_filenames(plink2_bin_filenames))

  datas <- list(
    plink_text_filenames,
    plink_bin_filenames,
    plink2_bin_filenames
  )

  times <- tidyr::expand_grid(
    data = datas,
    data_type = NA,
    plink_options = plink_optionses,
    plink_version = NA,
    time_sec = NA
  )
  for (i in seq_len(nrow(times))) {
    times$data_type[i] <- plinkr::get_data_description(times$data[[i]])
    times$plink_version[i] <- times$plink_options[[i]]$plink_version
    if (verbose) {
    message(
        Sys.time(), ": #", i,
        " for data ", times$data_type[i],
        " for PLINK ", times$plink_version[i]
      )
    }
    if (
      can_plink_version_and_data_can_work_together(
        data = times$data[[i]],
        plink_options = times$plink_options[[i]],
        verbose = verbose
      )
    ) {
      assoc_qt_params$data <- times$data[[i]]
      start_time <- Sys.time()
      assoc_qt_result_plink_text <- assoc_qt(
        assoc_qt_params = assoc_qt_params,
        plink_options = times$plink_options[[i]],
        verbose = verbose
      )
      end_time <- Sys.time()
      times$time_sec[i] <- end_time - start_time
    }
  }
  times$data <- NULL
  times$plink_options <- NULL

  # Cleanup
  file.remove(plink_text_filenames$map_filename)
  file.remove(plink_text_filenames$ped_filename)
  file.remove(plink_bin_filenames$bed_filename)
  file.remove(plink_bin_filenames$bim_filename)
  file.remove(plink_bin_filenames$fam_filename)
  file.remove(plink2_bin_filenames$pgen_filename)
  file.remove(plink2_bin_filenames$psam_filename)
  file.remove(plink2_bin_filenames$pvar_filename)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)
  unlink(dirname(base_output_plink2_filename), recursive = TRUE)
  unlink(dirname(base_output_plink2_filename), recursive = TRUE)

  base_output_plink1_filename
  times
}
