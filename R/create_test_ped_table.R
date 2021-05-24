#' Create a test \code{.ped} table
#' @return a \code{.ped} table
#' @export
create_test_ped_table <- function() {
  plinkr::read_plink_ped_file(
    ped_filename = plinkr::get_plink_example_filename("test.ped")
  )
}
