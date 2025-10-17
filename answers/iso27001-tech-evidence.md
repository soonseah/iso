# ISO 27001 — Technical Evidence Pack

This pack contains screenshot-based evidence for the requested controls.

## Tech 04 — Admin Console Security (Azure)
- Security defaults enabled (MFA for admins; legacy/basic auth blocked).
- Microsoft 365 modern authentication ON; POP/IMAP/SMTP AUTH OFF.
- Per‑user MFA “Enforced” for admin accounts.

Screenshots

![Security defaults enabled](answers/evidence/admin-security/security-defaults-enabled-2025-10-17.png)

![Modern authentication ON; legacy protocols OFF](answers/evidence/admin-security/m365-modern-auth-enabled-2025-10-17.png)

![Per-user MFA enforced](answers/evidence/admin-security/per-user-mfa-enforced-2025-10-17.png)

## Tech 05 — Backup and Restoration
- Backup item shows Last backup status = Success; daily recovery points present.
- Jobs (Last 7 days) show 0 Failed; restore test record available.

Screenshots

![Backup item success + recovery points](answers/evidence/backups/backup-item-success-2025-10-17.png)

![Jobs last 7 days: 0 failed](answers/evidence/backups/backup-jobs-last7days-2025-10-17.png)

## Tech 06 — Logging and Monitoring (Cloud Vista)
- Logs streaming and visible in SIEM (Cloud Vista Log Analytics).
- Diagnostic settings sending to Cloud Vista; alert rules configured.

Screenshots

![Cloud Vista log analytics events](answers/evidence/logging/cloud-vista-log-analytics-2025-10-17.png)

![Diagnostic settings enabled](answers/evidence/logging/diagnostic-settings-enabled-2025-10-17.png)

![Alert rules list](answers/evidence/logging/alert-rules-2025-10-17.png)

## Tech 10 — SDLC & Application Security
- TLS configured with modern protocols and ciphers; HSTS where supported.
- Server-side password hashing using strong algorithm.

Screenshots (embedded):

![TLS configuration 1](answers/evidence/appsec/tls-config-1-2025-10-17.png)

![TLS configuration 2](answers/evidence/appsec/tls-config-2-2025-10-17.png)

![Application crypto code](answers/evidence/appsec/encryption-code-2025-10-17.png)
