#' Compare speed when using \link{assoc_qt} for one `assoc_qt_params`
#' for (one or) multiple versions of `PLINK`/`PLINK2`
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
compare_assoc_qt_speed <- function(
  assoc_qt_params,
  plink_optionses = create_plink_optionses(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_optionses(plink_optionses)

  # Convert the data
  testthat::expect_true(plinkr::is_plink_text_data(assoc_qt_params$data))
  plink_text_data <- assoc_qt_params$data
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  plink2_bin_data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  testthat::expect_silent(check_plink_text_data(plink_text_data))
  testthat::expect_silent(check_plink_bin_data(plink_bin_data))
  testthat::expect_silent(check_plink2_bin_data(plink2_bin_data))

  # Save the data
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
        "#", i,
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
  times
}
