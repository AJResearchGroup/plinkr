#' Create a set of `PLINK2` binary data to be used in testing
#' @examples
#' create_test_plink2_bin_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink2_bin_data <- function() {
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed_after_make-pgen.pgen")
  )
  plinkr::read_plink2_bin_data(
    base_input_filename = base_input_filename
  )
}
