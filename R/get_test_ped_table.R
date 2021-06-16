#' Get a simple pedigree (\code{.ped}) table.
#'
#' Get a simple pedigree (\code{.ped}) table,
#' as can be used in testing.
#' This is the same table as can be obtained by reading
#' the PLINK v1.7 example file called \code{test.ped}.
#' @return a pedigree (\code{.ped}) table
#' @note The function has the word \code{get} in its name,
#' as getting the result is trivial. When getting the result is non-trivial,
#' the word \code{create} is used.
#' @seealso use \link{create_demo_ped_table} to get simulated
#' pedigree tables
#' @examples
#' get_test_ped_table()
#'
#' # Get the pedigree from the original PLINK v1.7 example file
#' if (is_plink_installed(create_plink_v1_7_options())) {
#'   ped_filename <- get_plink_example_filename(
#'     example_filename = "test.ped",
#'     create_plink_v1_7_options()
#'   )
#'   read_plink_ped_file(ped_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_ped_table <- function() {
  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  tibble::tribble(
    ~FID      , ~IID             , ~within_family_id_father, ~within_family_id_mother, ~sex_code, ~case_control_code, ~snv_1a, ~snv_1b, ~snv_2a, ~snv_2b, # nolint indeed a long line
    1         , 1                , 0                       , 0                       , 1        , 1                 , "A"    , "A"    , "G"    , "T"    , # nolint indeed a long line
    2         , 1                , 0                       , 0                       , 1        , 1                 , "A"    , "C"    , "T"    , "G"    , # nolint indeed a long line
    3         , 1                , 0                       , 0                       , 1        , 1                 , "C"    , "C"    , "G"    , "G"    , # nolint indeed a long line
    4         , 1                , 0                       , 0                       , 1        , 2                 , "A"    , "C"    , "T"    , "T"    , # nolint indeed a long line
    5         , 1                , 0                       , 0                       , 1        , 2                 , "C"    , "C"    , "G"    , "T"    , # nolint indeed a long line
    6         , 1                , 0                       , 0                       , 1        , 2                 , "C"    , "C"    , "T"    , "T"      # nolint indeed a long line
  )
}
