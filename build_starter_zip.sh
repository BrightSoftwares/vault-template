#!/usr/bin/env bash
#
# build_starter_zip.sh
#
# Packages this repository (the PARA + Johnny Decimal Vault Template — Starter
# Edition) into a single distributable zip file: the folder tree, all ten
# templates, the fictional Brightline Studio demo project files, the Quick
# Start guide, and the license.
#
# Output: dist/vault-template-starter-edition.zip (git-ignored — the zip
# binary itself is never committed to this repository; only this script and
# the source files it packages are version-controlled).
#
# Usage:
#   ./build_starter_zip.sh
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="${REPO_ROOT}/dist"
ZIP_NAME="vault-template-starter-edition.zip"
STAGE_DIR="$(mktemp -d)"
STAGE_NAME="vault-template-starter-edition"

cleanup() {
  rm -rf "${STAGE_DIR}"
}
trap cleanup EXIT

echo "Staging files..."
mkdir -p "${STAGE_DIR}/${STAGE_NAME}"

# Copy everything tracked by git, excluding .git itself, dist/, and this
# script's own build artifacts — mirrors what's actually version-controlled
# rather than whatever happens to be sitting in the working directory.
cd "${REPO_ROOT}"
git ls-files -z | xargs -0 -I{} bash -c 'mkdir -p "$1/$(dirname "{}")" && cp "{}" "$1/{}"' _ "${STAGE_DIR}/${STAGE_NAME}"

echo "Building zip..."
mkdir -p "${DIST_DIR}"
rm -f "${DIST_DIR}/${ZIP_NAME}"
( cd "${STAGE_DIR}" && zip -rq "${DIST_DIR}/${ZIP_NAME}" "${STAGE_NAME}" )

echo "Done: ${DIST_DIR}/${ZIP_NAME}"
