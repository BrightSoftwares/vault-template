# Templates

Four starter templates, one per core note type:

| File | Produces |
|---|---|
| `00.TMPLT.template.template-for-templates.md` | A new template (the "meta" pattern the other three follow) |
| `01.TMPLT.project.project-template.md` | A new `.PRJ.` project note |
| `02.TMPLT.area.area-template.md` | A new `.AREA.` area note |
| `03.TMPLT.goal.goal-template.md` | A new `.GOAL.` goal note |

## Using these with the Templater plugin

If you have the [Templater](https://silentvoid13.github.io/Templater/) community plugin installed:

1. In Obsidian settings, point Templater's template folder location at this `templates/` folder.
2. Use Templater's "Create new note from template" command and pick the template you need — the `<% tp.date.now(...) %>` placeholders will fill in automatically.

## Using these without Templater

Just open the template file, copy its contents into a new note, and replace the placeholder text (anything in `<angle brackets>`) by hand.

## Where the filled-in examples live

Each template links to a fictional worked example elsewhere in the vault — see the "Worked example" section at the bottom of each template file.
