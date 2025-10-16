# Evidence Folder

Use this folder to store audit artifacts (reports, exports, screenshots).

Naming
- Use kebab-case with context and date: `openvas-<system>-<yyyy-mm-dd>.pdf`
- Avoid PII and secrets. Redact as needed before committing.

Examples
- Vulnerability report: `openvas-livedemo-2025-10-01.pdf`
- Access review export: `entra-admin-roles-review-2025-10.csv`

Import example
- Copy your existing file into this folder:
  - macOS/Linux: `cp "/Users/tohss/Downloads/OpenVAS Scan livedemo.pdf" answers/evidence/openvas-livedemo-2025-10-01.pdf`

Tips
- Prefer PDFs/CSVs over images for clarity.
- Link evidence from `answers/audit-evidence-checklist.md` and related docs.
