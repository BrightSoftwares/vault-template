# PARA + Johnny Decimal Vault Template (Starter Edition)

A ready-to-use [Obsidian](https://obsidian.md) vault skeleton that combines two well-known personal-knowledge-management methods:

- **PARA** (Projects / Areas / Resources / Archives) — a method for organizing notes by *actionability* rather than by topic, popularized by Tiago Forte.
- **Johnny Decimal** — a numbering scheme (`AA-BB.category-name/`, `AA.sub-area/`) that gives every folder a short, stable, sortable address so you always know where something lives.

This Starter Edition is intentionally small but complete: one clean folder skeleton, a documented naming convention, ten ready-to-fill templates, and a small set of connected worked examples — all built around a fictional example business ("Brightline Studio") so you can see the whole system working together before you put your own life into it.

---

## What's in the box

```
00-09.Inbox/                    Unsorted capture — the only folder you're allowed to be messy in
10-19.Projects/                 Time-bound efforts with a defined "done"
  10.general_and_templates/
  11.active_projects/
  12.on_hold_projects/
  13.finished_projects/
20-29.Areas/                    Ongoing responsibilities with no end date
  20.general_and_templates/
  21.active_areas/
  22.on_hold_areas/
30-39.Resources/                Reference material, guides, standards
  30.general_and_templates/
40-49.Archives/                 Inactive material kept for the record
  40.general_and_templates/
Daily_notes/                    One note per day — capture, review, journal
Weekly_reviews/                 One note per week — a step-back-and-scan review
Meeting_notes/                  One note per conversation worth a written record
templates/                      All ten starter templates (see below)
AI_INSTRUCTIONS.md              Instructions for an AI assistant working inside this vault
QUICKSTART.md                   A full guided walkthrough — read this first
LICENSE.md                      Usage terms for this template
build_starter_zip.sh            Packages this repository into a single distributable zip
```

### The ten templates

| Core types | Day-to-day types |
|---|---|
| `.PRJ.` project | `.RESOURCE.` reference note |
| `.AREA.` area | Weekly review |
| `.GOAL.` goal | Meeting note |
| `.TMPLT.` template (meta) | `.STATUSREVIEW.` project status snapshot |
| | `.RHYTHM.` recurring personal practices |
| | Quick capture (Inbox) |

Full descriptions and filenames: `templates/README.md`.

### The fictional demo project

Rather than one isolated example per template, the day-to-day templates share a single connected story so you can see how the pieces actually reference each other, not just what each one looks like alone:

Brightline Studio gets an inbound lead from a fictional prospective client (Ferncrest Kitchen Co.) → a kickoff call is logged as a meeting note → it kicks off a second project (refreshing the portfolio website) → that project is audited against a resource checklist → the project gets a dated status review → the week's weekly review scans across it alongside the studio's other project and area → and a stray idea along the way gets a quick Inbox capture. Start at `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` and follow the links outward from there.

A worked example lives inside each active folder so the structure isn't just an empty shell:

- `10-19.Projects/11.active_projects/11.PRJ.launch-cooking-blog.md` — a fictional project for Brightline Studio
- `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` — a second fictional project, the start of the connected demo story above
- `10-19.Projects/11.active_projects/11.STATUSREVIEW.2026-01-31.refresh-portfolio-website.md` — a dated status snapshot of that project
- `20-29.Areas/21.active_areas/21.AREA.client-bookkeeping.md` — a fictional ongoing responsibility
- `20-29.Areas/21.active_areas/21.RHYTHM.weekly-personal-rhythms.md` — a fictional set of recurring personal practices
- `2026-Q1.GOAL.grow-brightline-studio.md` (vault root) — a fictional quarterly goal tying the projects and area together
- `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md` — the numbering scheme explained in depth
- `30-39.Resources/30.general_and_templates/30.RESOURCE.portfolio-site-content-checklist.md` — a reusable reference checklist
- `Daily_notes/2026-01-15.md` — a filled-in example daily note
- `Weekly_reviews/2026-W04.md` — a filled-in example weekly review
- `Meeting_notes/2026-01-22-ferncrest-kitchen-co-kickoff-call.md` — a filled-in example meeting note
- `00-09.Inbox/2026-01-18-idea-partner-with-local-bakery.md` — a filled-in example quick-capture note

Everything in this repository — every name, project, client, and figure — is invented for demonstration. See `AI_INSTRUCTIONS.md` § "This is a template, not a real vault" for the rule this repo itself follows.

---

## Prerequisites

- [Obsidian](https://obsidian.md) (free, desktop + mobile)
- Recommended community plugins (all free, install via Settings → Community plugins → Browse):
  - **Dataview** — lets you build live tables/lists from your notes' frontmatter and inline fields (used by the templates' example queries)
  - **Tasks** — adds due dates, recurring tasks, and task queries on top of plain Markdown checkboxes
  - **Templater** — turns the files in `templates/` into one-click "new note" templates with variables
- No account, subscription, or internet connection is required to use the vault itself — Obsidian reads and writes plain Markdown files on your own disk.

This repository does not bundle plugin code or plugin configuration — install the plugins above from Obsidian's own Community Plugins browser.

---

## Getting started

1. Download or clone this repository to a folder on your computer.
2. In Obsidian, choose **Open folder as vault** and select that folder.
3. Install the three recommended plugins above and enable them.
4. Read `QUICKSTART.md` for the full guided walkthrough — what everything is, how the pieces connect, and a day-by-day plan for your first week.
5. Read `AI_INSTRUCTIONS.md` once — even if you don't use an AI assistant, it doubles as the plain-English rulebook for the naming and numbering conventions.
6. Delete the fictional Brightline Studio worked examples once you understand the pattern (see the full list in "What's in the box" above), and start filling the same folders with your own projects, areas, and notes.
7. Use the ten files in `templates/` (via Templater, or just copy-paste) whenever you start a new project, area, goal, resource note, review, or capture note.

---

## Why "Starter Edition"

This is the smallest useful *complete* slice of a larger system: the folder skeleton, the naming rules, and ten core templates covering both long-running work (projects, areas, goals) and day-to-day capture (reviews, meetings, quick notes). It intentionally does **not** include task automation scripts, AI-agent workflows, multi-project dashboards, or business-tracking integrations — those exist in other, separately-sold modules built on top of this same foundation. If all you need is a clean, well-explained PARA + Johnny Decimal skeleton for Obsidian that already shows you what "day-to-day use" looks like, this edition is complete on its own.

---

## Packaging this edition

`build_starter_zip.sh` bundles this entire repository (folder tree, all ten templates, the demo project files, `QUICKSTART.md`, and the license) into a single `.zip` for distribution. Run it from the repository root:

```bash
./build_starter_zip.sh
```

The zip is written to `dist/` (git-ignored) and is not committed to this repository — only the source files and the packaging script are version-controlled.

---

## Support

This is a self-contained template — there is no bundled software, account, or service to configure. If a file, link, or instruction in this repository is unclear, treat `AI_INSTRUCTIONS.md` and the numbering guide as the sources of truth; every other file follows the conventions they define.
