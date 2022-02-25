#!/bin/bash
# --cleanenv: recommened by tsnowlan at https://stackoverflow.com/a/71252619
# --bind $PWD/scripts/ : bind the folder, so that it works on GitHub Actions as well
singularity run --cleanenv --bind $PWD/scripts/ plinkr.sif scripts/demo_container.R

