#' Create a set of `plink_text_filenames` to be used in testing.
#'
#' Create a set of `plink_text_filenames` to be used in testing.
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `map_filename`: the `.map` filename
#'  * `ped_filename`: the `.ped` filename
#'
#' @seealso Use \link{create_plink_text_filenames} to creata a set
#' of `PLINK` text filenames.
#'
#' `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_test_plink_text_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink_text_filenames <- function( # nolint indeed a long function name
  map_filename = "test.map",
  ped_filename = "test.ped"
) {
  plinkr::create_plink_text_filenames(
    map_filename = map_filename,
    ped_filename = ped_filename
  )
}
