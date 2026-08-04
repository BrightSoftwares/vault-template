# Quick Start Guide

**PARA + Johnny Decimal Vault Template — Starter Edition**

This guide is the long version. `README.md` tells you what's in the box; `AI_INSTRUCTIONS.md` is the compact rulebook for a human or an AI assistant working inside the vault day to day. This document sits between them: it explains *why* the system is shaped the way it is, walks through every file type with the worked examples already sitting in this repository, and ends with a concrete plan for your first week of real use.

Read it once, start to finish, before you delete the fictional examples and start filling the vault with your own life. Everything here uses "Brightline Studio" — a fictional freelance photography and content studio — as its running example. Nothing in this guide, or in this repository, describes a real business, person, or client.

---

## Table of contents

1. [What this system is (and isn't)](#1-what-this-system-is-and-isnt)
2. [Before you start](#2-before-you-start)
3. [The big picture: how the pieces fit together](#3-the-big-picture-how-the-pieces-fit-together)
4. [Folder structure, explained](#4-folder-structure-explained)
5. [The four core file types](#5-the-four-core-file-types)
6. [The six day-to-day templates](#6-the-six-day-to-day-templates)
7. [Task syntax basics](#7-task-syntax-basics)
8. [How capture actually flows, day to day](#8-how-capture-actually-flows-day-to-day)
9. [Your first week: a day-by-day walkthrough](#9-your-first-week-a-day-by-day-walkthrough)
10. [Common mistakes](#10-common-mistakes)
11. [FAQ](#11-faq)
12. [Where to go from here](#12-where-to-go-from-here)

---

## 1. What this system is (and isn't)

This is a note-taking and light task-management system for [Obsidian](https://obsidian.md), built by combining two independent, well-established methods:

- **PARA** — short for Projects, Areas, Resources, Archives — a way of sorting *any* note by how actionable it is, rather than by subject. It was popularized by productivity writer Tiago Forte, but the underlying idea (sort by actionability, not by topic) predates any one person's branding of it.
- **Johnny Decimal** — a numbering scheme that gives every folder a short, stable, two-digit-range-based address, so you always know roughly where something lives without needing to memorize a folder tree. See [johnnydecimal.com](https://johnnydecimal.com) for the original, general-purpose write-up — it isn't specific to note-taking at all; people use it for photo libraries, business documents, even physical filing cabinets.

Neither method is new or proprietary. What this template does is combine them into one consistent, opinionated set of conventions for an Obsidian vault, and then hand you ten ready-to-use templates and a full worked example so you can see the combination in practice instead of inventing it yourself from two separate blog posts.

**What this system is good at:**

- Giving every note an unambiguous "home" — projects go in one place, ongoing responsibilities in another, reference material in a third, and you never have to wonder "is this a project or a note?" more than once.
- Keeping a small number of files honest about their state — a project's `## Todo` section tells you what's actually left, not what you did six weeks ago.
- Scaling down as well as up — this works fine with three active projects and doesn't collapse under fifty.
- Working entirely offline, on files you own, with no account or subscription required beyond Obsidian itself (which is free).

**What this system is deliberately *not*:**

- It is not a project-management tool with Gantt charts, burndown reports, or automated status rollups. If you want that, this Starter Edition can feed data into the Dataview plugin for lightweight tables and queries, but it won't build dashboards for you out of the box.
- It is not a to-do list app. Tasks live inside the project or area they belong to, not in one giant flat list — this is a deliberate choice (see [§10](#10-common-mistakes) for why a flat task list is usually the wrong instinct here).
- It is not a habit tracker or a journaling app, though the Rhythm template and daily notes can cover adjacent ground lightly.
- It does not include automation scripts, AI-agent workflows, or business-tracking integrations. Those are real things that can be layered on top of a system shaped like this one, but this edition is deliberately the foundation only — see the README's "Why Starter Edition" section.

If what you actually need is heavier project tracking with deadlines, dependencies, and reporting, this system is still a reasonable foundation to build that on top of — but this edition, on its own, is aimed at one person (or a very small team) keeping their own work and life organized without fighting their tools.

---

## 2. Before you start

You need:

- **[Obsidian](https://obsidian.md)** — free, available for desktop and mobile, and it's the only piece of software this template assumes you have.
- Three free community plugins, installed from inside Obsidian (**Settings → Community plugins → Browse**):
  - **Dataview** — lets you build live tables and lists driven by frontmatter fields and inline data. You won't need to write any Dataview queries to use this template as-is, but it's what you'd reach for the moment you want a table of "all active projects sorted by priority" instead of clicking through folders.
  - **Tasks** — adds due dates, recurring tasks, and query-based task views on top of plain Markdown checkboxes. Every checkbox in this template is valid Markdown with or without the Tasks plugin; the plugin just adds optional superpowers on top.
  - **Templater** — turns the files in `templates/` into one-click "new note" commands with variables (like auto-filling today's date). Without it, you can still use every template — you just copy-paste the file and fill in the blanks by hand.
- No account, no sign-up, no internet connection required to *use* the vault day to day. Obsidian reads and writes plain Markdown files on your own disk; this template is just a particular arrangement of those files.

None of these plugins are bundled in this repository — install them fresh from Obsidian's own plugin browser so you always get the current, actively-maintained version.

---

## 3. The big picture: how the pieces fit together

Before diving into folder-by-folder detail, it helps to see the shape of the whole thing at once.

```
                          ┌─────────────────────┐
                          │   Daily capture      │
                          │  (Daily notes, Inbox) │
                          └──────────┬───────────┘
                                     │ sorted into
                                     ▼
        ┌─────────────┐     ┌──────────────┐     ┌──────────────┐
        │  Projects    │     │    Areas     │     │  Resources   │
        │ (has a       │     │ (no finish   │     │ (reference,  │
        │  finish line)│     │  line)       │     │  no status)  │
        └──────┬───────┘     └──────┬───────┘     └──────────────┘
               │                    │
               │  ladder up to      │
               ▼                    ▼
                    ┌───────────────────────┐
                    │        Goals           │
                    │ (this quarter's        │
                    │  priorities, across    │
                    │  Projects + Areas)      │
                    └───────────────────────┘

        ┌──────────────────────────────────────────┐
        │ Periodic zoom-outs, layered on top of all │
        │ of the above:                              │
        │  • Weekly Review  — scans everything       │
        │  • Status Review  — goes deep on one project│
        │  • Meeting Notes  — records one conversation│
        │  • Rhythms        — protects recurring      │
        │                     personal practices      │
        │                     (never task-ified)      │
        └──────────────────────────────────────────┘
```

The core loop is simple: things enter the system through daily capture (your daily note's Intake section, or a loose Inbox note), get sorted into the Project, Area, or Resource file they actually belong to, and periodically — weekly for a broad scan, or on its own schedule for a specific important project — you step back and look across everything at once instead of only ever seeing one file in isolation.

Nothing in this loop requires software beyond Obsidian itself. The "system" is really just a set of conventions about where things go and what shape each file takes, consistently applied.

---

## 4. Folder structure, explained

Every top-level folder in this vault gets a two-digit range, and the tens digit of that range repeats as the prefix for everything inside it. This is the Johnny Decimal part of the system — full depth in `30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`, summarized here.

```
00-09.Inbox/            Unsorted capture — the only folder you're allowed to be messy in
10-19.Projects/         Time-bound work with a defined finish line
  10.general_and_templates/
  11.active_projects/
  12.on_hold_projects/
  13.finished_projects/
20-29.Areas/             Ongoing responsibilities with no finish line
  20.general_and_templates/
  21.active_areas/
  22.on_hold_areas/
30-39.Resources/         Reference material, guides, standards
  30.general_and_templates/
40-49.Archives/          Inactive projects and areas kept for the record
  40.general_and_templates/
```

Notice the pattern: everything under `10-19.Projects/` starts with `1` (`10.`, `11.`, `12.`, `13.`), because `1` is the tens digit of the `10-19` range. See a folder or file named `12.on_hold_projects/` or `12.PRJ.something.md` anywhere — even copied out of context into a chat message or a search result — and you know instantly it's a Project-category item, specifically an on-hold one. That's the entire value of the scheme: the number tells you where something belongs without needing to hold a mental map of the whole tree.

Ranges `50-99` are left open on purpose. Add a new top-level category only when Projects/Areas/Resources/Archives genuinely doesn't fit something — most personal and small-business vaults never need to.

### The two "dated, not numbered" exception folders (and now four)

Two folders don't participate in the numbering scheme at all, because they're already sorted by something more natural than a Johnny Decimal address: **a date**.

- `Daily_notes/` — one file per day, named `YYYY-MM-DD.md`.
- `Weekly_reviews/` — one file per week, named `YYYY-Www.md` (ISO week format, e.g. `2026-W04`).
- `Meeting_notes/` — one file per conversation, named `YYYY-MM-DD-short-description.md`.
- The **Inbox** (`00-09.Inbox/`) *is* numbered as a folder (it's the `00-09` range), but individual loose capture notes dropped inside it are also typically named by date rather than given their own Johnny Decimal file number — they're meant to be short-lived and sorted elsewhere quickly, not permanently filed in place.

A date is already a stable, sortable, unique-enough identifier for anything that happens once, on one day. Forcing a Johnny Decimal number onto a daily note or a meeting record would add ceremony without adding any actual findability.

### Goal files: the other exception

`.GOAL.` files live at the **vault root**, not inside any of the numbered folders, and are prefixed by the time period they cover instead of a folder number (`2026-Q1.GOAL.grow-brightline-studio.md`). This is because a single goal usually cuts across multiple PARA categories at once — the worked-example goal in this repository ties together *two* projects and *one* area, so filing it inside any single category's folder would be arbitrary and wrong.

---

## 5. The four core file types

Every note in this vault that has a defined "type" follows the same filename shape:

```
<number>.<TYPE>.<short-description>.md
```

Where `<number>` is the Johnny Decimal address of the folder it lives in, `<TYPE>` is one of the type markers below in capitals surrounded by dots, and `<short-description>` is lowercase and hyphen-separated.

### `.PRJ.` — Project

**The question it answers:** "What am I actively working toward finishing?"

A project has a defined "done." It has a start, an end (even if the end date shifts), and a `## Todo` section that should be empty when the project is complete. Look at the worked example:

`10-19.Projects/11.active_projects/11.PRJ.launch-cooking-blog.md` — Brightline Studio launching a recipe blog as a lead-generation channel. Notice the shape:

- Frontmatter: `Type`, `Status`, `Priority`, `Start Date`, `Target Date` — enough to filter and sort projects with Dataview, not so much that filling it in feels like paperwork.
- A one-sentence goal ("what does done look like") right under the title, before any other prose — this is deliberate. If you can't state the finish line in one sentence, the project probably needs to be scoped more tightly before it's a project at all.
- `## Why this project` — a short paragraph of context, so that six months from now (or an AI assistant reading cold) understands *why* this exists, not just what the tasks are.
- `## Todo` and `## Completed` — tasks move from one to the other as they're finished; the Todo section is always the current, trustworthy list of what's left.
- `## Notes` — a catch-all for decisions, constraints, and anything else worth capturing that isn't a task.

A second, richer worked example lives at `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` — this one shows a project that also links out to a meeting note, a resource checklist, and its own dated status-review file, which is what a client-facing project with real deadline pressure tends to look like in practice (see [§6](#6-the-six-day-to-day-templates) for those extra pieces).

**Template:** `templates/01.TMPLT.project.project-template.md`

### `.AREA.` — Area

**The question it answers:** "What do I need to maintain indefinitely?"

An area has no finish line. "Bookkeeping" is never *done* — you either keep meeting the standard or you don't. Worked example:

`20-29.Areas/21.active_areas/21.AREA.client-bookkeeping.md` — Brightline Studio's ongoing invoicing, payment-logging, and reconciliation responsibilities.

The shape differs from a Project in one important way: instead of "what does done look like," an Area opens with **"Standard to maintain"** — the ongoing bar you're holding yourself to, forever, not a target you cross once. It still has a `## Todo` section for any *currently* open task tied to the area (like "reconcile last month's invoices"), but that section will never permanently empty out the way a project's does.

**The single most common mistake in PARA systems** is filing something as a Project when it's really an Area, or the reverse. The test that resolves almost every ambiguous case: *"If I do nothing else, does this ever reach a state of done?"* Yes → Project. No → Area. "Launch the blog" reaches done. "Keep the blog running" never does — that's an Area, even though it's about the same underlying subject.

**Template:** `templates/02.TMPLT.area.area-template.md`

### `.GOAL.` — Goal

**The question it answers:** "What am I prioritizing this specific period, across everything?"

A Goal note doesn't do any work itself — it's a lens over a set of Projects and Areas, grouped into priority-ordered **work streams**, for one time period (a quarter is typical, but nothing enforces that). Worked example: `2026-Q1.GOAL.grow-brightline-studio.md`.

Two things worth calling out about how the worked example is structured:

1. **Work-stream order is priority, not a dependency chain.** The tasks inside a work stream aren't marked as blocking each other with any special syntax — their *position in the list* tells you what to focus on next. The first unchecked item in a stream is the current focus; when it's done, the next one becomes the focus.
2. **A Goal cross-links into Project and Area files** rather than duplicating their task lists. Notice the goal's work-stream items are wikilinks straight into a `#Todo` heading of a specific project (`[[10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website#Todo]]`) — the goal is a map pointing at the real work, not a second copy of it that can drift out of sync.

The `## Review notes` section at the bottom is where the goal accumulates a short, dated log as the quarter progresses — one line per check-in, appended, never rewritten. Look at the worked example's review notes to see this in action: three dated entries tracking how the goal's scope and status changed over the quarter, including the entry added when a second work stream (the Ferncrest Kitchen Co. pitch) got added mid-quarter.

**Template:** `templates/03.TMPLT.goal.goal-template.md`

### `.TMPLT.` — Template

**The question it answers:** "What's the fill-in-the-blank pattern for a given note type?"

This is the "meta" type — a template *for making templates*, if you ever add a new note type to your own system and want its pattern to follow the same shape as the ones already here (required frontmatter, required sections, a worked-example link, notes on using it). You likely won't touch this one often, but it's there so the system can extend itself consistently rather than each new note type inventing its own unrelated structure.

**Template:** `templates/00.TMPLT.template.template-for-templates.md`

---

## 6. The six day-to-day templates

The four core types above are the skeleton — they're what makes this a PARA + Johnny Decimal system at all. In practice, though, most people find within their first couple of weeks that a few more recurring note *shapes* keep coming up, and having a fixed pattern for each saves you from re-deciding the format every time. This Starter Edition ships all six of these as full templates, each with a worked example, and — unlike a set of six unrelated demos — the worked examples are deliberately connected into one small story, so you can see how the pieces reference each other in a real vault rather than just what each looks like in isolation.

**The story, in order:** Brightline Studio gets an inbound lead from a fictional prospective client (Ferncrest Kitchen Co.). A kickoff call happens and gets logged as a **meeting note**. That call kicks off a second project — refreshing the studio's portfolio website — which gets audited against a **resource** checklist, and because it's client-facing with a real deadline, it gets its own dated **status review**. The week's **weekly review** scans across that project alongside the studio's other ongoing project and its bookkeeping area. And along the way, a stray idea about a possible partnership gets a two-minute **quick capture** note in the Inbox before it's forgotten. Follow the links starting from `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` to walk through the whole thing yourself.

### Resource note (`.RESOURCE.`)

**The question it answers:** "What did I decide, learn, or collect about X, that I'll want to look up again?"

A resource note is read, not worked — it has no `Status` field and no `Todo` section, and if you ever catch yourself adding checkboxes for things you personally still need to *do* inside one, that content has quietly become a Project or Area and should move there. Worked example: `30-39.Resources/30.general_and_templates/30.RESOURCE.portfolio-site-content-checklist.md` — a reusable checklist Brightline Studio runs any portfolio-site work against, referenced from the portfolio-refresh project rather than copy-pasted into it. **Template:** `templates/04.TMPLT.resource.resource-note-template.md`.

### Weekly review

**The question it answers:** "Given everything, not just one project, what actually matters next?"

Where every other file in this system is scoped to one thread of work, the weekly review's entire job is to look sideways across all of them, once a week, on a fixed day. It has four short sections — wins, what's stuck, a one-line scan across every active project and area, and next week's 1–3 priorities (not a restated to-do list). Worked example: `Weekly_reviews/2026-W04.md`, which scans both of Brightline Studio's active projects and its bookkeeping area in a few lines each. **Template:** `templates/05.TMPLT.review.weekly-review-template.md`.

The discipline that makes this actually stick: keep it short. A weekly review that takes 45 minutes stops happening after a month; ten focused minutes, every week without fail, is worth far more over a year.

### Meeting note

**The question it answers:** "What was decided, and what happens next, in this specific conversation?"

A permanent record of one conversation — written during or right after it, since decisions and action items are the two things that degrade fastest from memory. Worked example: `Meeting_notes/2026-01-22-ferncrest-kitchen-co-kickoff-call.md`. Notice its action items are linked into the *project's* Todo section, not left to live only inside the meeting note — a task that only exists inside a meeting record is a task that gets forgotten the next time you're not specifically looking at that meeting note. **Template:** `templates/06.TMPLT.meeting.meeting-note-template.md`.

### Project status review (`.STATUSREVIEW.`)

**The question it answers:** "How is this *specific* project actually doing, and how did that change since last time?"

Not every project needs this — a two-week solo task doesn't. A six-week client project with a hard deadline usually does, because the value of a status review is being able to look back through a *series* of them and see the trend, not just the current state. Worked example: `10-19.Projects/11.active_projects/11.STATUSREVIEW.2026-01-31.refresh-portfolio-website.md`, filed right alongside the project it reviews using that project's own folder number. **Template:** `templates/07.TMPLT.review.project-status-review-template.md`.

A useful signal buried in this template's design: a run of consecutive "at risk" status reviews where the underlying cause never changes is itself information — it usually means the project's scope or deadline needs reassessing, not just re-noting the same risk on repeat.

### Rhythms (`.RHYTHM.`)

**The question it answers:** "What recurring personal practices am I protecting, regardless of what's on my project list this week?"

This is the one template in the set that is deliberately *not* a task list. Client work — or any work — expands to fill however much time is available for it; a rhythms note is a short, standing reminder of the handful of recurring practices (a planning walk, an offline evening, a protected admin block, a regular check-in with someone you care about) that keep you functioning well enough to do the work at all. Worked example: `20-29.Areas/21.active_areas/21.RHYTHM.weekly-personal-rhythms.md` — deliberately generic and secular in this template (a planning walk, an offline evening, an admin block, a personal check-in), because the pattern works identically whether what you're protecting is a fitness habit, a creative practice, a spiritual one, or something else entirely. Swap in whatever actually matters to you. **Template:** `templates/08.TMPLT.rhythm.personal-rhythms-template.md`.

**The one hard rule:** never convert a rhythm into a `- [ ]` checkbox, never score or track completion against it, and never let a missed rhythm turn into guilt-laden backlog. If you notice yourself doing that, the content has turned back into a task list and should move to an Area note instead — a rhythms note observes, it doesn't nag.

### Quick capture

**The question it answers:** "How do I get this thought out of my head in under a minute, without deciding right now where it belongs?"

The lightest-weight file type in the whole system, on purpose — no required frontmatter, no required sections. Its entire job is speed: capture the thought before it's lost, and decide what to do with it later, during your regular Inbox pass. Worked example: `00-09.Inbox/2026-01-18-idea-partner-with-local-bakery.md` — a stray idea about a possible cross-promotion, tagged `#unsorted`, waiting to either get filed into the cooking-blog project or deleted the next time the Inbox gets a pass. **Template:** `templates/09.TMPLT.capture.quick-capture-template.md`.

An Inbox note still sitting there unsorted after a couple of weeks isn't a failure of the system — it's useful information. Either it turns out to matter (file it properly) or it turns out it didn't (delete it). A quick-capture note is meant to be short-lived either way.

---

## 7. Task syntax basics

Every task in this vault is a standard Markdown checkbox, one per line:

```markdown
- [ ] An open task
- [x] A completed task
- [-] An abandoned/cancelled task — intentionally not done, which is different from just unchecked
```

**Keep every task on a single line.** Don't nest explanatory context on the line underneath a task, and don't create indented sub-tasks under it. If a task needs more context than fits comfortably on one line, you have three options: shorten the task itself, link to a note that holds the detail (`[[some-note]]`), or add a short parenthetical. This rule exists because Obsidian's Tasks plugin (and any query built on top of it) reads and displays tasks as standalone lines — context left on a separate line underneath is invisible to those queries.

### Tags

Hashtags give you filtering across the whole vault, regardless of which folder a task happens to be filed in. Two categories are worth starting with:

- **Priority tags** — `#today`, `#this-week`, `#someday` — so a single search or Tasks-plugin query can show you "everything tagged `#today`," pulled from every project and area at once.
- **Context tags** — `#waiting-on-someone-else`, `#quick-win`, `#needs-decision` — so you can batch similar work together when you have, say, ten minutes and want the quick wins specifically.

Keep your tag vocabulary small and stable. A tag you actually use three times is worth more than fifteen tags you invented and used once each — tag sprawl defeats the purpose of tagging in the first place.

### Linking a captured task to the project or area it belongs to

When you jot a task down somewhere general — your daily note's Intake section, a loose Inbox note — and it clearly belongs to a specific Project or Area, link it directly so it's obvious (to you, or to a sorting routine you set up later) where it should end up:

```markdown
- [ ] [[11.PRJ.launch-cooking-blog]] Write the first three recipe posts
- [ ] [[21.AREA.client-bookkeeping]] Reconcile last month's invoices
```

This is exactly the pattern you'll see in the worked-example daily note (`Daily_notes/2026-01-15.md`) — both of its Intake tasks open with a wikilink to the project or area they belong to.

---

## 8. How capture actually flows, day to day

Putting sections 4 through 7 together, here's the full loop this system is built around:

1. **Something happens** — an idea, a request, a task someone mentions, a thought on a walk.
2. **You capture it fast**, wherever's convenient in the moment: your daily note's `# Intake` section if you're already in it, or a standalone Quick Capture note in `00-09.Inbox/` if you're not. Neither choice is "more correct" — use whichever capture point you happen to have open.
3. **On a regular cadence** (daily or a few times a week for the Inbox; end-of-day for daily-note Intake items), you sort what you captured: move it into the right Project's `## Todo`, the right Area's `## Todo`, or decide it's not worth keeping and let it go.
4. **You work the tasks** inside the Project or Area files themselves — that's the system's "source of truth" for what's actually left to do, not the daily note or the Inbox.
5. **Once a week**, you step back with a Weekly Review and scan across everything at once — this is what catches a project quietly going stale between individual look-ins.
6. **For anything complex or client-facing**, a Project Status Review adds a deeper, dated history on top of the weekly scan.
7. **Conversations** get a Meeting Note the moment they happen, with any resulting tasks linked into the relevant Project or Area — never left to live only inside the meeting record.
8. **Underneath all of it**, a Rhythms note protects the handful of recurring personal practices that keep the whole loop sustainable — and it's the one file type in the system that never becomes a task list.

Nothing about this loop requires you to touch every template every day. A quiet week might only involve daily-note Intake and nothing else; a busy client week might touch all eight steps. The system flexes to how much is actually happening — it doesn't demand a fixed ritual regardless of load.

---

## 9. Your first week: a day-by-day walkthrough

This is a concrete plan for going from "just installed this template" to "actually using it for my own life," using the worked examples in this repository as your guide the whole way.

**Day 1 — Install and orient.**
Install Obsidian and the three plugins (§2). Open this repository as a vault. Read this Quick Start guide start to finish (you're doing that now). Don't touch any files yet — just look.

**Day 2 — Walk the worked example.**
Open `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` and follow every link outward from it: the meeting note, the resource checklist, the status review, the goal it's linked from. This is the fastest way to internalize how the pieces actually connect, faster than reading descriptions of them in isolation. Also skim the numbering guide (`30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`) once, fully.

**Day 3 — Pick your first real Project and Area.**
Don't try to migrate your entire life into this system on day one — that's how these systems get abandoned within a month. Pick exactly one real, currently-active project of yours, and exactly one real, ongoing responsibility. Create them using `templates/01.TMPLT.project.project-template.md` and `templates/02.TMPLT.area.area-template.md`, filling in real frontmatter and a real "what does done look like" / "standard to maintain" line. Leave the Brightline Studio examples in place for now — you'll delete them once you trust the system, not before.

**Day 4 — Start using daily capture.**
Copy `Daily_notes/Daily_Note_Template.md` (or use Templater) to create today's daily note. Use its Intake section for anything that comes up during the day, following the linking pattern from §7. At the end of the day, sort what you captured into your real Project or Area file from Day 3.

**Day 5 — Try a Quick Capture note.**
The next time a stray thought shows up out of context — on a walk, in the shower, in the middle of something else — write it as a standalone note in `00-09.Inbox/` using `templates/09.TMPLT.capture.quick-capture-template.md`, following the worked example's naming pattern (`YYYY-MM-DD-short-description.md`). Don't decide yet where it belongs; that's tomorrow's job.

**Day 6 — Your first Inbox pass.**
Go through everything sitting in `00-09.Inbox/`, including yesterday's capture. For each item: file it into the right Project, Area, or Resource note, or delete it. An empty Inbox is the goal, not a permanent state.

**Day 7 — Your first Weekly Review.**
Using `templates/05.TMPLT.review.weekly-review-template.md` and the worked example (`Weekly_reviews/2026-W04.md`) as your model, write your first real weekly review. Keep it to ten minutes. Scan across your real Project and Area from Day 3 (even if there's only one of each so far — the habit matters more than the volume right now). Set next week's 1–3 priorities.

**After the first week:** if a real project of yours turns out to be complex or deadline-driven enough to warrant one, start a Project Status Review series for it (`templates/07.TMPLT.review.project-status-review-template.md`). If a real conversation happens that's worth a written record, log it with the Meeting Note template. And whenever you're ready, sit down once and write your own Rhythms note (`templates/08.TMPLT.rhythm.personal-rhythms-template.md`) — the handful of things you want to protect regardless of how the rest of the system fills up.

Once all of this feels natural with your real work sitting alongside (or replacing) the Brightline Studio examples, delete the fictional files — the ones listed in the README's "What's in the box" section — and the vault is fully yours.

---

## 10. Common mistakes

**Filing a Project as an Area, or the reverse.** The test: *"If I do nothing else, does this ever reach a state of done?"* Yes → Project. No → Area. This is the single most common PARA mistake, and it's worth re-checking any time a note feels awkward to fill in — an awkward fit is often a sign it's in the wrong category.

**Letting a task list creep into a Resource or Rhythms note.** Both types are read-only by design — no `Status`, no ongoing `Todo` that's expected to clear. If you catch yourself adding checkboxes for things you personally still need to do, that content has become a Project or Area in disguise; move it, don't leave it stranded in the wrong file type.

**Using one giant flat task list instead of per-project Todo sections.** It's tempting to keep a single master to-do list across everything — but it strips away the context (why does this task exist, what project is it part of, what happens if it's not done) that makes a task actually actionable rather than just a line item. Tasks live where their context lives.

**Skipping the weekly review because "nothing changed."** The value of the weekly review isn't just recording wins — it's the "across projects and areas" scan that catches something going quietly stale *because* nothing changed on it in a week. A short, honest "nothing moved on X, and I don't know why" line is more useful than skipping the review entirely.

**Turning Rhythms into a checklist.** Covered in §6, worth repeating: the moment a rhythms note gets checkboxes and completion tracking, it has become an Area note and should move there. A rhythms note that nags defeats its own purpose.

**Over-numbering.** The Johnny Decimal system tempts some people into adding sub-numbers everywhere out of habit. Most personal and small-business vaults never need file-level numbering beyond the folder's own number — the numbering guide explicitly calls this out. Don't add structure you don't have an actual use for yet.

**Trying to migrate everything on day one.** Section 9 above starts with exactly one real Project and one real Area, deliberately. A system this is meant to be lived in, not a filing project to complete in one sitting.

---

## 11. FAQ

**Do I have to use all ten templates?**
No. The four core types (Project, Area, Goal, Template) are what make this a PARA + Johnny Decimal system at all — use those from day one. The six day-to-day templates exist because most people find they want them within the first few weeks, but nothing breaks if you never touch the Rhythms template, for instance, or if Meeting Notes aren't relevant to how you work.

**Can I rename the folders or change the numbering ranges?**
Yes — this is your vault. The numbering *pattern* (two-digit ranges, tens-digit prefix inheritance) is what gives the system its self-describing property; the specific labels and which five categories you use are yours to adjust. If you add a new top-level category, follow the same pattern (next free `X0-X9` range, short plain-English label) rather than inventing a different scheme.

**What if a project doesn't fit neatly under one Johnny Decimal number, or I have more active projects than fit comfortably?**
The numbering guide covers this: most people never have more than a handful of active projects and can share one folder number across a few files with different descriptive filenames (exactly what this repository does — two different projects both prefixed `11.PRJ.`). If you regularly run many simultaneous active projects and want each one uniquely numbered, you can extend the pattern one level further (`11.01`, `11.02`, …) — but don't add that complexity before you actually need it.

**Do I need the Tasks, Dataview, and Templater plugins, or can I use plain Obsidian?**
Every file in this template is valid, readable Markdown on its own — you can use the whole system with zero plugins, just slower (copy-pasting templates by hand instead of one-click creation, and no live filtered tables). The three recommended plugins remove friction; they don't change what the system fundamentally is.

**What's the difference between a Weekly Review and a Project Status Review?**
A Weekly Review is broad and shallow — a few lines scanning *every* active project and area, once a week. A Project Status Review is narrow and deep — a full dated snapshot of *one specific* project's health, used only for projects complex or important enough to justify tracking their history as a series. Most projects only ever show up in weekly reviews; only the client-facing or high-stakes ones tend to also get their own status-review series.

**Why doesn't the Rhythms template allow checkboxes?**
Because the entire point of separating it from an Area note is that recurring personal practices — a walk, an offline evening, a check-in with someone — degrade in a different way than project tasks do. Turning them into a checklist with completion tracking tends to produce guilt over missed weeks rather than protection of the practice itself. If you want to *track* something with completion state, that's what an Area note is for; Rhythms notes are deliberately for the things you don't want turned into another obligation.

**Is this repository's fictional content real business advice?**
No — the Brightline Studio content (the cooking blog, the Ferncrest Kitchen Co. pitch, the pricing checklist) exists purely to give every template a realistic, connected worked example. It isn't a template for running a photography business; it's a template for organizing notes, illustrated using a fictional one.

---

## 12. Where to go from here

- **`README.md`** — the compact overview: what's in the box, prerequisites, and the file list.
- **`AI_INSTRUCTIONS.md`** — the compact rulebook, written for an AI assistant to read first but equally useful as a human quick-reference once you've read this longer guide.
- **`30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md`** — full depth on the numbering scheme, including when and why to break the pattern.
- **`templates/README.md`** — the index of all ten templates with what each one produces.

This Starter Edition is, deliberately, the foundation and nothing more — no automation, no AI-agent workflows, no multi-project dashboards, no business-tracking integrations. If you get to the point where you want those, they're a natural next layer to build on top of a system already shaped like this one — but everything in this edition works completely on its own, forever, with nothing further required.
