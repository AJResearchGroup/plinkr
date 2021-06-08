#' Run PLINK v1.7 from arguments
#' @inheritParams default_params_doc
#' @return the text that PLINK returns
#' @examples
#' if (is_plink_installed()) {
#'
#'   run_plink_v1_7("--help")
#'
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_plink_v1_7 <- function(
  args,
  plink_options = create_plink_v1_7_options(),
  verbose = FALSE
) {
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
}
