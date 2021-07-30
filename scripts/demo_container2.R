library(plinkr)
plink_optionses <- create_plink_optionses()
assoc(
  assoc_params = create_demo_assoc_params(),
  plink_options = plink_optionses[[2]]
)

