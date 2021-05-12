#' Simulate a quantitive trait
#' @export
sim_qt <- function() {

  args <- c(
    "--simulate-qt", sim_filename,
    "--simulate-n", "2"
  )
  plinkr::run_plink(args)

}
