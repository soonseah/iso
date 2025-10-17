# Admin Security (No Azure Premium) — Justification & Evidence

Purpose
- Demonstrate secure admin access without Conditional Access/PIM by using Security defaults, per‑user MFA, legacy protocol blocking, least privilege, and log reviews. Suitable for ISO 27001 Annex A controls (A.5.15, A.5.18, A.8.3, A.8.16).

Controls Implemented
- Security defaults: Enabled tenant‑wide (enforces MFA for admins; blocks legacy/basic auth paths).
- Per‑user MFA: Enforced for all admin accounts (e.g., Global Admin, User Admin).
- Modern auth only: Microsoft 365/Exchange modern auth ON; POP/IMAP/SMTP AUTH disabled.
- Least privilege: Minimal admin role assignments (primary: CTO SS); quarterly review recorded in Jira/CSV.
- Monitoring: Entra ID sign‑in logs reviewed; admin sign‑ins show MFA satisfied.
- No break‑glass accounts.

Evidence — Screenshots/Exports to Attach
- Entra ID → Properties → Manage security defaults → “Enabled”.
  - Add file: `answers/evidence/admin-security/security-defaults-enabled-2025-10-17.png` (or latest).
- Microsoft 365 admin center → Settings → Org settings → Modern authentication → Modern auth ON; POP/IMAP/SMTP AUTH OFF.
  - Add file: `answers/evidence/admin-security/m365-modern-auth-enabled-2025-10-17.png` (or latest).
- Entra ID → Users → Per‑user MFA → Multi‑Factor Authentication portal: admin users status “Enforced”.
  - Add file: `answers/evidence/admin-security/per-user-mfa-enforced-2025-10-17.png` (or latest).
- Entra ID → Roles and administrators → Global administrator (and other roles) → Assignments: shows only approved admins.
  - Add file: `answers/evidence/admin-security/admin-role-assignments-2025-10-17.png` (or latest).
- Entra ID → Sign‑in logs → filter by admin users → column “Authentication requirement” = “Multi‑factor authentication”.
  - Add file: `answers/evidence/admin-security/admin-signin-logs-mfa-2025-10-17.png` (or latest).
- Quarterly access review record (CSV export or Jira ticket link).

Risk Treatment & Improvement Plan
- Residual risk accepted given no CA/PIM licensing. Compensating controls: MFA enforcement, legacy auth blocked, limited admins, log reviews, quarterly access reviews.
- Improvement (when licensing available): adopt Conditional Access (MFA for admins/all users; block legacy), compliant‑device requirement for admin portals, and PIM for time‑bound elevation.

Auditor Talking Points
- “Security defaults and per‑user MFA enforce strong authentication and block legacy protocols for admin access. Admin roles are tightly limited, reviewed quarterly, and monitored through sign‑in logs. This meets our risk profile; CA/PIM is on our improvement roadmap.”

Facts Verified (tie to screenshots above)
- Security defaults: Enabled.
- Modern authentication: Enabled; POP/IMAP/SMTP AUTH disabled.
- Per‑user MFA: Admin accounts show status “Enforced”.
- Role assignments: Only approved admins assigned to privileged roles.
- Sign‑in logs: Admin sign‑ins show MFA required/satisfied.
