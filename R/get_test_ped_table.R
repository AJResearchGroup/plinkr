#' Get a testing pedigree (\code{.ped}) table
#' @return a pedigree (\code{.ped}) table
#' @export
get_test_ped_table <- function() {
  tibble::tribble(
    ~family_id, ~within_family_id, ~within_family_id_father, ~within_family_id_mother, ~sex_code, ~phenotype_value, ~allele_call_1a, ~allele_call_1b, ~allele_call_2a, ~allele_call_2b, # nolint indeed a long line
    1         , 1                , 0                       , 0                       , 1        , 1               , "A"            , "A"            , "G"            , "T"            , # nolint indeed a long line
    2         , 1                , 0                       , 0                       , 1        , 1               , "A"            , "C"            , "T"            , "G"            , # nolint indeed a long line
    3         , 1                , 0                       , 0                       , 1        , 1               , "C"            , "C"            , "G"            , "G"            , # nolint indeed a long line
    4         , 1                , 0                       , 0                       , 1        , 2               , "A"            , "C"            , "T"            , "T"            , # nolint indeed a long line
    5         , 1                , 0                       , 0                       , 1        , 2               , "C"            , "C"            , "G"            , "T"            , # nolint indeed a long line
    6         , 1                , 0                       , 0                       , 1        , 2               , "C"            , "C"            , "T"            , "T"              # nolint indeed a long line
  )
}
