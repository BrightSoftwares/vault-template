#!/usr/bin/env python3
"""
serves_mapping_report.py

Steering Pack module — builds a coverage report showing which Waypoints
(defined in .NORTHSTAR. notes) have active .PRJ. / .AREA. notes pointed at
them via a `Serves:` frontmatter field, and which don't.

This script is deliberately dependency-free (Python standard library only)
and takes the vault root as an explicit argument rather than assuming a
fixed location, so it works unmodified on any vault it's dropped into (see
this template's `AI_INSTRUCTIONS.md` and the Steering Pack guide for the
portability rule this follows).

Usage:
    python3 scripts/serves_mapping_report.py --vault-root /path/to/vault
    python3 scripts/serves_mapping_report.py --vault-root . --out reports/serves-mapping.md

Exit code is always 0 (this is a reporting tool, not a validation gate) —
pipe its output or read the file it writes.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

# Matches a Waypoint definition line in a .NORTHSTAR. note's "## Waypoints"
# section, e.g.:
#   - **W1 — First productized revenue stream live.** At least one ...
WAYPOINT_LINE_RE = re.compile(
    r"^\s*-\s*\*\*(?P<id>W\d+)\s*[—–-]\s*(?P<title>[^*]+?)\.?\*\*", re.MULTILINE
)

# Matches a `Serves:` frontmatter field, tolerating quotes or their absence:
#   Serves: "W1"
#   Serves: W1
SERVES_FIELD_RE = re.compile(r'^Serves:\s*"?([A-Za-z0-9_-]+)"?\s*$', re.MULTILINE)

FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---\n", re.DOTALL)


def find_files(vault_root: Path, marker: str) -> list[Path]:
    """Return every .md file under vault_root whose filename contains marker
    (e.g. ".NORTHSTAR.", ".PRJ.", ".AREA."), skipping .git and dist/."""
    results = []
    for path in vault_root.rglob("*.md"):
        if any(part in (".git", "dist") for part in path.parts):
            continue
        if marker in path.name:
            results.append(path)
    return sorted(results)


def extract_waypoints(northstar_files: list[Path]) -> dict[str, tuple[str, Path]]:
    """Return {waypoint_id: (title, source_file)} across all North Star notes."""
    waypoints: dict[str, tuple[str, Path]] = {}
    for f in northstar_files:
        text = f.read_text(encoding="utf-8", errors="replace")
        for m in WAYPOINT_LINE_RE.finditer(text):
            wid = m.group("id")
            title = m.group("title").strip()
            waypoints[wid] = (title, f)
    return waypoints


def extract_serves(files: list[Path]) -> dict[Path, str | None]:
    """Return {file: waypoint_id_or_None} for every PRJ/AREA file."""
    result: dict[Path, str | None] = {}
    for f in files:
        text = f.read_text(encoding="utf-8", errors="replace")
        fm_match = FRONTMATTER_RE.match(text)
        frontmatter = fm_match.group(1) if fm_match else ""
        serves_match = SERVES_FIELD_RE.search(frontmatter)
        result[f] = serves_match.group(1) if serves_match else None
    return result


def build_report(vault_root: Path) -> str:
    northstar_files = find_files(vault_root, ".NORTHSTAR.")
    prj_areas = find_files(vault_root, ".PRJ.") + find_files(vault_root, ".AREA.")
    waypoints = extract_waypoints(northstar_files)
    serves = extract_serves(prj_areas)

    lines: list[str] = []
    lines.append("# Serves-Mapping Report")
    lines.append("")
    lines.append(
        f"North Star notes scanned: {len(northstar_files)} · "
        f"Waypoints found: {len(waypoints)} · "
        f"Project/Area notes scanned: {len(prj_areas)}"
    )
    lines.append("")

    if not waypoints:
        lines.append(
            "No Waypoints found. Add a `.NORTHSTAR.` note with a `## Waypoints` "
            "section (see `templates/13.TMPLT.northstar.north-star-and-waypoints-template.md`)."
        )
        return "\n".join(lines) + "\n"

    rel = lambda p: p.relative_to(vault_root).as_posix()

    lines.append("## Coverage by Waypoint")
    lines.append("")
    unknown_refs: list[tuple[Path, str]] = []
    for wid, (title, source) in sorted(waypoints.items()):
        linked = [f for f, w in serves.items() if w == wid]
        lines.append(f"### {wid} — {title}")
        lines.append(f"_Defined in `{rel(source)}`_")
        if linked:
            for f in sorted(linked):
                lines.append(f"- `{rel(f)}`")
        else:
            lines.append("- (nothing currently serves this Waypoint)")
        lines.append("")

    for f, wid in serves.items():
        if wid is not None and wid not in waypoints:
            unknown_refs.append((f, wid))

    if unknown_refs:
        lines.append("## Warnings — `Serves:` points at an unknown Waypoint ID")
        lines.append("")
        for f, wid in sorted(unknown_refs):
            lines.append(f"- `{rel(f)}` declares `Serves: \"{wid}\"`, which no North Star note defines")
        lines.append("")

    unserved = [f for f, w in serves.items() if w is None]
    lines.append("## Not serving any Waypoint")
    lines.append("")
    lines.append(
        "_Not automatically a problem — plenty of maintenance work doesn't need to "
        "serve a Waypoint. Shown for visibility, not as a to-do list._"
    )
    lines.append("")
    if unserved:
        for f in sorted(unserved):
            lines.append(f"- `{rel(f)}`")
    else:
        lines.append("- (every scanned Project/Area note declares a `Serves:` field)")
    lines.append("")

    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--vault-root",
        required=True,
        help="Path to the vault root to scan (portable — no hardcoded paths).",
    )
    parser.add_argument(
        "--out",
        default=None,
        help="Optional file path to write the report to. Prints to stdout if omitted.",
    )
    args = parser.parse_args()

    vault_root = Path(args.vault_root).resolve()
    if not vault_root.is_dir():
        raise SystemExit(f"ERROR: --vault-root '{vault_root}' is not a directory.")

    report = build_report(vault_root)

    if args.out:
        out_path = Path(args.out)
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(report, encoding="utf-8")
        print(f"Wrote report to {out_path}")
    else:
        print(report)


if __name__ == "__main__":
    main()
