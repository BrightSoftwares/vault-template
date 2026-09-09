#!/usr/bin/env bash
#
# build_starter_zip.sh
#
# Packages the Starter Edition of this template — the folder tree, the ten
# BASE templates, the fictional Brightline Studio demo project files, the
# Quick Start guide, and the license — into a single distributable zip.
#
# This edition contains ONLY the files listed below (see MODULES.md for the
# full module -> edition map). Add-on module content (Business OS, Steering
# Pack, and any future module) lives in this same repository but is
# deliberately excluded here — use build_solopreneur_zip.sh (or a future
# build_<edition>_zip.sh) for a bundle that includes it.
#
# Output: dist/vault-template-starter-edition.zip (git-ignored — only this
# script and the source files it packages are version-controlled).
#
# Usage:
#   ./build_starter_zip.sh
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib_build_zip.sh
source "${REPO_ROOT}/scripts/lib_build_zip.sh"
# shellcheck source=scripts/manifest_base.sh
source "${REPO_ROOT}/scripts/manifest_base.sh"

stage_and_zip "starter" "${BASE_FILES[@]}"
