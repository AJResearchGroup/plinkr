#' Internal function to check if the `PLINK`/`PLINK2` version can work together
#' with the data.
#'
#' Check that the `PLINK`/`PLINK2` version can work together with
#' the data (`PLINK` text data, `PLINK` binary data, `PLINK2` binary data).
#' Will \link{stop} if not
#'
#' PLINK version | data            | expected
#' --------------|-----------------|------------
#' PLINK         | PLINK1 text data| OK
#' PLINK         | PLINK1 bin data | OK
#' PLINK         | PLINK2 bin data | Error
#' PLINK2        | PLINK1 text data| Error
#' PLINK2        | PLINK1 bin data | Error
#' PLINK2        | PLINK2 bin data | OK
#
#' @export
check_plink_version_and_data_can_work_together <- function( # nolint indeed a long function name
  data,
  plink_options
) {
  plinkr::check_data(data)
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version %in% get_plink1_versions()) {
    if (plinkr::is_plink2_bin_data(data)) {
      stop(
        "PLINK cannot work with PLINK2 binary data. ",
        "Tip 1: use 'plink_options = create_plink_v2_0_options()' ",
        "to the PLINK2 instead ",
        "Tip 2: use 'convert_plink2_bin_data_to_plink_bin_data' ",
        "to convert the data to PLINK binary data ",
        "(or use 'convert_plink2_bin_data_to_plink_text_data' ",
        "to convert the data to PLINK text data). "
      )
    }
  } else {
    testthat::expect_true(
      plink_options$plink_version %in% get_plink2_versions()
    )
    if (plinkr::is_plink_text_data(data)) {
      stop(
        "PLINK2 cannot work with PLINK text data. ",
        "Tip 1: use 'plink_options = create_plink_v1_9_options()' ",
        "to the PLINK instead ",
        "Tip 2: use 'convert_plink_text_data_to_plink2_bin_data' ",
        "to convert the data to PLINK2 binary data. "
      )
    }
    if (plinkr::is_plink_bin_data(data)) {
      stop(
        "PLINK2 cannot work with PLINK binary data. ",
        "Tip 1: use 'plink_options = create_plink_v1_9_options()' ",
        "to the PLINK instead ",
        "Tip 2: use 'convert_plink_bin_data_to_plink2_bin_data' ",
        "to convert the data to PLINK2 binary data. "
      )
    }
  }
  invisible(data)
}
