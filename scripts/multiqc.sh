#!/bin/bash
set -euo pipefail

input_dir="$1"
output_dir="$2"

echo "Running MultiQC on $input_dir..."
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \
    multiqc "$input_dir" -o "$output_dir"
echo "MultiQC finished."

