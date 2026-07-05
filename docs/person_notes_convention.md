# Person notes convention

Human-readable interview prep and call notes live in one file per interviewer. Agents follow these rules when creating, filling, or editing `{company}_{person}_notes.md` files.

## Single-file model

- One file holds full pre-call prep (`## preps`) and post-call capture (`## Notes in call`).
- Keep the full prep scaffold permanently. Do not shorten, externalize, or delete pre-call sections after the call.
- File naming: `{company_slug}_{person_slug}_notes.md` at the company folder root or under `people/` when already in use.
- Sibling company files (agents infer these; do not cite in prose): `{slug}_company.md`, `{slug}_preps.md`, `{slug}_jd.md`, other `*_notes.md`, optional `{slug}_people.md` index.

## What belongs in the file body

### Keep

- Full `## preps` scaffold: Timeless read, Career chronology, Places lived, Topical context, Ask these Qs (all subsections), round-format notes when relevant.
- Human outreach context as words: "LinkedIn message 2026-05-28", "recruiter screen via mutual contact", not record IDs or CRM URLs.
- `## Notes in call` (or dated `## Notes from call — YYYY-MM-DD (topic)`): what the person said, probes, signals, actions. Source of truth for debrief and cross-round continuity.
- Inside each call section, keep `### Personal / rapport` (or personal bullets at the top of `### About the person`) for hobbies, family, travel, gifts, weekends, location, and warm follow-up hooks. This block is dedup-safe: do not collapse it into one summary line when tightening decision or workload notes.

### Do not add to filled files

- `> Agent note:` blockquotes (instructions for agents, not for you or share recipients).
- CRM contact IDs, note IDs, CRM URLs, snapshot tables, or deep links to external systems.
- Wiki-style routing: "see `other_person_notes.md`", "cover in company notes file".
- Per-person subheadings under cross-round questions when every bullet already names the person.
- Workspace bibliographies: `Related files:`, header `Research sources: …` with local paths, or `see \`filename.md\`` routing in person/prep notes.

## No in-file source listings (person and prep notes)

- Do not append `### Sources used` or `## Sources used` with local file paths to person notes after debrief or prep.
- Do not add header lines like `Sources: LinkedIn export` with long path lists. Optional single phrase in Timeless read is enough ("from LinkedIn, May 2026").
- Cross-doc facts: write the fact in prose; no `see \`filename.md\`` in person notes.

## Web sources in research and company docs (keep)

- Company research, M&A memos, funnel analysis, and similar synthesis files should keep `## Web sources` (or `## Web citations`) with URLs for proof-checking.
- Strip local-only bullets from those sections (`Local file: \`foo.md\``, folder path lists). Do not strip URL lines.

## Agent blockquote lifecycle

| When | Rule |
|------|------|
| New company from template | Templates include blockquotes; agent strips them as each section is filled. |
| Editing an existing file | Never re-add `> Agent note` blockquotes. Read template + this doc instead. |
| Empty `####` section | Leave heading; no blockquote. Read template when populating. |

One-line HTML footer at file bottom (invisible in most readers):

```html
<!-- agent: section rules in templates/CompanyName_PersonName_notes.md and docs/person_notes_convention.md; do not re-add Agent note blockquotes here -->
```

## Cross-round questions

Under `#### Ask these Qs`, use a flat subsection:

```markdown
(from prior conversations at this company)
- Prior interviewer said every customer is shocked when POC GTM cannot go to production. What is your view on improving that handoff?
- Another interviewer framed self-service as the biggest opportunity. From your day to day, what is realistic in 6-12 months?
```

- Attribution in the bullet text ("Prior interviewer said…", "Another interviewer framed…").
- No grouped subsections like `#### From [name]` when bullets already name the person.
- Dedupe only exact duplicate bullets.

Other Ask these Qs subsections stay: `(good base)`, `(for recruiter)`, `(for hiring manager)`, person-specific career questions.

## Merge protocol (before any write)

Applies to prep fill, transcript ingest, debrief, and email paste into `{company}_{person}_notes.md`.

1. Read the entire file (`## preps` and all of `## Notes in call`).
2. Identify the call date (or email date) for new material.
3. If that call already has a subsection, merge net-new bullets only; do not add a parallel export tree for the same date.
4. If it is a new call, add one subsection, e.g. `### Call 2026-05-22 (prep + scheduling)`, with human structure (about person, role/company, signals, debrief).
5. Prep vs call overlap: facts already in Timeless read or career tables do not repeat in call notes unless updated or contradicted (note the delta in one line).
6. Subsequent calls with the same person: carry forward only new quotes, process changes, and corrected names; do not re-import stable company metrics.
7. Debrief substance stays under that call as `#### Debrief (YYYY-MM-DD)`; keep coaching scores and pattern tables in your separate coaching notes if you use them. No second copy of the same narrative in the person file.
8. Chat audit trails list files read in the reply only; never append a Sources section to the markdown file.

## Prose to remove from person notes

| Pattern | Action |
| --- | --- |
| Errata / correction banners | Apply corrected names once in Timeless read or role bullets; delete banner |
| `Source:` / `Canonical use:` lines | Delete; keep facts under the dated call or email subsection |
| Duplicate export trees for the same call | One narrative per call date; merge unique facts |
| Coach-workflow capture sections with score tables | Move emotional read, stories used, risks, next prep into `#### Debrief (date)` under that call; strip workflow labels and pointers to other sections |
| Soft file routing (`use company.md`, `see notes above`) | State the fact in prose; no filename or intra-file routing |
| `Cross-meeting context (not from the X call)` meta | Keep the fact if useful; drop the meta label |
| Raw transcript scratchpad code blocks | Drop when facts are already in the call subsection |

Keep in person notes: full `## preps`; human call structure; one integrated email/recruiter write-up; optional short `#### Open checks`; HTML agent footer.

## Deduplication and post-call consolidation

When tightening, merging, or deduplicating person notes after a call:

| Safe to merge / compress | Do not strip |
| --- | --- |
| Repeated workload, product, or commercial bullets across duplicate subsections | `### Personal / rapport` facts (hobbies, trips, family, weekends, timezone examples) |
| Completed in-call prep checklists (replace with one line: "prep used; see dated call below") | Evidence snippets the user may reuse in thank-you or follow-up |
| Duplicate question banks (keep one priority list) | Meeting or transcript ID on the dated call header when a transcript exists |

Rules:

- Prefer dated call subsections (`## Notes from call — 2026-06-02 (workload follow-up)`) over folding multiple calls into one undated block.
- Within one call section, use tables or short lists for decision themes; keep personal context as its own subsection.
- If personal rapport may have been lost in an earlier edit, re-read the transcript or user paste before finalizing dedup.
- Do not delete `## preps` scaffold to save space; dedup applies to post-call capture only.

## Company-level files (preps, jd, take-home)

Same hygiene for human-facing filled files:

- Strip `> Agent note:` from filled `*_preps.md`, `*_jd.md`, `*_take_home*.md`, `*_company.md` when sections have real content.
- Templates under `templates/` keep blockquotes for greenfield copy only.
- JD file holds structured JD analysis; polished interview answers belong in `*_preps.md`.

## Reference

- Template: `templates/CompanyName_PersonName_notes.md`
- This convention pairs with the company templates in this repo.
