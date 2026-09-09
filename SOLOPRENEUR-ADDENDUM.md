# Solopreneur Edition — Addendum

You already have everything described in `QUICKSTART.md` and `README.md` (the Starter Edition / BASE module). This addendum covers only what the Solopreneur edition adds on top of it: the **Business OS** module (M1) and the **Steering Pack** module (M6). Read `QUICKSTART.md` first if you haven't — this document assumes you already know PARA, Johnny Decimal, and the core `.PRJ./.AREA./.GOAL.` types.

Who this edition is for: someone building a side business on limited weekly hours, alongside a job or other commitments — the same situation the fictional Brightline Studio worked example represents throughout.

---

## What's new in this edition

```
20-29.Areas/21.active_areas/
  21.AREA.ideas-inventory.md              NEW — where candidate ideas live before they're a project
10-19.Projects/11.active_projects/
  11.PRJ.launch-styled-recipe-shot-list-product.md   NEW — a Business OS + Steering Pack worked example
30-39.Resources/
  31.business-os/                         NEW folder — Business OS guide + component-file worked examples
  32.steering-pack/                       NEW folder — Steering Pack guide
2026-2027.NORTHSTAR.grow-brightline-studio-into-a-full-time-business.md   NEW — multi-year North Star
Weekly_reviews/
  2026-W04-scoreboard.md                  NEW — paired scoreboard for the existing 2026-W04 weekly review
templates/
  10.TMPLT.company. / 11.TMPLT.brand. / 12.TMPLT.product.   NEW — component-file templates (M1)
  13.TMPLT.northstar. / 14.TMPLT.review.weekly-scoreboard.  NEW — North Star + scoreboard templates (M6)
```

Nothing above replaces or edits a Starter/BASE file — this is a pure add-on layer, the same way the spec for this product line requires (see `MODULES.md`).

## Business OS (M1) — in one paragraph

A revenue-focused project needs a `Revenue Path` frontmatter field (`"Direct"`, `"Enabling"`, or `"None"`) so you can see at a glance whether it has a real path to a paying customer, and a hard rule not to start a new unproven (`"None"`) idea while an existing `Direct` project still has zero customers. New ideas go into `21.AREA.ideas-inventory.md` first — a running, scored list — rather than straight into a project file. Once an idea is picked, describe the business (`.COMPANY.`), its voice (`.BRAND.`), and the specific offering (`.PRODUCT.`) once each, so every project referencing them doesn't have to re-explain positioning from scratch. Full guide: `30-39.Resources/31.business-os/31.RESOURCE.three-currencies-and-revenue-gate-guide.md`.

## Steering Pack (M6) — in one paragraph

Write one `.NORTHSTAR.` note with 2–4 multi-year Waypoints (`W1`, `W2`, ...) — a slower altitude than your quarterly `.GOAL.` note. Any `.PRJ.` or `.AREA.` note can declare `Serves: "W1"` to say which Waypoint it's working toward. Run `python3 scripts/serves_mapping_report.py --vault-root .` any time to see which Waypoints have work pointed at them and which don't. Pair a five-minute weekly scoreboard with your normal weekly review to keep an honest numbers-first pulse alongside the qualitative one. Full guide: `30-39.Resources/32.steering-pack/32.RESOURCE.north-star-waypoints-and-scoreboard-guide.md`.

## Suggested first-week order (on top of the Starter first week)

1. Read both module guides above (10 minutes total).
2. Write your own `.NORTHSTAR.` note — even a rough first draft. Don't skip this to "do it properly later"; a rough North Star written down beats a perfect one that never gets written.
3. Start your own `21.AREA.ideas-inventory.md` and move anything you've been mentally circling into it as a single row each.
4. Only once you have a real project underway, add `Revenue Path` and `Serves` fields to it and write its `.COMPANY.`/`.BRAND.`/`.PRODUCT.` notes if it's business-related.
5. Run the serves-mapping script once, just to see it work — don't expect meaningful coverage yet.

## Where to look next

- `30-39.Resources/31.business-os/31.RESOURCE.three-currencies-and-revenue-gate-guide.md`
- `30-39.Resources/32.steering-pack/32.RESOURCE.north-star-waypoints-and-scoreboard-guide.md`
- `MODULES.md` — the full module/edition map, and how each edition's zip is built
