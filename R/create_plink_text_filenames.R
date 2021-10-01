#' Create a `plink_text_filenames`
#'
#' Create a `plink_text_filenames`,
#' which is a list of `PLINK` text filenames
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'
#'  * `map_filename`: the `.map` filename
#'  * `ped_filename`: the `.ped` filename
#' @seealso `plinkr` has the following functions to create sets of filenames,
#' depending on the data:
#'
#'  * `PLINK` text files: use \link{create_plink_text_filenames}
#'  * `PLINK` binary files: use \link{create_plink_bin_filenames}
#'  * `PLINK2` binary files: use \link{create_plink2_bin_filenames}
#'
#' @examples
#' create_plink_text_filenames(
#'   map_filename = "file.map",
#'   ped_filename = "file.ped"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_text_filenames <- function(
  map_filename,
  ped_filename
) {
  plink_text_filenames <- list(
    map_filename = map_filename,
    ped_filename = ped_filename
  )
  plinkr::check_plink_text_filenames(plink_text_filenames)
  plink_text_filenames
}
