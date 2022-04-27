#' Select samples/individuals
#'
#' Select samples/individuals from data
#' @inheritParams default_params_doc
#' @return a `plink_bin_data` (see \link{check_plink_bin_data})
#' @seealso
#' To select SNPs, use \link{select_snps}
#'
#' There are multiple sample selector checking functions,
#' see \link{create_samples_selector} for an overview
#' @export
#' @examples
#' if (is_plink_installed()) {
#'   # Use PLINK files
#'   plink_bin_filenames <- create_plink_bin_filenames(
#'     bed_filename = get_plinkr_filename("select_snps.bed"),
#'     bim_filename = get_plinkr_filename("select_snps.bim"),
#'     fam_filename = get_plinkr_filename("select_snps.fam")
#'   )
#'
#'   # Select a single sample
#'   single_sample_selector <- create_single_sample_selector(
#'     fid = "C",
#'     iid = "1"
#'   )
#'   plink_bin_data <- select_samples(
#'     data = plink_bin_filenames,
#'     sample_selector = single_sample_selector
#'   )
#'
#'   # Select 2 random samples
#'   random_samples_selector <- create_random_samples_selector(
#'     n_samples = 2
#'   )
#'   plink_bin_data <- select_samples(
#'     data = plink_bin_filenames,
#'     sample_selector = random_samples_selector
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
select_samples <- function(
  data,
  sample_selector,
  sample_ids_filename = plinkr::get_plinkr_tempfilename(
    pattern = "sample_ids_",
    fileext = ".txt"
  ),
  base_output_filename = plinkr::get_plinkr_tempfilename(),
  plink_options = plinkr::create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_data(data)
  plinkr::check_sample_selector(sample_selector)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  if (plinkr::is_plink_bin_filenames(data)) {
    args <- plinkr::create_select_samples_args(
      plink_bin_filenames = data,
      sample_selector = sample_selector,
      sample_ids_filename = sample_ids_filename,
      base_output_filename = base_output_filename,
      plink_options = plink_options
    )
    sample_ids <- plinkr::create_selected_sample_ids(
      plink_bin_filenames = data,
      sample_selector = sample_selector
    )
    plinkr::save_sample_ids(
      sample_ids = sample_ids,
      sample_ids_filename = sample_ids_filename
    )
    dir.create(
      dirname(base_output_filename),
      recursive = TRUE,
      showWarnings = FALSE
    )
    plinkr::run_plink(
      args = args,
      plink_options = plink_options,
      verbose = verbose
    )
    file.remove(sample_ids_filename)
    new_data <- plinkr::read_plink_bin_data(
      base_input_filename = base_output_filename
    )
    if (verbose) {
      message(
        "Create selected sample at files with basename ", base_output_filename
      )
    }
    file.remove(paste0(base_output_filename, ".bed"))
    file.remove(paste0(base_output_filename, ".bim"))
    file.remove(paste0(base_output_filename, ".fam"))
    file.remove(paste0(base_output_filename, ".log"))
    return(new_data)
  } else if (plinkr::is_plink_bin_data(data)) {
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = data,
      base_input_filename = base_output_filename
    )
    if (verbose) {
      message(
        "Saved in-memory data to files: \n * ",
        paste0(plink_bin_filenames, collapse = "\n * ")
      )
    }
    base_output_filename_2 <- plinkr::get_plinkr_tempfilename()
    new_data <- plinkr::select_samples(
      data = plink_bin_filenames,
      sample_selector = sample_selector,
      base_output_filename = base_output_filename_2,
      plink_options = plink_options,
      verbose = verbose
    )
    file.remove(unlist(plink_bin_filenames))
    return(new_data)
  } else {
    stop("Unimplemented type of 'data'")
  }
}
