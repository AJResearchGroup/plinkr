#' Get a testing mapping (\code{.map}) table
#' @return a mapping (\code{.map}) table
#' @export
get_test_map_table <- function() {
  tibble::tribble(
    ~CHR, ~SNP  , ~position_cm, ~BP, # nolint keep spaces to align content
    1   , "snp1", 0           , 1  , # nolint keep spaces to align content
    1   , "snp2", 0           , 2    # nolint keep spaces to align content
  )
}
