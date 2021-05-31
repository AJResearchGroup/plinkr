# Random scribbles

assoc_params <- create_demo_assoc_params()
assoc(assoc_params)

create_random_trait(n_snps = 2)

assoc_qt_params <- create_demo_assoc_qt_params(
  traits = list(
    create_epistatic_trait(maf = 0.49),
    create_additive_trait(),
    create_random_trait()
  ),
  n_individuals = 100
)
assoc_qt(assoc_qt_params)
