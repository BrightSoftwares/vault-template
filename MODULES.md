# Modules & Editions

This is one product line, shipped as one base plus add-on modules — not four separate products. This file is the map between "what's a module" and "what's in the box for the edition I bought."

## Modules

| Module | Contents | Ships in |
|---|---|---|
| **BASE — Starter** | Folder tree, four core templates (`.PRJ.`/`.AREA.`/`.GOAL.`/`.TMPLT.`), six day-to-day templates, task syntax, `QUICKSTART.md`, the fictional Brightline Studio demo project | Every edition |
| **M1 — Business OS** | Three-currencies + revenue-gate guide, `.COMPANY.`/`.BRAND.`/`.PRODUCT.` component-file templates, the ideas-inventory pattern | Solopreneur, AI-Autopilot |
| **M6 — Steering Pack** | North Star & Waypoints pattern, the `Serves::` field, weekly scoreboard template, `serves_mapping_report.py` | Solopreneur, AI-Autopilot |
| M2 — Rule of Life | *Not yet built* | Faith & Family |
| M3 — Automation Core | *Not yet built* | AI-Autopilot |
| M4 — AI Copilot | *Not yet built* | AI-Autopilot |
| M5 — Migration Kit | *Not yet built* | Import & Organize |

## Editions (bundles)

| Edition | Modules | Build script |
|---|---|---|
| **Starter** | BASE | `./build_starter_zip.sh` |
| **Solopreneur** | BASE + M1 + M6 | `./build_solopreneur_zip.sh` |
| Faith & Family | BASE + M2 | *not yet buildable — M2 not built* |
| AI-Autopilot | BASE + M1 + M3 + M4 + M6 | *not yet buildable — M3/M4 not built* |

## How packaging works

Each `build_<edition>_zip.sh` script at the repository root lists, explicitly, exactly the files that edition ships — never "everything currently in the repository." This matters because all modules live in this same working tree (see the rationale above and in `scripts/lib_build_zip.sh`): as new modules are added here over time, only a script that names its own files stays correct without needing to be re-audited every time. When you build a future edition, write its own `build_<edition>_zip.sh` following the same pattern — don't extend an existing edition's file list to cover a different edition.

## Buyer note

If you bought Starter, everything in this repository beyond the BASE module (M1, M6, and anything added later) is content from other editions living in this same source repository — it is not part of your license and isn't included in your zip. See `LICENSE.md`.
