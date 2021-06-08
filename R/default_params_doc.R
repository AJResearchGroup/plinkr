#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param add_noweb add the \code{--noweb} option, which prevents
#' that \code{PLINK} will check if it is in its latest version.
#' By default, this value is set to true,
#' hence \code{plinkr} will skip this check.
#' Use \link{get_plink_version} to get the current \code{PLINK} version.
#' @param args arguments for the \code{PLINK} executable
#' @param assoc_filename name of a \code{PLINK} \code{.assoc} file
#' Use \link{read_plink_assoc_file} to read a \code{PLINK} \code{.assoc} file.
#' @param assoc_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc}),
#' as can be created by \link{create_assoc_params}
#' @param assoc_qt_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc_qt}),
#' as can be created by \link{create_assoc_qt_params}
#' @param base_input_filename the base of the filenames that are
#' used as input for \code{PLINK}/\code{PLINK2}
#' @param base_output_filename the base of the filenames that are
#' used as output for \code{PLINK}/\code{PLINK2}
#' @param base_phenotype_value the base phenotypic value for an additive trait,
#' i.e. the phenotypic value for homozygotes of the common allele
#' @param calc_phenotype_function a function that calculate the phenotypes
#' from genotypes. The input is the genetic data as a \link[tibble]{tibble},
#' in which each row is an individual and the columns are the SNVs.
#' The first two columns are named \code{snv_1a}, \code{snv_1b} and
#' hold the genetic data for the first SNV of a diploid organism.
#' If there are more SNVs, columns continue with names,
#' \code{snv_2a}, \code{snv_2b}, \code{snv_3a}, \code{snv_3b}, etc.
#' Nucleotides are in uppercase.
#' The output must be the phenotypic values, as a numeric vector,
#' which has the same length as the number of individuals.
#' Use \link{check_calc_phenotype_function}
#' to check a \code{calc_phenotype_function}.
#' @param confidence_interval confidence interval, a value between (and
#' excluding both) 0.0 and 1.0. The confidence interval helps assess
#' the certainty of an estimation: you can be 99 percent sure
#' a value is within the range of the 0.99 confidence interval
#' @param epistatic_phenotype_value the phenotypic value when the
#' epistatic phenotype is expressed
#' @param example_filename name of the example file
#' @param log_filename name of a \code{PLINK} \code{.log} file
#' @param maf minor allele frequency threshold.
#' Alleles that have a frequency lower than the MAF
#' are excluded from the \code{PLINK} analysis.
#' \code{maf} must be a value between zero and 0.5
#' (i.e. excluding zero and excluding 0.5).
#' By default, \code{maf} is set to the lowest
#' representable non-zero floating-point value,
#' as obtained by \link{get_lowest_maf}
#'
#' The parameter name \code{maf} is named after the
#' \code{PLINK} \code{--maf} flag. This was chosen over
#' more specific names such as \code{min_allele_frequency}).
#' @param mafs one or more minor allele frequencies.
#' These allele frequencies must be ordered decreasingly,
#' i.e. the MAF is at the first position, where the
#' even rarer alleles are at the second and third positions.
#'
#' Note that \code{PLINK} cannot handle triallelic nor
#' quadallelic SNPs: \code{PLINK} will give a warning that it
#' is setting the rarest alleles to missing.
#' @param map_filename name of a \code{PLINK} \code{.map} file
#' Use \link{read_plink_map_file} to read a \code{PLINK} \code{.map} file.
#' @param map_table a genetic mapping table.
#'
#' A \code{map_table} is a \link[tibble]{tibble} with the following columns:
#'  * \code{CHR}: the chromosome code or contig name
#'  * \code{SNP}: Variant identifier
#'  * \code{position_cm}: Position in morgans or centimorgans.
#'      This value is optional. Zeroes denote it is unused
#'  * \code{BP}: Base-pair coordinat
#'
#' Use \link{read_plink_map_file} to read a \code{PLINK} \code{.map} file.
#' Use \link{check_map_table} to test if a genetic mapping table is valid.
#' @param n_individuals the number of individuals.
#' Use \link{check_n_individuals} to check if this is a valid value
#' @param n_snps the number of SNPs
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param ped_filename name of a \code{PLINK} \code{.ped} file.
#' Use \link{read_plink_ped_file} to read a \code{PLINK} \code{.ped} file.
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
#' Use \link{read_plink_ped_file} to read a \code{PLINK} \code{.ped} file.
#' Use \link{check_ped_table} to test if a pedigree table is valid.
#' @param phenotype one phenotype, named after its genetic background:
#'
#'  * \code{random} the phenotype is a random value,
#'    i.e. there is no association between the genetics and
#'    this phenotype
#'  * \code{additive} the phenotype is perfectly additive
#'    (the nucleotides used are A and T as these are in the word 'additive'):
#'    * \code{AA} 11.0
#'    * \code{AT} 10.5
#'    * \code{TT} 10.0
#' @param phenotype_filename name of a raw phenotype file.
#' Use \link{read_plink_phenotype_file} to read a raw phenotype file.
#' @param phenotype_increase the phenotypic value increase per rare allele,
#' for an additive trait.
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
#'  * \code{additive} the phenotype is perfectly additive,
#'    see \link{calc_additive_phenotype_values} for the exact calculation
#'  * \code{epistatic} the phenotype is epistatic,
#'    see \link{calc_epistatic_phenotype_values} for the exact calculation
#' @param phenotype_value_dominant phenotypic value
#' for the dominant variant, i.e. that genotype that has at least one
#' version of the common common allele
#' @param phenotype_value_recessive phenotypic value
#' for the recessive variant, i.e. that genotype that is homozygous for the
#' rare allele
#' @param plink_exe_path path to
#'   the \code{PLINK} or \code{PLINK2} executable file.
#' @param plink_folder folder where \code{PLINK} is installed
#' @param plink_options options to run PLINK,
#' as created by \link{create_plink_options}
#' @param plink_optionses a list of one or more options to run PLINK,
#' as created by \link{create_plink_optionses}.
#' The reduplicated plural was used to express this is a list
#' of \code{plink_options}, instead of one set of \code{plink_options}
#' @param plink_version version of PLINK, e.g. \code{"1.7"}
#' Use \link{get_plink_version} to get the \code{PLINK} version.
#' Use \link{get_plink_versions} to get all the supported \code{PLINK} versions.
#' @param plink_versions one or more versions of PLINK,
#' e.g. as can be obtained using \link{get_plink_versions}
#' @param qassoc_filename name of a \code{PLINK} \code{.qassoc} file
#' Use \link{read_plink_qassoc_file} to read a \code{PLINK} \code{.qassoc} file.
#' @param regular_phenotype_value the regular phenotypic value
#' @param sim_filename name of a \code{PLINK} \code{.sim} file
#' @param simfreq_filename name of a \code{PLINK} \code{.simfreq} file
#' @param simulate_qt_params the parameters for a quantitative
#'   traits simulation, as can be created by
#'   \link{create_simulate_qt_params}
#' @param snvs a \link[tibble]{tibble} that contains the
#' two nucleotide calls for multiple individuals.
#' Each column is a haplotype, hence, for a diploid organism,
#' there are two columns.
#' Each individual is represented by a row.
#' Nucleotides are in uppercase.
#' Per SNV table, there can be only two different nucleotides,
#' as this is how a SNP works; a SNP from A to C is a different one (and
#' has a different SNP ID) than a SNP that encodes a mutation
#' for A to G.
#' Use \link{create_snvs} to create a \code{snvs}.
#' @param temp_sim_filename temporary file to store simulation
#'   parameters, which is a \code{PLINK} \code{.sim} file
#' @param trait one trait with a clear genetic architecture and a known
#' minor allele frequency, as created by \link{create_trait}.
#' Use \link{is_one_trait} to detect if something is one trait
#' @param traits one or more traits
#' with a clear genetic architecture and a known minor allele frequency,
#' as, for example, created by \link{create_demo_traits}.
#' @param url \code{PLINK} download URL
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  add_noweb,
  args,
  assoc_filename,
  assoc_params,
  assoc_qt_params,
  base_input_filename,
  base_output_filename,
  base_phenotype_value,
  calc_phenotype_function,
  confidence_interval,
  epistatic_phenotype_value,
  example_filename,
  log_filename,
  maf,
  mafs,
  map_filename,
  map_table,
  n_individuals,
  n_snps,
  os,
  ped_filename,
  ped_table,
  phenotype,
  phenotype_filename,
  phenotype_increase,
  phenotype_table,
  phenotypes,
  phenotype_value_dominant,
  phenotype_value_recessive,
  plink_exe_path,
  plink_folder,
  plink_options,
  plink_optionses,
  plink_version,
  plink_versions,
  qassoc_filename,
  regular_phenotype_value,
  sim_filename,
  simfreq_filename,
  simulate_qt_params,
  snvs,
  temp_sim_filename,
  trait,
  traits,
  url,
  verbose
) {
  # Nothing
}
