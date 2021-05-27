#' Get the highest value for a minor allelle frequency (MAF).
#'
#' Get the highest value for a minor allelle frequency (MAF).
#' which is the highest value possible below 0.5
#' @examples
#' get_heighest_maf()
#' @author Richèl J.C. Bilderbeek
#' @export
get_heighest_maf <- function() {
  0.5 - .Machine$double.eps
}
