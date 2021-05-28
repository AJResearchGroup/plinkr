#' Check if the \code{assoc_params} are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_params <- function(assoc_params) {
  testthat::expect_true(is.list(assoc_params))
  testthat::expect_true("ped_table" %in% names(assoc_params))
  testthat::expect_true("map_table" %in% names(assoc_params))
  testthat::expect_true("maf" %in% names(assoc_params))
  testthat::expect_silent(plinkr::check_ped_table(assoc_params$ped_table))
  testthat::expect_silent(plinkr::check_map_table(assoc_params$map_table))
  testthat::expect_silent(plinkr::check_maf(assoc_params$maf))

  # This will actually work
  plinkr::check_equal_number_of_snvs(assoc_params)

  testthat::expect_true(
    all(
      assoc_params$ped_table$case_control_code %in% c(1, 2)
    )
  )

}
