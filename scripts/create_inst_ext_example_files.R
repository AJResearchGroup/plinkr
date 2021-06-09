# Create the example files in the inst/extdata folder
set.seed(314)
assoc_params <- create_demo_assoc_params()
save_map_table_to_file(
  map_table = assoc_params$map_table,
  file.path(system.file("extdata", package = "plinkr"), "demo_assoc.map")
)
save_ped_table_to_file(
  ped_table = assoc_params$ped_table,
  file.path(system.file("extdata", package = "plinkr"), "demo_assoc.ped")
)

set.seed(314)
assoc_qt_params <- create_demo_assoc_qt_params()
save_map_table_to_file(
  map_table = assoc_qt_params$map_table,
  file.path(system.file("extdata", package = "plinkr"), "demo_assoc_qt.map")
)
save_ped_table_to_file(
  ped_table = assoc_qt_params$ped_table,
  file.path(system.file("extdata", package = "plinkr"), "demo_assoc_qt.ped")
)
save_phenotype_table_to_file(
  phenotype_table = assoc_qt_params$phenotype_table,
  phenotype_filename = file.path(system.file("extdata", package = "plinkr"), "demo_assoc_qt.phenotype")
)
