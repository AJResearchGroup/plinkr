#' Create a demo genetic mapping \code{.map} table
#'
#' Create a demo genetic mapping \code{.map} table.
#' It is simply a map of SNPs that are located on different chromosomes.
#' @inheritParams default_params_doc
#' @export
create_demo_map_table <- function(n_snps = 16) {
  tibble::tibble(
    CHR = seq_len(n_snps),
    SNP = paste0("snp_", seq_len(n_snps)),
    position_cm = rep(0, n_snps),
    BP = seq_len(n_snps)
  )
}
