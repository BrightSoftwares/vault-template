# PARA + Johnny Decimal Vault Template (Starter Edition)

A ready-to-use [Obsidian](https://obsidian.md) vault skeleton that combines two well-known personal-knowledge-management methods:

- **PARA** (Projects / Areas / Resources / Archives) — a method for organizing notes by *actionability* rather than by topic, popularized by Tiago Forte.
- **Johnny Decimal** — a numbering scheme (`AA-BB.category-name/`, `AA.sub-area/`) that gives every folder a short, stable, sortable address so you always know where something lives.

This Starter Edition is intentionally small: one clean folder skeleton, a documented naming convention, four ready-to-fill templates, and one worked example per template — all built around a fictional example business ("Brightline Studio") so you can see the system working before you put your own life into it.

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
templates/                      The four starter templates (see below)
AI_INSTRUCTIONS.md              Instructions for an AI assistant working inside this vault
LICENSE.md                      Usage terms for this template
```

A worked example lives inside each active folder so the structure isn't just an empty shell:

- `10-19.Projects/11.active_projects/11.PRJ.launch-cooking-blog.md` — a fictional project for Brightline Studio
- `20-29.Areas/21.active_areas/21.AREA.client-bookkeeping.md` — a fictional ongoing responsibility
- `2026-Q1.GOAL.grow-brightline-studio.md` (vault root) — a fictional quarterly goal tying the two together
- `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md` — the numbering scheme explained in depth
- `Daily_notes/2026-01-15.md` — a filled-in example daily note

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
4. Read `AI_INSTRUCTIONS.md` once — even if you don't use an AI assistant, it doubles as the plain-English rulebook for the naming and numbering conventions.
5. Read the numbering guide at `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`.
6. Delete the four worked examples (the cooking-blog project, the bookkeeping area, the quarterly goal, the example daily note) once you understand the pattern, and start filling the same folders with your own projects, areas, and notes.
7. Use the four files in `templates/` (via Templater, or just copy-paste) whenever you start a new project, area, goal, or template.

---

## Why "Starter Edition"

This is the smallest useful slice of a larger system: the folder skeleton, the naming rules, and the four core templates. It intentionally does **not** include task automation scripts, AI-agent workflows, multi-project dashboards, or business-tracking integrations — those exist in other, separately-sold modules built on top of this same foundation. If all you need is a clean, well-explained PARA + Johnny Decimal skeleton for Obsidian, this edition is complete on its own.

---

## Support

This is a self-contained template — there is no bundled software, account, or service to configure. If a file, link, or instruction in this repository is unclear, treat `AI_INSTRUCTIONS.md` and the numbering guide as the sources of truth; every other file follows the conventions they define.
