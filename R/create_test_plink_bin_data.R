#' Create a set of `PLINK` binary data to be used in testing
#' @examples
#' create_test_plink_bin_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink_bin_data <- function() {
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("gcaer_issue_2_bin.bed")
  )
  plink_bin_data <- plinkr::read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  plink_bin_data
}
