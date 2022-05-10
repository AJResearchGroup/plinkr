test_that("use", {
  skip("#46")
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_text_filenames(
      map_filename = "/media/richel/D2B40C93B40C7BEB/drosophila/genotype.map",
      ped_filename = "/media/richel/D2B40C93B40C7BEB/drosophila/genotype.map"
    ),
    phenotype_data = create_phenotype_data_filename(
      phe_filename = "/media/richel/D2B40C93B40C7BEB/drosophila/phenotypes.pheno"
    )
  )
  assoc_qt_data <- select_samples(
    data = assoc_qt_data,
    sample_selector = create_random_samples_selector(1000)
  )
})
