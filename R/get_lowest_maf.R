#' Get the lowest non-zero value for a minor allelle frequency (MAF).
#'
#' Get the lowest non-zero value for a minor allelle frequency (MAF),
#' which is the lowest representable non-zero floating-point value,
#' also known as \code{.Machine$double.xmin} (see \link{.Machine})
#' @examples
#' get_lowest_maf()
#' @author Richèl J.C. Bilderbeek
#' @export
get_lowest_maf <- function() {
  .Machine$double.xmin
}
