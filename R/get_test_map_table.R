#' Get a simple genetic mapping (\code{.map}) table
#'
#' Get a simple genetic mapping (\code{.map}) table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the PLINK v1.7 example file called \code{test.map}.
#' @return a mapping (\code{.map}) table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @seealso use \link{create_demo_map_table} to get simulated
#' genetic mapping tables
#' @examples
#' get_test_map_table()
#'
#' # Get the genetic map from the original PLINK v1.7 example file
#' if (is_plink_installed(create_plink_v1_7_options())) {
#'   map_filename <- get_plink_example_filename(
#'     example_filename = "test.map",
#'     create_plink_v1_7_options()
#'   )
#'   read_plink_map_file(map_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_map_table <- function() {
  tibble::tribble(
    ~CHR, ~SNP  , ~position_cm, ~BP, # nolint keep spaces to align content
    1   , "snp1", 0           , 1  , # nolint keep spaces to align content
    1   , "snp2", 0           , 2    # nolint keep spaces to align content
  )
}
