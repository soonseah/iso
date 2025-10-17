# Tech 06 — Logging and Monitoring: Evidence

Summary
- Logs from Azure subscriptions and key services stream to Cloud Vista. We have active SIEM analytics and alert rules; security events are posted to Microsoft Teams.

Evidence — Screenshot paths
- Cloud Vista log analytics query (events visible): `answers/evidence/logging/cloud-vista-log-analytics-2025-10-17.png`
- Diagnostic settings “Send to Cloud Vista” enabled (example resource, e.g., Key Vault/App Gateway): `answers/evidence/logging/diagnostic-settings-enabled-2025-10-17.png`
- Alert rules list (admin role changes, failed sign-ins, policy non‑compliance, public IP creation, KV secret read, high error rates): `answers/evidence/logging/alert-rules-2025-10-17.png`
- Teams alert example (Security-Alerts channel): `answers/evidence/logging/teams-alert-sample-2025-10-17.png`

Click path to reproduce onsite
- Azure Portal → Any resource (e.g., Key Vault) → Diagnostic settings → confirm destination Cloud Vista.
- Azure Portal → Monitor → Alerts → Alert rules → show configured rules.
- Cloud Vista → Log Analytics → search: verify recent Azure audit/sign-in/Key Vault events.
- Microsoft Teams → Security-Alerts channel: show recent alert message.

Notes
- Keep filenames dated (YYYY-MM-DD). Replace with newer screenshots as they are captured.
