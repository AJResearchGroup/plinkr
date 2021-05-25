#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param add_noweb add the \code{--noweb} option, which prevents
#' that PLINK will check if it is in its latest version.
#' By default, this value is set to true,
#' hence plinkr will skip this check.
#' Use \link{get_plink_version} to get the current PLINK version.
#' @param assoc_filename name of a PLINK \code{.assoc} file
#' Use \link{read_plink_assoc_file} to read a PLINK \code{.assoc} file.
#' @param assoc_qt_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc_qt}),
#' as can be created by \link{create_assoc_qt_params}
#' @param example_filename name of the example file
#' @param log_filename name of a PLINK \code{.log} file
#' @param maf minor allele frequency
#' @param map_filename name of a PLINK \code{.map} file
#' Use \link{read_plink_map_file} to read a PLINK \code{.map} file.
#' @param map_table a genetic mapping table.
#'
#' A \code{map_table} is a \link[tibble]{tibble} with the following columns:
#'  * \code{CHR}: the chromosome code or contig name
#'  * \code{SNP}: Variant identifier
#'  * \code{position_cm}: Position in morgans or centimorgans.
#'      This value is optional. Zeroes denote it is unused
#'  * \code{BP}: Base-pair coordinat
#'
#' Use \link{read_plink_map_file} to read a PLINK \code{.map} file.
#' Use \link{check_map_table} to test if a genetic mapping table is valid.
#' @param n_individuals the number of individuals
#' @param n_snps the number of SNPs
#' @param ped_filename name of a PLINK \code{.ped} file.
#' Use \link{read_plink_ped_file} to read a PLINK \code{.ped} file.
#' @param ped_table a 'pedigree' table.
#'
#' A \code{ped_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{family_id} The family ID (\code{FID})
#'   * \code{within_family_id} Within-family ID
#'       (\code{IID}, cannot be zero)
#'   * \code{within_family_id_father} Within-family ID of father
#'       (\code{0} if father isn't in dataset)
#'   * \code{within_family_id_mother} Within-family ID of mother
#'       (\code{0} if mother isn't in dataset)
#'   * \code{sex_code} Sex code
#'       (\code{1} = male, \code{2} = female, \code{0} = unknown)
#'   * \code{case_control_code} Case control code
#'       (\code{1} = control, \code{2} = case,
#'       \code{9}/\code{0}/non-numeric = missing data if case/control)
#'   * \code{snv_[x][y]} Nucleotide for the \code{x}th variant
#'     for haplotype \code{y} (\code{y} is either \code{a} or \code{b})
#'     in the \code{.map file} (\code{0} = no call)
#'
#' Use \link{read_plink_ped_file} to read a PLINK \code{.ped} file.
#' Use \link{check_ped_table} to test if a pedigree table is valid.
#' @param phenotype_filename name of a raw phenotype file.
#' Use \link{read_plink_phenotype_file} to read a raw phenotype file.
#' @param phenotype_table a table of phenotypes.
#'
#' A \code{phenotype_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{family_id} The family ID (\code{FID})
#'   * \code{within_family_id} Within-family ID
#'       (\code{IID}, cannot be zero)
#'   * One or more columns of phenotype values,
#'     columns can have any name
#'
#' Use \link{read_plink_phenotype_file} to read a phenotype file.
#' Use \link{check_phenotype_table} to test if a phenotype table is valid.
#' @param phenotypes one ore more phenotypes,
#' named after their genetic background:
#'
#'  * \code{random} the phenotype is a random value,
#'    i.e. there is no association between the genetics and
#'    this phenotype
#'  * \code{additive} the phenotype is perfectly additive
#'    (the nucleotides used are A and T as these are in the word 'additive'):
#'    * \code{AA} 1.0
#'    * \code{AT} 0.5
#'    * \code{TT} 0.0
#' @param plink_folder folder where PLINK is installed
#' @param plink_version version of PLINK, e.g. \code{"1.7"}
#' Use \link{get_plink_version} to get the PLINK version.
#' Use \link{get_plink_versions} to get all the supported PLINK versions.
#' @param plink_versions one or more versions of PLINK,
#' e.g. as can be obtained using \link{get_plink_versions}
#' @param qassoc_filename name of a PLINK \code{.qassoc} file
#' Use \link{read_plink_qassoc_file} to read a PLINK \code{.qassoc} file.
#' @param sim_filename name of a PLINK \code{.sim} file
#' @param simfreq_filename name of a PLINK \code{.simfreq} file
#' @param simulate_qt_params the parameters for a quantitative
#'   traits simulation, as can be created by
#'   \link{create_simulate_qt_params}
#' @param snvs a \link[tibble]{tibble} that contains the
#' two nucleotide calls for multiple individuals.
#' Each column is a haplotypes, hence, for a diploid organism,
#' there are two columns.
#' Each individual is represented by a row.
#' Nucleotides are in uppercase.
#' Per SNV table, there can be only two different nucleotides,
#' as this is how a SNP works; a SNP from A to C is a different one (and
#' has a different SNP ID) than a SNP that encodes a mutation
#' for A to G.
#' @param temp_sim_filename temporary file to store simulation
#'   parameters, which is a PLINK \code{.sim} file
#' @param url PLINK download URL
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  add_noweb,
  assoc_filename,
  assoc_qt_params,
  example_filename,
  log_filename,
  maf,
  map_filename,
  map_table,
  n_individuals,
  n_snps,
  ped_filename,
  ped_table,
  phenotype_filename,
  phenotype_table,
  phenotypes,
  plink_folder,
  plink_version,
  plink_versions,
  qassoc_filename,
  sim_filename,
  simfreq_filename,
  simulate_qt_params,
  snvs,
  temp_sim_filename,
  url,
  verbose
) {
  # Nothing
}
