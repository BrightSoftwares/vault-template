# Templates

Ten starter templates, covering the four core note types plus the six day-to-day templates most PARA + Johnny Decimal vaults end up needing within the first few weeks of real use.

## The four core types

| File | Produces |
|---|---|
| `00.TMPLT.template.template-for-templates.md` | A new template (the "meta" pattern the others follow) |
| `01.TMPLT.project.project-template.md` | A new `.PRJ.` project note |
| `02.TMPLT.area.area-template.md` | A new `.AREA.` area note |
| `03.TMPLT.goal.goal-template.md` | A new `.GOAL.` goal note |

## Day-to-day templates

| File | Produces |
|---|---|
| `04.TMPLT.resource.resource-note-template.md` | A new `.RESOURCE.` reference note |
| `05.TMPLT.review.weekly-review-template.md` | A weekly review note (`Weekly_reviews/`) |
| `06.TMPLT.meeting.meeting-note-template.md` | A meeting note (`Meeting_notes/`) |
| `07.TMPLT.review.project-status-review-template.md` | A `.STATUSREVIEW.` snapshot of a specific project |
| `08.TMPLT.rhythm.personal-rhythms-template.md` | A `.RHYTHM.` note — recurring personal practices, never converted to tasks |
| `09.TMPLT.capture.quick-capture-template.md` | A single loose Inbox capture note |

## Using these with the Templater plugin

If you have the [Templater](https://silentvoid13.github.io/Templater/) community plugin installed:

1. In Obsidian settings, point Templater's template folder location at this `templates/` folder.
2. Use Templater's "Create new note from template" command and pick the template you need — the `<% tp.date.now(...) %>` placeholders will fill in automatically.

## Using these without Templater

Just open the template file, copy its contents into a new note, and replace the placeholder text (anything in `<angle brackets>`) by hand.

## Where the filled-in examples live

Each template links to a fictional worked example elsewhere in the vault — see the "Worked example" section at the bottom of each template file. Together, the worked examples for the six day-to-day templates form one small connected story (a client lead, a kickoff call, a status review, a weekly review, a resource checklist, an inbox idea) around the same fictional business used everywhere else in this template — see `10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md` for where that story starts.
