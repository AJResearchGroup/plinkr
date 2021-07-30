#!/bin/bash
#
# Build the Singularity container called `plinkr2.sif`
# from the Singularity recipe `Singularity2`
#
# Usage:
#
# ./scripts/build_singularity_container2.sh
#
#
sudo -E singularity build plinkr2.sif Singularity2
