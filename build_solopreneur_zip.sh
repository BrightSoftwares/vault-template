#!/usr/bin/env bash
#
# build_solopreneur_zip.sh
#
# Packages the Solopreneur Edition of this template: every Starter/BASE file
# plus the Business OS module (M1) and the Steering Pack module (M6) — see
# MODULES.md for the full module map.
#
# Output: dist/vault-template-solopreneur-edition.zip (git-ignored — only
# this script and the source files it packages are version-controlled).
#
# Usage:
#   ./build_solopreneur_zip.sh
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib_build_zip.sh
source "${REPO_ROOT}/scripts/lib_build_zip.sh"
# shellcheck source=scripts/manifest_base.sh
source "${REPO_ROOT}/scripts/manifest_base.sh"

M1_BUSINESS_OS_FILES=(
  "20-29.Areas/21.active_areas/21.AREA.ideas-inventory.md"
  "30-39.Resources/31.business-os/31.RESOURCE.three-currencies-and-revenue-gate-guide.md"
  "30-39.Resources/31.business-os/31.COMPANY.brightline-studio-foundation.md"
  "30-39.Resources/31.business-os/31.BRAND.brightline-studio-identity.md"
  "30-39.Resources/31.business-os/31.PRODUCT.styled-recipe-shot-list-guide.md"
  "templates/10.TMPLT.company.company-foundation-template.md"
  "templates/11.TMPLT.brand.brand-identity-template.md"
  "templates/12.TMPLT.product.product-design-template.md"
)

M6_STEERING_PACK_FILES=(
  "2026-2027.NORTHSTAR.grow-brightline-studio-into-a-full-time-business.md"
  "30-39.Resources/32.steering-pack/32.RESOURCE.north-star-waypoints-and-scoreboard-guide.md"
  "Weekly_reviews/2026-W04-scoreboard.md"
  "templates/13.TMPLT.northstar.north-star-and-waypoints-template.md"
  "templates/14.TMPLT.review.weekly-scoreboard-template.md"
  "scripts/serves_mapping_report.py"
)

# Shared worked example demonstrating M1 (Revenue Path) and M6 (Serves) on
# one fictional project — belongs to the bundle as a whole, not one module.
SHARED_WORKED_EXAMPLES=(
  "10-19.Projects/11.active_projects/11.PRJ.launch-styled-recipe-shot-list-product.md"
)

SOLOPRENEUR_ONLY_FILES=(
  "SOLOPRENEUR-ADDENDUM.md"
  "build_solopreneur_zip.sh"
)

stage_and_zip "solopreneur" \
  "${BASE_FILES[@]}" \
  "${M1_BUSINESS_OS_FILES[@]}" \
  "${M6_STEERING_PACK_FILES[@]}" \
  "${SHARED_WORKED_EXAMPLES[@]}" \
  "${SOLOPRENEUR_ONLY_FILES[@]}"
