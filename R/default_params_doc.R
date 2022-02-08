#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param add_noweb add the \code{--noweb} option, which prevents
#' that \code{PLINK} will check if it is in its latest version.
#' By default, this value is set to true,
#' hence \link{plinkr} will skip this check.
#' Use \link{get_plink_version} to get the current \code{PLINK} version.
#' @param args arguments for the `PLINK` or `PLINK2` executable.
#' Use \link{check_plink_args} to check if these are valid
#' @param assoc_adjusted_filename name of a \code{PLINK}
#' \code{.assoc.adjusted} file.
#' Use \link{read_plink_assoc_adjusted_file}
#' to read a \code{PLINK} \code{.assoc.adjusted} file.
#' @param assoc_filename name of a \code{PLINK} \code{.assoc} file.
#' Use \link{read_plink_assoc_file} to read a \code{PLINK} \code{.assoc} file.
#' @param assoc_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc}),
#' as can be created by \link{create_assoc_params}
#' @param assoc_qt_covar_data data to do an association analysis
#' for a quantitative trait with covariates
#' (i.e. using \link{assoc_qt_covar}),
#' as can be created by \link{create_assoc_qt_covar_data}
#' @param assoc_qt_covar_params parameters to do an association analysis
#' for a quantitative trait with covariates
#' (i.e. using \link{assoc_qt_covar}),
#' as can be created by \link{create_assoc_qt_covar_params}
#' @param assoc_qt_data data use to used by \link{assoc_qt}
#' (as created by \link{create_assoc_qt_data}),
#' which equals 'regular' data (see \link{check_data}) and a
#' phenotype table/file
#' @param assoc_qt_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc_qt}),
#' as can be created by \link{create_assoc_qt_params}
#' @param assoc_qt_result the result of \link{assoc_qt},
#' which is a \link{list} with elements:
#'
#'  * `qassoc_table`: the quantitative analysis results table,
#'    as can be checked by \link{check_qassoc_table}
#'  * `log`: the text from the log file created by `PLINK`/`PLINK2`
#'    when doing \link{assoc_qt}
#' @param assoc_table the table that hold the result of a
#' case-control association, as created by `PLINK`/`PLINK2`
#' and stored as a \code{.assoc} file (for `PLINK`) or
#' `[basename].<phenotype>.[?TODO].linear` (for `PLINK2`).
#' @param base_input_filename the base of the filenames that are
#' used as input for \code{PLINK}/\code{PLINK2}
#' @param base_output_filename the base of the filenames that are
#' used as output for \code{PLINK}/\code{PLINK2}
#' @param base_output_plink1_filename temporary folder to create the `PLINK`
#' binary files in
#' @param base_output_plink2_filename temporary folder to create the `PLINK2`
#' binary files in
#' @param base_phenotype_value the base phenotypic value for an additive trait,
#' i.e. the phenotypic value for homozygotes of the common allele
#' @param bed_filename name of a \code{PLINK} \code{.bed} file
#' Use \link{read_plink_bed_file} to read a \code{PLINK} \code{.bed} file.
#' @param bed_table a table that maps the SNPs to the individuals,
#' of which the column names are the names of the individuals,
#' the row names are the names of the SNPs,
#' and the values are the SNP variant.
#' Use \link{get_test_bed_table} to get a \code{.bed} table as used in testing.
#' Use \link{read_plink_bed_file} to read a \code{PLINK} \code{.bed} file.
#' Use \link{check_bed_table} to test if a `.bed` table is valid.
#' See also the `bed` file format reference at
#' \url{https://www.cog-genomics.org/plink2/formats#bed}
#' @param bfile the base filename of the binary files (i.e.
#' a \code{.bed}, \code{.bim} and \code{.fam} file).
#' This parameter is named after the \code{PLINK}
#' \code{--bfile} flag
#' @param bim_filename name of a \code{PLINK} \code{.bim} file
#' Use \link{read_plink_bim_file} to read a \code{PLINK} \code{.bim} file.
#' @param bim_table a tibble of the genetic mapping,
#' with as many rows as SNPs.
#'
#' Each row contains:
#'  * `chr`: the chromosome number
#'  * `id`: the SNP ID
#'  * `posg`: the position
#'  * `pos`: the position
#'  * `ref`: something
#'  * `alt`: something
#'
#' Use \link{get_test_bim_table} to get a \code{.bim} table as used in testing.
#' Use \link{read_plink_bim_file} to read a \code{PLINK} \code{.bim} file.
#' Use \link{check_bim_table} to test if a `.bim` table is valid.
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
#' @param cov_table a table of covariates.
#'
#' A \code{cov_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
#'   * One or more columns of covariate values,
#'     columns can have any name
#'
#' These names match the PLINK column
#' names (\url{https://www.cog-genomics.org/plink/1.9/input#pheno}).
#' Use \link{read_plink_cov_file} to read a covariates file.
#' Use \link{check_cov_table} to test if a covariates table is valid.
#' @param cov_filename name of a covariates (\code{.cov}) file.
#' Use \link{read_plink_cov_file} to read a covariates file.
#' @param data the data source, which can be:
#'
#'  * PLINK text data, as created by \link{create_plink_text_data}.
#'  * PLINK binary data, as created by \link{create_plink_bin_data}.
#'  * PLINK2 binary data, as created by \link{create_plink2_bin_data}.
#'  * PLINK text filenames, as created by \link{create_plink_text_filenames}.
#'  * PLINK binary filenames, as created by \link{create_plink_bin_filenames}.
#'  * PLINK2 binary filenames, as created by \link{create_plink2_bin_filenames}.
#'
#' @param epistatic_phenotype_value the phenotypic value when the
#' epistatic phenotype is expressed
#' @param example_filename name of the example file
#' @param fam_filename name of a \code{PLINK} \code{.fam} file
#' Use \link{read_plink_fam_file} to read a \code{PLINK} \code{.fam} file.
#' @param fam_table a tibble of the genetic mapping,
#' with as many rows as SNPs.
#'
#' Each row contains:
#'  * `fam`: the family ID
#'  * `id`: the individual's ID
#'  * `pat`: ID of father
#'  * `mat`: ID of mother
#'  * `sex`: the gender
#'  * `pheno`: a phenotype
#'
#' Use \link{get_test_fam_table} to get a \code{.fam} table as used in testing.
#' Use \link{read_plink_fam_file} to read a \code{PLINK} \code{.fam} file.
#' Use \link{check_fam_table} to test if a `.fam` table is valid.
#' @param fid the family ID, which is called `FID` in `PLINK`.
#' Use \link{check_fid} to check if a `fid` is valid.
#' @param fids one or more family IDs (which are called `FID`s in `PLINK`).
#' Use \link{check_fids} to check if the elements of `fids` are valid.
#' @param frq_filename name of a \code{PLINK} \code{.frq} file
#' Use \link{read_plink_frq_file} to read a \code{PLINK} \code{.frq} file.
#' @param frq_strat_filename name of a \code{PLINK} \code{.frq.strat} file
#' Use \link{read_plink_frq_strat_file}
#' to read a \code{PLINK} \code{.frq.strat} file.
#' @param iid a within-family ID, as can be checked by \link{check_iid}
#' @param iids one or more within-family IDs,
#' as can be checked by \link{check_iids}
#' @param imiss_filename name of a \code{PLINK} \code{.imiss} file
#' Use \link{read_plink_imiss_file} to read a \code{PLINK} \code{.imiss} file.
#' @param ld_window_r2 the minimal squared correlation coefficient (also
#' known as `r^2`) between markers. This parameter is named after the
#' `--ld_window_r2` flag, as documented at
#' \url{https://www.cog-genomics.org/plink/1.9/ld}.
#' @param lmiss_filename name of a \code{PLINK} \code{.lmiss} file
#' Use \link{read_plink_lmiss_file} to read a \code{PLINK} \code{.lmiss} file.
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
#'  * \code{CHR}: the chromosome code or contig name.
#'    The chromosome number cannot exceed 95
#'    (\url{https://www.cog-genomics.org/plink/1.9/input#chr_set})
#'  * \code{SNP}: Variant identifier
#'  * \code{position_cm}: Position in morgans or centimorgans.
#'      This value is optional. Zeroes denote it is unused
#'  * \code{BP}: Base-pair coordinat
#'
#' Use \link{read_plink_map_file} to read a \code{PLINK} \code{.map} file.
#' Use \link{check_map_table} to test if a genetic mapping table is valid.
#' @param n_individuals the number of individuals.
#' Use \link{check_n_individuals} to check if this is a valid value
#' @param n_phenotypes the number of phenotypes
#' @param n_snps the number of SNPs
#' @param n_snps_per_phenotype the number of SNPs that determine one phenotype
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param out the base filename of the output files.
#' This parameter is named after the \code{PLINK}
#' \code{--out} flag
#' @param ped_filename name of a \code{PLINK} \code{.ped} file.
#' Use \link{read_plink_ped_file} to read a \code{PLINK} \code{.ped} file.
#' @param ped_table a 'pedigree' table.
#'
#' A \code{ped_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
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
#' The \code{FID} and \code{IID} column names match the PLINK names, see
#' \url{https://www.cog-genomics.org/plink/1.9/input#pheno}.
#'
#' Use \link{read_plink_ped_file} to read a \code{PLINK} \code{.ped} file.
#' Use \link{check_ped_table} to test if a pedigree table is valid.
#' @param pgen_filename name of a `PLINK2` `.pgen` file
#' Use \link{read_plink2_pgen_file} to read a `PLINK2` `.pgen` file
#' @param pgen_table an \link{array} that maps the individuals
#'   to their SNPs, with as much rows as individuals, and as much
#'   SNPs as columns. Optionally, the row names are the individuals' IDs,
#'   where the column names are the SNP ID's
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
#' @param phe_filename name of a phenotype (\code{.phe}) file,
#' as checked by \link{check_phe_filename}.
#' Use \link{read_plink_phe_file} to read a raw phenotype file.
#' @param phenotype_increase the phenotypic value increase per rare allele,
#' for an additive trait.
#' @param phe_table a table of phenotypes.
#'
#' A \code{phe_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
#'   * One or more columns of phenotype values,
#'     columns can have any name
#'
#' These names match the PLINK column
#' names (\url{https://www.cog-genomics.org/plink/1.9/input#pheno}).
#' Use \link{read_plink_phe_file} to read a phenotype file.
#' Use \link{check_phe_table} to test if a phenotype table is valid.
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
#' @param phenotype_data phenotype data in the form of either
#' a filename to a phenotype file (`phenotype_data_filename`)
#' or a list with a phenotype table (`phenotype_data_table`)
#' @param phenotype_data_filename phenotype data
#' (as checked by \link{check_phenotype_data}))
#' in the form of a \link{list} with a filename to a phenotype table
#' @param phenotype_data_table phenotype data
#' (as checked by \link{check_phenotype_data}))
#' in the form of a \link{list} with an in-memory phenotype table
#' @param phenotype_value_dominant phenotypic value
#' for the dominant variant, i.e. that genotype that has at least one
#' version of the common common allele
#' @param phenotype_value_recessive phenotypic value
#' for the recessive variant, i.e. that genotype that is homozygous for the
#' rare allele
#' @param plink_bin_data the in-memory binary data for `PLINK` to work on,
#' as created by \link{create_plink_bin_data}.
#' @param plink_bin_filenames the binary data files' names for `PLINK`
#' to work on,
#' as created by \link{create_plink_bin_filenames}.
#' @param plink_exe_path path to
#'   the \code{PLINK} or \code{PLINK2} executable file.
#' @param plink_folder folder where \code{PLINK} is installed
#' @param plink_options options to run PLINK,
#' as created by \link{create_plink_options}
#' @param plink1_options the `PLINK` version,
#' as created by \link{create_plink_options},
#' for any version of `PLINK`
#' @param plink2_options the `PLINK2` version,
#' as created by \link{create_plink_options},
#' for any version of `PLINK2`
#' @param plink_optionses a list of one or more options to run PLINK,
#' as created by \link{create_plink_optionses}.
#' The reduplicated plural was used to express this is a list
#' of \code{plink_options}, instead of one set of \code{plink_options}
#' @param plink_text_data the genetic and phenotypic data for `PLINK` to work
#' on, in `PLINK` text format, as created by \link{create_plink_text_data}.
#' @param plink_text_filenames the text data files' names for `PLINK`
#' to work on,
#' as created by \link{create_plink_text_filenames}.
#' @param plink_version version of PLINK, e.g. \code{"1.7"}
#' Use \link{get_plink_version} to get the \code{PLINK} version.
#' Use \link{get_plink_versions} to get all the supported \code{PLINK} versions.
#' @param plink_versions one or more versions of PLINK,
#' e.g. as can be obtained using \link{get_plink_versions}
#' @param plink2_bin_data the genetic and phenotypic data for `PLINK2` to work
#' on, in `PLINK2` binary format, as created by \link{create_plink2_bin_data}.
#' @param plink2_bin_filenames the binary data files' names for `PLINK2`
#' to work on,
#' as created by \link{create_plink2_bin_filenames}.
#' @param plinkr_folder name of the folder where \link{plinkr}
#' stores its temporary files
#' @param psam_filename name of a `PLINK2` `.psam` file
#' Use \link{read_plink2_psam_file} to read a `PLINK2` `.psam` file
#' @param psam_table a \link[tibble]{tibble} with as much rows as
#' individuals. It has the following columns:
#'
#'  * `FID`: the family ID
#'  * `IID`: the within-family ID
#'  * `SEX`: the sex
#'  * `PHENO1`: a phenotypic value
#'
#' The uppercase column names are those as used by PLINK2.
#' @param pvar_filename name of a `PLINK2` `.pvar` file
#' Use \link{read_plink2_pvar_file} to read a `PLINK2` `.pvar` file
#' @param pvar_table  a \link[tibble]{tibble} with as much rows as
#' SNPs. It has the following columns:
#'
#'  * `CHROM`: the chromosome
#'  * `POS`: the position on the chromosome
#'  * `ID`: the SNP ID
#'  * `REF`: the reference variant
#'  * `ALT`: the alternate variant
#'
#' The uppercase column names are those as used by PLINK2.
#' @param qassoc_filename name of a \code{PLINK} \code{.qassoc} file
#' Use \link{read_plink_qassoc_file} to read a \code{PLINK} \code{.qassoc} file.
#' @param qassoc_filenames name of one or more
#' \code{PLINK} \code{.qassoc} files.
#' Use \link{read_plink_qassoc_files} to read one or more
#' \code{PLINK} \code{.qassoc} files.
#' @param qassoc_table the table that hold the result of an association
#' with a quantitative trait, as created by `PLINK`/`PLINK2`
#' and stored as a \code{.qassoc} file (for `PLINK`) or
#' `[basename].<phenotype>.glm.linear` (for `PLINK2`).
#' @param regular_phenotype_value the regular phenotypic value
#' @param sample_ids sample IDs, which is a \link[tibble]{tibble}
#' with two columns: the first column holds the family ID
#' (called `fid` or `FID` by PLINK/PLINK2),
#' the second column holds the within-family ID
#' (called `iid` or `IID` by PLINK/PLINK2),
#' as can be checked by \link{check_sample_ids}
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
#' @param temp_folder temporary folder to store results in
#' @param temp_sim_filename temporary file to store simulation
#'   parameters, which is a \code{PLINK} \code{.sim} file
#' @param trait one trait with a clear genetic architecture and a known
#' minor allele frequency, as created by \link{create_trait}.
#' Use \link{is_one_trait} to detect if something is one trait
#' @param traits one or more traits
#' with a clear genetic architecture and a known minor allele frequency,
#' as, for example, created by \link{create_demo_traits}.
#' @param url \code{PLINK} download URL
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link{check_verbose} to detect if this argument is valid.
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  add_noweb,
  args,
  assoc_adjusted_filename,
  assoc_filename,
  assoc_params,
  assoc_qt_covar_data,
  assoc_qt_covar_params,
  assoc_qt_data,
  assoc_qt_params,
  assoc_qt_result,
  assoc_table,
  base_input_filename,
  base_output_filename,
  base_output_plink1_filename,
  base_output_plink2_filename,
  base_phenotype_value,
  bed_filename,
  bed_table,
  bfile,
  bim_filename,
  bim_table,
  calc_phenotype_function,
  confidence_interval,
  cov_filename,
  cov_table,
  data,
  epistatic_phenotype_value,
  example_filename,
  fam_filename,
  fam_table,
  fid,
  fids,
  frq_filename,
  frq_strat_filename,
  iid,
  iids,
  ld_window_r2,
  imiss_filename,
  lmiss_filename,
  log_filename,
  maf,
  mafs,
  map_filename,
  map_table,
  n_individuals,
  n_phenotypes,
  n_snps,
  n_snps_per_phenotype,
  os,
  out,
  ped_filename,
  ped_table,
  pgen_filename,
  pgen_table,
  phenotype,
  phe_filename,
  phenotype_increase,
  phe_table,
  phenotypes,
  phenotype_data,
  phenotype_data_filename,
  phenotype_data_table,
  phenotype_value_dominant,
  phenotype_value_recessive,
  plink_bin_data,
  plink_bin_filenames,
  plink_exe_path,
  plink_folder,
  plink_options,
  plink1_options,
  plink2_options,
  plink_optionses,
  plink_text_data,
  plink_text_filenames,
  plink_version,
  plink_versions,
  plinkr_folder,
  plink2_bin_data,
  plink2_bin_filenames,
  psam_filename,
  psam_table,
  pvar_filename,
  pvar_table,
  qassoc_filename,
  qassoc_filenames,
  qassoc_table,
  regular_phenotype_value,
  sample_ids,
  sim_filename,
  simfreq_filename,
  simulate_qt_params,
  snvs,
  temp_folder,
  temp_sim_filename,
  trait,
  traits,
  url,
  verbose
) {
  # Nothing
}
