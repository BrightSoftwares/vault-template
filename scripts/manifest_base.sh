#!/usr/bin/env bash
#
# manifest_base.sh
#
# Single source of truth for exactly which files belong to the BASE/Starter
# module. Sourced by build_starter_zip.sh and by every higher-edition build
# script (e.g. build_solopreneur_zip.sh) so the list is defined once — a
# future edition script drifting out of sync with Starter's actual file list
# is the failure mode this exists to prevent. See MODULES.md.
#
# Not a build script itself — sourcing it only defines BASE_FILES.

BASE_FILES=(
  ".github/workflows/red-content-gate.yml"
  ".gitignore"
  "00-09.Inbox/2026-01-18-idea-partner-with-local-bakery.md"
  "00-09.Inbox/README.md"
  "10-19.Projects/11.active_projects/11.PRJ.launch-cooking-blog.md"
  "10-19.Projects/11.active_projects/11.PRJ.refresh-portfolio-website.md"
  "10-19.Projects/11.active_projects/11.STATUSREVIEW.2026-01-31.refresh-portfolio-website.md"
  "10-19.Projects/12.on_hold_projects/.gitkeep"
  "10-19.Projects/13.finished_projects/.gitkeep"
  "20-29.Areas/21.active_areas/21.AREA.client-bookkeeping.md"
  "20-29.Areas/21.active_areas/21.RHYTHM.weekly-personal-rhythms.md"
  "20-29.Areas/22.on_hold_areas/.gitkeep"
  "2026-Q1.GOAL.grow-brightline-studio.md"
  "30-39.Resources/30.general_and_templates/30.RESOURCE.johnny-decimal-numbering-guide.md"
  "30-39.Resources/30.general_and_templates/30.RESOURCE.portfolio-site-content-checklist.md"
  "40-49.Archives/40.general_and_templates/.gitkeep"
  "AI_INSTRUCTIONS.md"
  "Daily_notes/2026-01-15.md"
  "Daily_notes/Daily_Note_Template.md"
  "LICENSE.md"
  "Meeting_notes/2026-01-22-ferncrest-kitchen-co-kickoff-call.md"
  "MODULES.md"
  "QUICKSTART.md"
  "README.md"
  "Weekly_reviews/2026-W04.md"
  "build_starter_zip.sh"
  "scripts/red_content_scan.sh"
  "scripts/lib_build_zip.sh"
  "templates/00.TMPLT.template.template-for-templates.md"
  "templates/01.TMPLT.project.project-template.md"
  "templates/02.TMPLT.area.area-template.md"
  "templates/03.TMPLT.goal.goal-template.md"
  "templates/04.TMPLT.resource.resource-note-template.md"
  "templates/05.TMPLT.review.weekly-review-template.md"
  "templates/06.TMPLT.meeting.meeting-note-template.md"
  "templates/07.TMPLT.review.project-status-review-template.md"
  "templates/08.TMPLT.rhythm.personal-rhythms-template.md"
  "templates/09.TMPLT.capture.quick-capture-template.md"
  "templates/README.md"
)
