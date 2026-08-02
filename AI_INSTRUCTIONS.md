# AI Instructions for This Vault

**Purpose of this file:** if you use an AI coding/writing assistant (Claude, ChatGPT, Copilot, or similar) inside this vault, point it at this file first. It explains the folder structure, naming rules, and task conventions so the assistant can find things, file new notes correctly, and understand your task syntax without you re-explaining it every session. If you don't use an AI assistant, this file also works as a plain-English rulebook for a human.

---

## This is a template, not a real vault

Every example in this repository — the fictional business "Brightline Studio," the fictional project ("Launch a cooking blog"), the fictional client, the fictional dates and figures — is invented for demonstration only. It does not describe any real company, person, or financial situation. When you (human or AI) start filling this vault with your own life or business, replace these examples; do not build on top of them as if they were real.

---

## The organizing method: PARA

Every note in this vault belongs to exactly one of four categories, based on how *actionable* it is — not what topic it's about:

| Category | Question it answers | Has an end date? |
|---|---|---|
| **Projects** | "What am I actively working toward finishing?" | Yes — a project is done when its goal is reached |
| **Areas** | "What do I need to maintain indefinitely?" | No — an area has no finish line (e.g., "Bookkeeping," "Health," "Home maintenance") |
| **Resources** | "What reference material might I need later?" | No — topic-based reference notes, guides, standards |
| **Archives** | "What is no longer active but worth keeping?" | N/A — finished projects and inactive areas move here |

**The most common mistake:** filing something as a Project when it's really an Area (or vice versa). A project has a specific finish line ("launch the blog," "redesign the kitchen"); an area repeats forever ("keep the blog running," "keep the kitchen clean"). When unsure, ask: *"If I do nothing else, does this ever reach a state of 'done'?"* Yes → Project. No → Area.

---

## The organizing method: Johnny Decimal numbering

Every top-level folder gets a two-digit range (`00-09`, `10-19`, `20-29`, …), and every folder inside it gets one number from that range as a prefix. This means:

- You can always tell which top-level category a folder belongs to just from its number.
- Numbers are stable — renaming a folder's *label* doesn't require renumbering everything inside it.
- You never have more than ~10 items at any one level, which keeps the tree easy to scan.

This vault's ranges:

```
00-09.Inbox/            Unsorted capture
10-19.Projects/         Time-bound efforts
20-29.Areas/            Ongoing responsibilities
30-39.Resources/        Reference material
40-49.Archives/         Inactive/completed material
```

Within a range, the tens digit repeats as the subfolder prefix — e.g., everything under `10-19.Projects/` starts with `1` (`10.general_and_templates/`, `11.active_projects/`, `12.on_hold_projects/`, `13.finished_projects/`). Full explanation and worked examples: `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`.

**When creating a new top-level category** (most users won't need to — the five ranges above cover most personal and small-business use), continue the pattern: pick the next free `X0-X9` range, and give it a short, plain-English label.

---

## File naming conventions

Every note that has a defined "type" gets a filename in this shape:

```
<number>.<TYPE>.<short-description>.md
```

- `<number>` — the Johnny Decimal address of the folder it lives in (e.g., `11` for an active project)
- `<TYPE>` — one of the four core types below, in capitals, surrounded by dots
- `<short-description>` — lowercase, hyphen-separated, human-readable

### The four core types

| Type marker | Used for | Example filename |
|---|---|---|
| `.PRJ.` | A project note | `11.PRJ.launch-cooking-blog.md` |
| `.AREA.` | An area note | `21.AREA.client-bookkeeping.md` |
| `.GOAL.` | A goal note that groups several projects/areas toward a bigger objective | `2026-Q1.GOAL.grow-brightline-studio.md` |
| `.TMPLT.` | A template note (a fill-in-the-blank pattern for one of the other three types) | `01.TMPLT.project.project-template.md` |

Goal notes are the one exception to strict number-prefixing: because a goal usually cuts across multiple PARA categories (a single goal might involve two projects and one area), goal notes live at the vault root and are prefixed with the time period they cover instead of a folder number (e.g., `2026-Q1.GOAL.*`).

Plain notes that aren't one of these four types (a daily note, a loose reference note) don't need a type marker — just a clear, descriptive filename.

---

## Frontmatter conventions

Project, area, and goal notes should open with a small YAML frontmatter block so the values can be queried later (with the Dataview plugin, for example):

```yaml
---
Type: "Project"
Status: "Active" | "On Hold" | "Completed"
Priority: "High" | "Medium" | "Low"
Start Date: YYYY-MM-DD
Target Date: YYYY-MM-DD
---
```

Adjust the field list to what you actually track — the point is *consistency*, not a fixed schema. Whatever fields you pick, use the same ones across every note of that type so queries stay reliable.

---

## Task syntax

Standard Markdown checkboxes, one task per line:

```markdown
- [ ] An open task
- [x] A completed task
- [-] An abandoned/cancelled task (intentionally not done — different from just unchecked)
```

**Keep each task on a single line.** Don't nest explanatory text on the line below a task — if a task needs more context than fits on one line, either shorten it, link to a note that has the detail (`[[note-name]]`), or add a short parenthetical.

### Tags

Use hashtags for filtering and cross-cutting views. Two useful categories to start with:

- **Priority tags** — `#today`, `#this-week`, `#someday` — so you can build an Obsidian search or Tasks-plugin query like "show me everything tagged `#today`" across the whole vault, regardless of which folder it's filed in.
- **Context tags** — `#waiting-on-someone-else`, `#quick-win`, `#needs-decision` — so you can batch similar work together.

Keep your tag vocabulary small and stable. A tag you use three times is more useful than fifteen tags you use once each.

### Linking tasks to their project or area

When you capture a task in your daily note or inbox that belongs to a specific project or area, link it directly so you (or your sorting routine) can find where it should live:

```markdown
- [ ] [[11.PRJ.launch-cooking-blog]] Write the first three recipe posts
- [ ] [[21.AREA.client-bookkeeping]] Reconcile last month's invoices
```

---

## Daily notes

One note per day, named by date (`YYYY-MM-DD.md`), stored in `Daily_notes/`. Use it as your single capture point during the day — new tasks, quick thoughts, meeting notes — then move anything that belongs to a specific project or area into that project's or area's file (manually, or via whatever sorting routine you set up). See `Daily_notes/2026-01-15.md` for a filled-in example.

---

## Working with an AI assistant in this vault

If you ask an AI assistant to help organize, write, or file notes in this vault, these ground rules keep it predictable:

1. **Check before creating.** Before creating a new project or area note, the assistant should search existing notes for something similar first, and ask whether to extend the existing note rather than duplicate it.
2. **Respect the type markers.** A note that should be a Project (`.PRJ.`) shouldn't be created as an Area (`.AREA.`), and vice versa — ask if genuinely unsure which one fits.
3. **Keep frontmatter consistent.** New notes of a given type should reuse the same frontmatter fields as existing notes of that type, not invent new ones per-note.
4. **Ask before restructuring.** Moving, renaming, or deleting existing folders/files is a structural change — confirm with the human first rather than assuming.
5. **One task per line, no nested sub-bullets under a task** — keep the task syntax rules above.

---

## Where to look next

- Numbering scheme in depth: `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`
- The four starter templates: `templates/`
- A worked example of each note type: see the README's "What's in the box" section
