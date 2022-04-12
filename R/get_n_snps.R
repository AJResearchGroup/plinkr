#' Get the number of SNPs from a table
#'
#' Get the number of SNPs from a table
#' @param table a table
#' @return the number of SNPs
#' @seealso
#' To obtain the number of SNPs/variants for a specific table:
#'
#'  * \link{get_n_snps_from_bed_table} for a `.bed` table
#'  * \link{get_n_snps_from_bim_table} for a `.bim` table
#'  * \link{get_n_snps_from_map_table} for a `.map` table
#'  * \link{get_n_snps_from_ped_table} for a `.ped` table
#'  * \link{get_n_snps_from_pgen_table} for a `.pgen` table
#'  * \link{get_n_snps_from_pvar_table} for a `.pvar` table
#'
#' @export
get_n_snps <- function(table) {
  # First try class
  if (inherits(table, "pgen_table")) {
    return(plinkr::get_n_snps_from_pgen_table(pgen_table = table))
  }

  if (plinkr::is_bed_table(table)) {
    return(plinkr::get_n_snps_from_bed_table(bed_table = table))
  }
  if (plinkr::is_bim_table(table)) {
    return(plinkr::get_n_snps_from_bim_table(bim_table = table))
  }
  if (plinkr::is_map_table(table)) {
    return(plinkr::get_n_snps_from_map_table(map_table = table))
  }
  if (plinkr::is_ped_table(table)) {
    return(plinkr::get_n_snps_from_ped_table(ped_table = table))
  }
  if (plinkr::is_pgen_table(table)) {
    # This will never be reached: a .pgen table is identified similar
    # as a .bed file, hence the use of classes
    return(plinkr::get_n_snps_from_pgen_table(pgen_table = table))
  }
  if (plinkr::is_pvar_table(table)) {
    return(plinkr::get_n_snps_from_pvar_table(pvar_table = table))
  }
  stop("Unimplemented table in 'get_n_snps'")
}

#' Get the number of SNPs from a `.bed` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_bed_table <- function(bed_table) {
  plinkr::check_bed_table(bed_table)
  nrow(bed_table)
}

#' Get the number of SNPs from a `.bim` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_bim_table <- function(bim_table) {
  plinkr::check_bim_table(bim_table)
  nrow(bim_table)
}

#' Get the number of SNPs from a `.map` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_map_table <- function(map_table) {
  plinkr::check_map_table(map_table)
  nrow(map_table)
}

#' Get the number of SNPs from a `.ped` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_ped_table <- function(ped_table) {
  plinkr::check_ped_table(ped_table)
  (ncol(ped_table) - 6) / 2
}

#' Get the number of SNPs from a `.pgen` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_pgen_table <- function(pgen_table) {
  plinkr::check_pgen_table(pgen_table)
  ncol(pgen_table)
}

#' Get the number of SNPs from a `.pvar` table
#' @inheritParams default_params_doc
#' @return the number of SNPs
#' @export
get_n_snps_from_pvar_table <- function(pvar_table) {
  plinkr::check_pvar_table(pvar_table)
  nrow(pvar_table)
}
