#' Convert PLINK binary files to PLINK VCF files
#' @inheritParams default_params_doc
#' @return the full paths to the VCF files created
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_files_to_plink_vcf_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  # Convert to vcf
  # plink --bfile binary_fileset --recode vcf-iid --out new_vcf
  stop("TODO")
}
