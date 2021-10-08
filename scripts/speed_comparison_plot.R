t <- readr::read_csv(
  file = "speed_comparison.csv",
  col_types = readr::cols(
    data_type = readr::col_character(),
    plink_version = readr::col_character(),
    time_sec = readr::col_double(),
    n_invididuals = readr::col_double(),
    n_phenotypes = readr::col_double(),
    n_snps_per_phenotype= readr::col_double()
  )
)

names(t)
library(dplyr)
# Per
u <- t %>%
  dplyr::filter(!is.na(time_sec)) %>%
  dplyr::group_by(n_invididuals, n_phenotypes, n_snps_per_phenotype) %>%
  dplyr::filter(time_sec == min(time_sec)) %>%
  dplyr::ungroup()


u$n_invididuals_log_10 <- log10(u$n_invididuals)
u$n_phenotypes_log_10 <- log10(u$n_phenotypes)
u$n_snps_per_phenotype_log_10 <- log10(u$n_snps_per_phenotype)
versions_to_colors <- function(versions) {
  colors <- rep(NA, length(versions))
  colors[versions == "1.7"] <- "blue"
  colors[versions == "1.9"] <- "green"
  colors[versions == "2.0"] <- "red"
  testthat::expect_equal(0, sum(is.na(colors)))
  colors
}
u$color <- versions_to_colors(u$plink_version)
u$cex <- u$n_invididuals_log_10 + u$n_phenotypes_log_10 + u$n_snps_per_phenotype_log_10

if (1 == 1) {
  plot3D::scatter3D(
    x = u$n_invididuals_log_10,
    y = u$n_phenotypes_log_10,
    z = u$n_snps_per_phenotype_log_10,
    colvar = NULL,
    col = u$color,
    cex = 1 + (u$cex / 5.0),
    pch = 19,
    bty = "b2", # g, b2, bl
    xlab = "\nn_individiduals\n(log10)",
    ylab = "\nn_phenotypes\n(log10)",
    zlab = "\nn_snps_per_phenotype\n(log10)"
  )
  # X-axis: n_invididuals_log_10
  x_values <- unique(u$n_invididuals_log_10)
  y_values <- rep(min(u$n_phenotypes_log_10), times = length(x_values))
  z_values <- rep(min(u$n_snps_per_phenotype_log_10), times = length(x_values))
  plot3D::text3D(
    x = x_values,
    y = y_values,
    z = z_values,
    labels = x_values,
    add = TRUE,
    adj = -1.0
  )
  # Y-axis: n_phenotypes_log_10
  y_values <- unique(u$n_phenotypes_log_10)
  x_values <- rep(min(u$n_invididuals_log_10), times = length(y_values))
  z_values <- rep(min(u$n_snps_per_phenotype_log_10), times = length(y_values))
  plot3D::text3D(
    x = x_values,
    y = y_values,
    z = z_values,
    labels = y_values,
    add = TRUE,
    adj = -1.0
  )
  # Z-axis: n_snps_per_phenotype_log_10
  z_values <- unique(u$n_snps_per_phenotype_log_10)
  y_values <- rep(min(u$n_phenotypes_log_10), times = length(z_values))
  x_values <- rep(min(u$n_invididuals_log_10), times = length(z_values))
  plot3D::text3D(
    x = x_values,
    y = y_values,
    z = z_values,
    labels = z_values,
    add = TRUE,
    adj = -1.0
  )
}


if (1 == 2) {

  library(rgl)
  x <- u$n_invididuals_log_10
  y <- u$n_phenotypes_log_10
  z <- u$n_snps_per_phenotype_log_10
  identityMatrix()

  r3dDefaults$material$fog <- TRUE
  r3dDefaults$bg$fogtype <- "linear"

  r3dDefaults$material$fog <- FALSE
  r3dDefaults$bg$fogtype <- "linear"

  plot3d(x, y, z, type="s", col="red", xlab="x", ylab="y", zlab="z", site=5, lwd=15, col = u$plink_version)
  # c3d <- cube3d(
  #   trans = rgl::translate3d(
  #     scale3d(
  #       identityMatrix(),
  #       x = 1,
  #       y = 1,
  #       z = 1.5
  #     ),
  #     x = 2,
  #     y = 1,
  #     z = 1.5
  #   ),
  #   color = "red",
  #   alpha = 0.1
  # )
  # c3d   # Look at structure
  # shade3d(c3d)   # render the object





  open3d()
  x <- rnorm(100)
  y <- rnorm(100)
  z <- rep(c(1.0, 2, 3), 33)
  plot3d(x, y, z, type = "s", col = "red", size = 1)

  # coefs <- coef(fit)
  # a <- coefs["x"]
  # b <- coefs["y"]
  # c <- -1
  # d <- coefs["(Intercept)"]
  planes3d(0, 0, 1, 0, alpha = 0.5)

  open3d()
  ids <- plot3d(x, y, z, type = "s", col = "red", size = 1, forceClipregion = TRUE)
  oldid <- useSubscene3d(ids["clipregion"])
  clipplanes3d(a, b, c, d)
  useSubscene3d(oldid)
}
