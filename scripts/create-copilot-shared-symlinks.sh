#!/usr/bin/env bash
set -euo pipefail

for source_file in .github/copilot-shared/instructions/*.md; do
  target_file=".github/$(basename "$source_file")"
  ln -sfn "./copilot-shared/instructions/$(basename "$source_file")" "$target_file"
done

ln -sfn ./copilot-shared/skills .github/skills
