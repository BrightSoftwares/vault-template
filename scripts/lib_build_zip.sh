#!/usr/bin/env bash
#
# lib_build_zip.sh
#
# Shared staging/zip logic for this repo's per-edition build scripts
# (build_starter_zip.sh, build_solopreneur_zip.sh, and any future
# build_<edition>_zip.sh). Not a build script itself — source it, then call
# stage_and_zip.
#
# Why explicit file lists instead of `git ls-files`: this repository ships
# ONE product line as modular add-on content in a single tree (see
# MODULES.md) — every edition after Starter contains a growing superset of
# files. Zipping "everything tracked" would leak higher-edition content into
# a lower edition's zip the moment a second module's files exist in the same
# working tree. Each build_<edition>_zip.sh must therefore pass an explicit,
# reviewed list of exactly the files that edition ships — nothing is ever
# inferred from what happens to be present in the repo.
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# stage_and_zip <edition-slug> <file-path> [<file-path> ...]
#
# Verifies every listed file exists (fails loudly, listing every missing
# path, rather than silently shipping a partial zip), stages them under a
# single top-level folder preserving their relative directory structure,
# and writes dist/vault-template-<edition-slug>-edition.zip.
stage_and_zip() {
  local edition_slug="$1"
  shift
  local files=("$@")

  if [ "${#files[@]}" -eq 0 ]; then
    echo "ERROR: no files given for edition '${edition_slug}'." >&2
    return 1
  fi

  local dist_dir="${REPO_ROOT}/dist"
  local zip_name="vault-template-${edition_slug}-edition.zip"
  local stage_dir
  stage_dir="$(mktemp -d)"
  local stage_name="vault-template-${edition_slug}-edition"

  # No EXIT trap here on purpose: a trap referencing this function's local
  # `stage_dir` would fire (if at all) after the function's scope is torn
  # down, which under `set -u` raises "unbound variable" instead of cleaning
  # up. Each caller invokes this function once and then exits, so an
  # explicit rm -rf at the end of the happy path (below) is sufficient;
  # a failed run simply leaves its stage dir in /tmp for inspection.

  echo "Verifying ${#files[@]} files for edition '${edition_slug}'..."
  local missing=0
  for f in "${files[@]}"; do
    if [ ! -e "${REPO_ROOT}/${f}" ]; then
      echo "MISSING: ${f}" >&2
      missing=1
    fi
  done
  if [ "${missing}" -eq 1 ]; then
    echo "" >&2
    echo "ERROR: one or more files listed for edition '${edition_slug}' do not exist yet." >&2
    echo "This usually means a module this edition depends on hasn't been built in this" >&2
    echo "working tree. Do not remove files from the list to work around this — build" >&2
    echo "the missing module first, or fix the file list if it's simply wrong." >&2
    return 1
  fi

  echo "Staging files..."
  mkdir -p "${stage_dir}/${stage_name}"
  cd "${REPO_ROOT}"
  for f in "${files[@]}"; do
    mkdir -p "${stage_dir}/${stage_name}/$(dirname "${f}")"
    cp "${f}" "${stage_dir}/${stage_name}/${f}"
  done

  echo "Building zip..."
  mkdir -p "${dist_dir}"
  rm -f "${dist_dir}/${zip_name}"
  ( cd "${stage_dir}" && zip -rq "${dist_dir}/${zip_name}" "${stage_name}" )
  rm -rf "${stage_dir}"

  echo "Done: ${dist_dir}/${zip_name}"
}
