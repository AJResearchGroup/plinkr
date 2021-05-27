# Random scribbles
assoc_qt_params <- create_demo_assoc_qt_params(
  traits = create_random_trait(mafs = c(0.3, 0.2)),
  n_individuals = 1000
)
assoc_qt_params <- create_demo_assoc_qt_params(
  traits = create_random_trait(mafs = c(0.3, 0.2, 0.1)),
  n_individuals = 1000
)
assoc_qt(assoc_qt_params)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    get_random_trait(mafs = 0.3),
    get_random_trait(mafs = c(0.3, 0.2)),
    get_random_trait(mafs = 0.4)
  ),
  n_individuals = 1000
)


assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    get_random_trait(maf = 0.01),
    get_random_trait(maf = 0.10),
    get_random_trait(maf = 0.25)
  ),
  n_individuals = 1000
)
