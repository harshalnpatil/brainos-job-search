---
name: job-search
description: PM job-search prep domain pack — company folders, interview prep, person notes, and referrals for one opportunity at a time.
---

# Job search domain pack

This folder is the career/job-search domain pack of [BrainOS](https://github.com/harshalnpatil/BrainOS_starter_kit). It also works standalone with any AI assistant that reads markdown — the README quick start is enough.

## Startup reading order for agents

1. This `AGENTS.md`.
2. [`README.md`](README.md) — scaffolding and quick start.
3. [`docs/person_notes_convention.md`](docs/person_notes_convention.md) — MUST read before creating, filling, or editing any `{slug}_*_notes.md` file.
4. The relevant company folder.

## Routing

- "New company / opportunity" → run [`scripts/create-company-from-templates`](scripts/) (creates the dated folder).
- "Analyze this JD" → `{slug}_jd.md`.
- "Prep for an interview / call" → `{slug}_preps.md` plus person notes files under the person-notes convention.
- "Draft referral / intro" → `{slug}_referral_messages.md`.
- "Application write-up" → `{slug}_write_up_application.md`.
- "Take-home" → `{slug}_take_home_assignment.md`.
- "Log the application journey" → `{slug}_diary.md`.

## Conventions

- Company folders are BrainOS task folders: `YYYY_MM_DD_<slug>`.
- The `> Agent note:` blockquote lifecycle (templates carry them; strip once a section is filled; never re-add) is defined in [`docs/person_notes_convention.md`](docs/person_notes_convention.md) — follow it, do not restate it.
- The application diary format lives in [`templates/CompanyName_diary.md`](templates/CompanyName_diary.md).
- A lessons ledger at `agent-memory/workspace-lessons.md` may be created on demand; only distilled, reusable rules go there, per BrainOS conventions.

## Public-safe scope (critical)

Generated company folders under `companies/` are PRIVATE. Never commit, push, or suggest publishing real company data, real interviewer names, or real application content. The committed `templates/` and [`examples/2026_07_05_acme_inc/`](examples/2026_07_05_acme_inc/) stay fictional.

## Changelog

Meaningful or structural changes get a dated line in [`docs/changelog.md`](docs/changelog.md).
