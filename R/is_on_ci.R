#' Determines if the environment is AppVeyor
#' @return \link{TRUE} if run on AppVeyor, \link{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   if (is_on_appveyor()) {
#'     message("Running on AppVeyor")
#'   }
#' @export
is_on_appveyor <- function() {
  Sys.getenv("APPVEYOR") != ""
}

#' Determines if the environment is GitHub Actions
#' @return \link{TRUE} if run on GitHub Actions, \link{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   if (is_on_github_actions()) {
#'     message("Running on GitHub Actions")
#'   }
#' @export
is_on_github_actions <- function() {
  Sys.getenv("GITHUB_ACTIONS") != ""
}

#' Determines if the environment is Travis CI
#' @return \link{TRUE} if run on Travis CI, \link{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   if (is_on_ci()) {
#'     message("Running on Travis CI")
#'   }
#' @export
is_on_travis <- function() {
  Sys.getenv("TRAVIS") != ""
}

#' Determines if the environment is a continuous integration service
#' @return \link{TRUE} if run on AppVeyor or Travis CI, \link{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   if (is_on_ci()) {
#'     message("Running on a continuous integration service")
#'   }
#' @export
is_on_ci <- function() {
  plinkr::is_on_appveyor() ||
  plinkr::is_on_github_actions() ||
  plinkr::is_on_travis()
}
