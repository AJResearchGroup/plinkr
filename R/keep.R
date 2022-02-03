#' Filter `PLINK` and `PLINK2` data on their family ID
#'
#' @note this function is named after the `PLINK`/`PLINK2` `--Keep`
#' parameter flag
#' @inheritParams default_params_doc
#' @return the names of the files created
#' @author Richèl J.C. Bilderbeek
#' @export
keep <- function(
  base_input_filename,
  sample_ids,
  plink_options = create_plink_v1_9_options(),
  temp_folder = plinkr::get_plinkr_tempfilename(),
  sample_ids_filename = file.path(temp_folder, "sample_ids.txt"),
  verbose = FALSE
) {
  plinkr::check_sample_ids(sample_ids)
  readr::write_delim(sample_ids, sample_ids_filename)

  # /home/richel/.local/share/plinkr/plink_1_9_unix/plink --bfile toy_data --keep sample_ids.txt --make-bed --out tmp # nolint indeed long
  args <- c(
    "--keep"
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
}
