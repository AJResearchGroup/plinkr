#' \code{plinkr}: An R interface to \code{PLINK}.
#'
#' \code{plinkr} is an R interface to \code{PLINK}.
#'
#' \code{plinkr} allows the user to install, run and uninstall
#' (multiple versions of) \code{PLINK}.
#' Also PLINK output files can be read, modified within R
#' and saved to PLINK-conforming files
#'
#' @examples
#' if (is_plink_installed()) {
#'
#'   # Use the PLINK v1.9 example files
#'   ped_filename <- get_plink_example_filename("toy.ped")
#'   map_filename <- get_plink_example_filename("toy.map")
#'
#'   # Do a case-control association
#'   run_plink(
#'     args = c(
#'      "--ped", ped_filename,
#'      "--map", map_filename
#'     )
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name plinkr
NULL
