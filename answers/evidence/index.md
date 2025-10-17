# Evidence Index (Latest-first by category)

This index lists the latest approved evidence per category to avoid duplicates. Add new items under the category and update the “Latest” line.

- Vulnerability Reports
  - Latest: `answers/evidence/vulnerability/openvas-livedemo-2025-10-01.pdf`
  - Archive: place older reports in the same folder; keep date in filename `openvas-<system>-YYYY-MM-DD.pdf`.

- Access Reviews
  - Latest: [pending]
  - Notes: export from Entra/GH/Azure as CSV with date in filename.

- Backups & Restore Tests
  - Latest: `answers/evidence/backups/backup-item-success-2025-10-17.png`
  - Also attach: `answers/evidence/backups/backup-jobs-last7days-2025-10-17.png` (0 failed jobs)
  - Notes: include restore test log/report and date.

- Change Control (PR examples, settings)
  - Latest: [pending]
  - Notes: link to PR or export settings screenshots to PDF.

- Logging/Monitoring
  - Latest: `answers/evidence/logging/cloud-vista-log-analytics-2025-10-17.png`
  - Also attach: `answers/evidence/logging/diagnostic-settings-enabled-2025-10-17.png` (diagnostic settings → Cloud Vista)
  - Also attach: `answers/evidence/logging/alert-rules-2025-10-17.png` (alert rules list)
  - Also attach: `answers/evidence/logging/teams-alert-sample-2025-10-17.png` (Teams alert)
  - Notes: Cloud Vista config, retention, alert screenshot.

- Incidents (redacted)
  - Latest: [pending]
  - Notes: timeline, lessons, evidence of preservation.

- Azure Guardrails/Policy
  - Latest: [pending]
  - Notes: policy assignment/export.

- SDLC & Application Security (Tech 10)
  - Latest: `answers/evidence/appsec/tls-config-1-2025-10-17.png`
  - Also attach: `answers/evidence/appsec/tls-config-2-2025-10-17.png` (Tomcat/server TLS)
  - Also attach: `answers/evidence/appsec/encryption-code-2025-10-17.png` (application crypto evidence)
  - Notes: TLS min 1.2/1.3, modern ciphers, and crypto in code.

- Azure Admin Security (Tech 04)
  - Latest: `answers/evidence/admin-security/security-defaults-enabled-2025-10-17.png`
  - Also attach: `answers/evidence/admin-security/m365-modern-auth-enabled-2025-10-17.png` (Modern authentication ON; legacy protocols OFF)
  - Also attach: `answers/evidence/admin-security/per-user-mfa-enforced-2025-10-17.png` (Per-user MFA enforced for admins)
  - Also attach: `answers/evidence/admin-security/admin-role-assignments-2025-10-17.png` (Admin role assignments)
  - Also attach: `answers/evidence/admin-security/admin-signin-logs-mfa-2025-10-17.png` (Admin sign-in logs show MFA)
  - Notes: also generate `answers/evidence/azure/conditional-access-summary.txt` via `bash scripts/verify-tech04.sh` for text evidence.

Guidelines
- Keep only the most recent item marked as “Latest” in each category; retain older files for history.
- Filenames include the date; prefer PDFs/CSVs; redact sensitive data before committing.
