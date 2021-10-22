#' \link{plinkr}: An R interface to \code{PLINK}.
#'
#' \link{plinkr} is an R interface to \code{PLINK}.
#'
#' \link{plinkr} allows the user to install, run and uninstall
#' (multiple versions of) \code{PLINK}.
#' Also PLINK output files can be read, modified within R
#' and saved to PLINK-conforming files
#'
#' This is a list of functions to install or uninstall
#' (multiple versions of) \code{PLINK}:
#'
#' * \link{check_plink_is_installed}:
#'   check if \code{PLINK} is installed, stop if not
#' * \link{is_plink_installed}:
#'   determine if \code{PLINK} is installed, yes/no
#' * \link{get_plink_version}:
#'   get the version of \code{PLINK}
#' * \link{install_plinks}:
#'   install \code{PLINK}s
#' * \link{uninstall_plinks}:
#'   uninstall \code{PLINK}s
#'
#' This is a list of functions to run or with with
#' (multiple versions of) \code{PLINK}:
#'
#' * \link{run_plink}: run \code{PLINK}
#'
#' This is a list of higher-level functions, that use \code{PLINK} in the back
#'
#' * \link{assoc}: do an association with a binary/case-control trait
#' * \link{assoc_qt}: do an association with a quantitative trait
#'
#' This is a list of functions to read \code{PLINK} and \code{PLINK2} files:
#'
#' * \link{read_plink_assoc_file}:
#'   read a \code{PLINK} \code{.assoc} file
#' * \link{read_plink_log_file}:
#'   read a \code{PLINK} \code{.log} file
#' * \link{read_plink_map_file}:
#'   read a \code{PLINK} \code{.map} file
#' * \link{read_plink_ped_file}:
#'   read a \code{PLINK} \code{.ped} file
#' * \link{read_plink_phe_file}:
#'   read a \code{PLINK} phenotype file
#' * \link{read_plink_qassoc_file}:
#'   read a \code{PLINK} \code{.qassoc} file
#' * \link{read_plink_simfreq_file}:
#'   read a \code{PLINK} \code{.simfreq} file
#'
#' This is a list of functions to convert \code{PLINK} and \code{PLINK2} files:
#'
#' * \link{convert_plink_bin_files_to_plink_text_files}:
#'   Convert the PLINK binary \code{.bed}, \code{.bim} and \code{.fam} files
#'   to their equivalent plain-text/non-binary \code{.map} and \code{.ped}
#'   files
#' * \link{convert_plink_text_files_to_plink_bin_files}:
#'   Convert the PLINK plain-text/non-binary \code{.map} and \code{.ped} files
#'   to their equivalent binary \code{.bed}, \code{.bim} and \code{.fam} files
#' * \link{make_bed}:
#'   Convert the (non-binary) \code{.map} and \code{.ped} files to their binary
#'   \code{.bed}, \code{.bim} and \code{.fam} equivalents
#'
#' This is a list of functions to save \code{PLINK} and \code{PLINK2} files:
#'
#' * \link{save_map_table}:
#'   save a genetic mapping table to a \code{PLINK} \code{.map} file
#' * \link{save_ped_table}:
#'   save a pedigree table to a \code{PLINK} \code{.ped} file
#' * \link{save_phe_table}:
#'   save a phenotype table to a \code{PLINK} phenotype file
#'
#' This is a list of functions to get simple/example/testing
#' files and data structures:
#'
#' * \link{create_demo_assoc_params}:
#'   create parameters to demonstrate a binary/case-control trait analysis
#' * \link{create_demo_assoc_qt_data}:
#'   create parameters to demonstrate a quantitative trait analysis
#' * \link{create_demo_map_table}:
#'   create a genetic map to demonstrate an association analysis,
#'   for both binary/case-control traits as well as quantitative trait
#' * \link{create_demo_ped_table}:
#'   create a pedigree table to demonstrate an association analysis,
#'   for both binary/case-control traits as well as quantitative trait
#' * \link{create_demo_phe_table}:
#'   create a phenotype map to demonstrate a quantitative trait analysis
#' * \link{get_plink_example_filename}:
#'   get the path to an example file as supplied by \code{PLINK}
#' * \link{get_plink_example_filenames}:
#'   get a list of example filenames supplied by \code{PLINK}
#' * \link{get_plinkr_filename}:
#'   get the path to an example file as supplied by \link{plinkr}
#' * \link{get_plinkr_filenames}:
#'   get a list of example filenames supplied by \link{plinkr}
#' * \link{get_test_map_table}:
#'   get a test genetic mapping table
#' * \link{get_test_ped_table}: get a test pedigree table
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
#'
#'   # Read the results
#'   read_plink_log_file("plink.log")
#'
#'   # Delete the created files
#'   file.remove("plink.bed")
#'   file.remove("plink.fam")
#'   file.remove("plink.log")
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name plinkr
NULL
