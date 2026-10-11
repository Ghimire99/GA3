#!/bin/bash
set -euo pipefail

input_file="$1"
line_number="$2"

head -n "$line_number" "$input_file" | tail -n 1
