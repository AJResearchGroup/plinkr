# Random scribbles
assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    get_random_trait(maf = 0.01),
    get_random_trait(maf = 0.10),
    get_random_trait(maf = 0.25)
  ),
  n_individuals = 1000
)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    create_additive_trait(),
    create_random_trait()
  ),
  n_individuals = 1000
)

list(
    create_additive_trait(),
    create_random_trait()
)
assoc_qt_params <- create_demo_assoc_qt_params(
  traits = create_additive_trait(),
  n_individuals = 1000
)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = create_random_trait(),
  n_individuals = 1000
)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = create_trait("random"),
  n_individuals = 1000
)



assoc_qt_params <- create_demo_assoc_qt_params(
  mafs = c(0.01, 0.1, 0.25),
  phenotypes = rep("random", 3),
  n_individuals = 1000
)
x <- assoc_qt_params$ped_table
assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
assoc_qt_results




assoc_qt_params <- create_demo_assoc_qt_params(
  phenotypes = rep("random", 3),
  n_individuals = 1000
)


# Ca
assoc_qt_params <- create_demo_assoc_qt_params(
  phenotypes = rep("random", 3)
)
assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
assoc_qt_results


assoc_qt_params <- create_demo_assoc_qt_params()
assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
assoc_qt_results


assoc_qt_params <- create_demo_assoc_qt_params(
  phenotypes = get_phenotypes()
)
assoc_qt_results <- assoc_qt(assoc_qt_params = assoc_qt_params)
assoc_qt_results

# Future

#assoc_qt_params <- create_demo_assoc_qt_params(
#  genetic_setups = c("random", "additive")
#)
