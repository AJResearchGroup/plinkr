#' Determine if the table has the attributes of a `pgen_table`
#'
#' Determine if the table has the attributes of a `pgen_table`
#' @inheritParams default_params_doc
#' @return TRUE if the table has the attributes of a `pgen_table`
#' @author Richèl J.C. Bilderbeek
#' @export
has_pgen_table_attributes <- function(table) {
  "plinkr_datatype" %in% names(attributes(table)) &&
    attributes(table)$plinkr_datatype == "pgen_table"
}
