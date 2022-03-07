#' Read a `PLINK2` `.pgen` file
#' @inheritParams default_params_doc
#' @param names_loci see \link[genio]{read_bed}
#' @param names_ind see \link[genio]{read_bed}
#' @return a `.pgen` table
#' @seealso use \link{read_plink2_pgen_file_from_files} to read
#' a `PLINK2` `.pgen` file with column and rownames obtained from
#' the two other `PLINK2` data files
#' @examples
#' pgen_filename <- get_plinkr_filename(
#'   "test_v1_7_after_make-bed_after_make-pgen.pgen"
#' )
#' read_plink2_pgen_file(
#'   pgen_filename = pgen_filename,
#'   names_loci = paste0("snp_", 1:2),
#'   names_ind = paste0("person_", letters[1:6])
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
 read_plink2_pgen_file <- function(
  pgen_filename,
  names_loci,
  names_ind,
  verbose = FALSE
) {
   pgen <- pgenlibr::NewPgen(pgen_filename)
   pgen_table <- pgenlibr::ReadList(
     pgen = pgen,
     variant_subset = 1:pgenlibr::GetVariantCt(pgen)
   )
   pgen_array <- as.array(pgen_table)
   colnames(pgen_array) <- names_loci
   rownames(pgen_array) <- names_ind

   my_attributes <- attributes(pgen_array)
   my_attributes$plink_data_type <- "pgen_table"
   attributes(pgen_array) <- my_attributes

   pgen_array
}
