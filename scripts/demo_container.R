library(plinkr)
plink_optionses <- create_plink_optionses(plink_folder = "/opt/plinkr")
assoc(
  assoc_data = create_demo_assoc_data(),
  assoc_params = create_test_assoc_params(),
  plink_options = plink_optionses[[2]]
)

