#' Read one or more `PLINK2` files that are created by \link{assoc_qt}
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink2_qassoc_files <- function(qassoc_filenames) {
  qassocs <- list()
  for (i in seq_along(qassoc_filenames)) {
    if (file.exists(qassoc_filenames[i])) {
      qassocs[[i]] <- plinkr::read_plink2_qassoc_file(qassoc_filenames[i])
    } else {
      # create an empty tibble
      qassocs[[i]] <- tibble::tibble(
        CHROM = 0.0,
        POS = 0.0,
        ID = "",
        REF = "",
        ALT = "",
        A1 = "",
        TEST = "",
        OBS_CT = 0.0,
        BETA = 0.0,
        SE = 0.0,
        T_STAT = 0.0,
        P = 0.0
      )
    }
    # From PLINK2:
    #
    # Results written to
    # /home/richel/.cache/plinkr/filea1bf11dda19e/assoc_output.<phenotypename>.glm.linear # nolint indeed long
    #
    qassocs[[i]]$PHENO <- stringr::str_match(
      qassoc_filenames[i],
      ".*\\.([^\\.]+)\\.glm\\.linear"
    )[1, 2]
  }
  qassoc <- dplyr::bind_rows(qassocs)
  qassoc
}
