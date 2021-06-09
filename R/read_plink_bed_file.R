#' Read a \code{PLINK}/\code{PLINK2} \code{.bed} file
#' @inheritParams default_params_doc
#' @param names_loci see \link[genio]{read_bed}
#' @param names_ind see \link[genio]{read_bed}
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_bed_file <- function(
  bed_filename,
  names_loci,
  names_ind,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(bed_filename))
  bed_table <- genio::read_bed(
    file = bed_filename,
    names_loci = names_loci,
    names_ind = names_ind,
    verbose = verbose
  )
  bed_table
}
