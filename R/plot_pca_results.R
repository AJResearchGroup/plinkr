#' Plot the result of a call to \link{pca}
#'
#' Plot the result of a call to \link{pca}.
#'
#' This will show the first two components of a principal
#' component analysis.
#' The x axis shows the first principal component,
#' The y axis shows the second.
#' The axes' labels show how percent of the variants is explained
#' by that principal component
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot2}
#' @examples
#' plot_pca_results(create_test_pca_result_filenames())
#' @author Richèl J.C. Bilderbeek
#' @export
plot_pca_results <- function(pca_result_filenames) {
  plinkr::check_pca_result_filenames(pca_result_filenames)
  eigenval_table <- plinkr::read_plink_eigenval_file(
    pca_result_filenames$eigenval_filename
  )
  relative_eigenvalues <- eigenval_table$eigenval /
    sum(eigenval_table$eigenval)

  eigenvec_table <- plinkr::read_plink_eigenvec_file(
    pca_result_filenames$eigenvec_filename
  )
  scale_x_name <- paste0("PC 1 (", round(100.0 * relative_eigenvalues[1], digits = 2), "%)")
  scale_y_name <- paste0("PC 2 (", round(100.0 * relative_eigenvalues[2], digits = 2), "%)")
  ggplot2::ggplot(
    eigenvec_table,
    ggplot2::aes(x = pc_1, y = pc_2)
  ) + ggplot2::geom_point() +
    ggplot2::scale_x_continuous(name = scale_x_name) +
    ggplot2::scale_y_continuous(name = scale_y_name)
}
