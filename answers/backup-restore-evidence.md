# Tech 05 — Backup and Restoration: Evidence

Summary
- Azure Backup shows successful, recent backups and available recovery points for the protected item. Jobs view for the last 7 days shows no failed jobs.

Evidence — Screenshot paths
- Backup item success + recovery points: `answers/evidence/backups/backup-item-success-2025-10-17.png`
  - Shows: Last backup status = Success (timestamp) and daily recovery points.
- Optional (recommended):
  - Jobs (Last 7 days) filtered view with 0 Failed: `answers/evidence/backups/backup-jobs-last7days-2025-10-17.png`
  - Last successful restore test details: `answers/evidence/backups/restore-test-2025-09-20.png` (or PDF report).

Click path to reproduce onsite
- Azure Portal → Backup center → Backup items → select item → Detailed view.
- From the item, open View jobs → filter “Last 7 days” to confirm 0 Failed.
- From the vault, open Backup Reports → confirm success rate.

Notes
- Keep filenames dated (YYYY-MM-DD). Replace with newer screenshots as you take them.
