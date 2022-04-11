#' Checks that the `snp` is valid
#'
#' Checks that the `snp` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_snp("rs1234")
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp <- function(snp) {
  if (length(snp) != 1) {
    stop(
      "'snp' must be one string. \n",
      "length(snp): ", length(snp)
    )
  }
  pattern <- "^([[:alnum:]]|_)+$"
  if (
    !stringr::str_detect(
      string = snp,
      pattern = pattern
    )
  ) {
    stop(
      "'snp' must match regex '", pattern, "' \n",
      "snp: ", snp
    )
  }
}
