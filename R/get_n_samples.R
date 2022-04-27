#' Get the number of samples from a table
#'
#' Get the number of samples from a table
#' @param table a table
#' @return the number of samples
#' @seealso
#' To obtain the number of samples/variants for a specific table:
#'
#'  * \link{get_n_samples_from_bed_table} for a `.bed` table
#'  * \link{get_n_samples_from_bim_table} for a `.bim` table
#'  * \link{get_n_samples_from_fam_table} for a `.fam` table
#'  * \link{get_n_samples_from_map_table} for a `.map` table
#'  * \link{get_n_samples_from_ped_table} for a `.ped` table
#'  * \link{get_n_samples_from_pgen_table} for a `.pgen` table
#'  * \link{get_n_samples_from_psam_table} for a `.psam` table
#'  * \link{get_n_samples_from_pvar_table} for a `.pvar` table
#'
#' @export
get_n_samples <- function(table) {
  if (has_pgen_table_attributes(table)) { # nolint this is a simple function
    return(plinkr::get_n_samples_from_pgen_table(pgen_table = table))
  }
  if (plinkr::is_bed_table(table)) {
    return(plinkr::get_n_samples_from_bed_table(bed_table = table))
  }
  if (plinkr::is_bim_table(table)) {
    return(plinkr::get_n_samples_from_bim_table(bim_table = table))
  }
  if (plinkr::is_fam_table(table)) {
    return(plinkr::get_n_samples_from_fam_table(fam_table = table))
  }
  if (plinkr::is_map_table(table)) {
    return(plinkr::get_n_samples_from_map_table(map_table = table))
  }
  if (plinkr::is_ped_table(table)) {
    return(plinkr::get_n_samples_from_ped_table(ped_table = table))
  }
  if (plinkr::is_psam_table(table)) {
    return(plinkr::get_n_samples_from_psam_table(psam_table = table))
  }
  if (plinkr::is_pvar_table(table)) {
    return(plinkr::get_n_samples_from_pvar_table(pvar_table = table))
  }
  # This will never be reached: a .pgen table is identified similar
  # as a .bed file, hence the use of classes
  testthat::expect_false(plinkr::is_pgen_table(table))
  stop("Unimplemented table in 'get_n_samples'")
}

#' Get the number of samples from a `.bed` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_bed_table <- function(bed_table) {
  plinkr::check_bed_table(bed_table)
  ncol(bed_table)
}

#' Get the number of samples from a `.bim` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_bim_table <- function(bim_table) {
  plinkr::check_bim_table(bim_table)
  stop(
    "Cannot obtain the number of samples from a .bim table: \n",
    "A .bim table contains the (number of) SNPs"
  )
}

#' Get the number of samples from a `.fam` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_fam_table <- function(fam_table) {
  plinkr::check_fam_table(fam_table)
  nrow(fam_table)
}

#' Get the number of samples from a `.map` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_map_table <- function(map_table) {
  plinkr::check_map_table(map_table)
  stop(
    "Cannot obtain the number of samples from a .map table: \n",
    "A .map table contains the (number of) SNPs"
  )
}

#' Get the number of samples from a `.ped` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_ped_table <- function(ped_table) {
  plinkr::check_ped_table(ped_table)
  nrow(ped_table)
}

#' Get the number of samples from a `.pgen` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_pgen_table <- function(pgen_table) {
  plinkr::check_pgen_table(pgen_table)
  nrow(pgen_table)
}

#' Get the number of samples from a `.psam` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_psam_table <- function(psam_table) {
  plinkr::check_psam_table(psam_table)
  nrow(psam_table)
}

#' Get the number of samples from a `.pvar` table
#' @inheritParams default_params_doc
#' @return the number of samples
#' @export
get_n_samples_from_pvar_table <- function(pvar_table) {
  plinkr::check_pvar_table(pvar_table)
  stop(
    "Cannot obtain the number of samples from a .pvar table: \n",
    "A .pvar table contains the (number of) SNPs"
  )
}
