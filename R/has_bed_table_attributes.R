#' Determine if the table has the attributes of a `bed_table`
#'
#' Determine if the table has the attributes of a `bed_table`
#' @param table a table
#' @return TRUE if the table has the attributes of a `bed_table`
#' @author Richèl J.C. Bilderbeek
#' @export
has_bed_table_attributes <- function(table) {
  "plinkr_datatype" %in% names(attributes(table)) &&
    attributes(table)$plinkr_datatype == "bed_table"
}
