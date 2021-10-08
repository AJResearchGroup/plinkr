tibbles <- list()

data <- tidyr::expand_grid(
  n_individuals = c(10, 100, 1000),
  n_phenotypes = c(1, 10, 100),
  n_snps_per_phenotype = c(1, 10, 100, 1000)
)
for (i in seq_len(nrow(data))) {
  message(Sys.time(), ": ", i, "/" ,nrow(data))
  t <- plinkr::compare_assoc_qt_speed(
    n_individuals = data$n_individuals[i],
    n_phenotypes = data$n_phenotypes[i],
    n_snps_per_phenotype = data$n_snps_per_phenotype[i]
  )
  # fastest_row_index <- which.min(t$time_sec)
  # t_best <- t[fastest_row_index, ]
  t_best <- t
  t_best$n_invididuals <- data$n_individuals[i]
  t_best$n_phenotypes <- data$n_phenotypes[i]
  t_best$n_snps_per_phenotype <- data$n_snps_per_phenotype[i]
  tibbles[[i]] <- t_best
}

t <- dplyr::bind_rows(tibbles)
t
readr::write_csv(t, "~/speed_comparison.csv")
