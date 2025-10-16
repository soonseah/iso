# Repository Guidelines

## Project Structure & Organization
- Top-level numbered folders hold canonical ISMS documents (PDFs and official forms): `1. ISMS Manual/`, `2. ISMS Procedures/`, `3. Organisational Controls/`, `4. People Controls/`, `5. Physical Controls/`, `6. Technological Controls/`.
- Working drafts, notes, and explainer content live in `answers/` as Markdown.
- Reference files at root: `PREP.md` and `QA.txt`. Do not rename official files or folders.

## Working With Documents
- For minor edits to official documents, propose changes in `answers/` as a Markdown draft, then replace PDFs after review.
- Keep control identifiers (e.g., `ISMS-M-01`, `ISMS-PR-03`) intact and consistently referenced.
- Use ISO dates (`YYYY-MM-DD`) in titles or sections when noting versions.

## Style & Naming
- Markdown only for drafts: new files in `answers/` use kebab-case (e.g., `capacity-plan.md`).
- Headings use sentence case; one `#`-level per section depth; avoid skipping levels.
- Lists use `-` bullets; wrap lines at ~100 characters; prefer plain tables over embedded images.
- Keep filenames with spaces as-is for official artifacts; do not alter canonical names.

## Local Workflow (Commands)
- Search across docs: `rg -n "keyword" answers/` or `rg -n "ISMS-PR-"`.
- Preview Markdown in your editor; optionally export with pandoc if installed.
- Open a specific PDF on macOS: `open "1. ISMS Manual/ISMS-M-01 ISMS Manual.pdf"`.

## QA & Review
- Check spelling, headings order (H1→H2→H3), link validity, and consistent control IDs.
- Ensure tables are readable in raw Markdown. Avoid committing credentials or PII.
- Large or structural changes require a second reviewer before replacing any PDF.

## Commits & Pull Requests
- Follow Conventional Commits. Common types: `docs:`, `chore:`, `fix:`.
  - Examples: `docs: add Azure capacity facts`, `docs: update capacity plan for 2026`.
- PRs include: purpose summary, affected paths, notable decisions, and screenshots of rendered Markdown (if visual changes).
- Link any related tickets or external references used to justify changes.

## Security Notes
- Treat repository contents as sensitive; redact internal URLs, keys, and personal data.
- Do not upload vendor-proprietary content without permission; prefer links to sources.
