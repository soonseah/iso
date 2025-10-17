# Entra ID Conditional Access — Baseline Policies

Purpose: Simple, auditor‑ready set of CA policies for admin security and legacy auth blocking. Implement in the portal and capture screenshots for evidence.

## Policy Summary
- CA-001 Enforce MFA for Admins — Require MFA for all privileged roles on all apps; session: 8h sign‑in, no persistent browser.
- CA-002 Block Legacy Authentication — Block basic/legacy protocols tenant‑wide for all users.
- CA-003 Admin Portals on Compliant Devices — Require compliant device + MFA for Azure/M365 admin portals.
- CA-004 Enforce MFA for All Users — Baseline MFA for all cloud apps (supports non‑admin users).
- CA-005 Secure Security Info Registration — Require MFA to register/modify authentication methods.

## CA-001 Enforce MFA for Admins
- Users/Groups: Include Directory roles (Global Admin, Privileged Role Admin, User Admin, Security Admin, etc.). Exclude: none (no break‑glass accounts).
- Cloud apps: All cloud apps.
- Conditions: Client apps = Browser + Mobile/desktop; locations = Any.
- Grant: Require multifactor authentication.
- Session: Sign‑in frequency 8 hours; Persistent browser session = Never persistent.

## CA-002 Block Legacy Authentication
- Users: All users.
- Assignments: Client apps = Other clients + Legacy protocols.
- Grant: Block access.

## CA-003 Admin Portals on Compliant Devices
- Users: Directory roles (same as CA‑001).
- Cloud apps: Microsoft Azure Management, Microsoft Entra admin center, Microsoft 365 admin portal.
- Grant: Require multifactor authentication AND Require device to be marked as compliant.

## CA-004 Enforce MFA for All Users
- Users: All users (exclude specific break‑glass if ever created; currently none).
- Cloud apps: All cloud apps.
- Grant: Require multifactor authentication.

## CA-005 Secure Security Info Registration
- User actions: Register security information.
- Users: All users.
- Grant: Require multifactor authentication.

## Portal Steps (Screenshots to Capture)
- Entra ID > Protection > Conditional Access > Policies: create each policy above using New policy wizard.
- For CA‑001/003: capture Assignments (Users, Cloud apps), Conditions, Grant, and Session tabs.
- For CA‑002: capture Client apps (legacy) and Grant = Block.
- Entra ID > Security > Authentication methods: show MFA methods enabled.
- Entra ID > Sign‑in logs (filter Admin roles): show MFA requirement applied.

Notes
- Test with a pilot group before broad enablement; then switch to “On” once validated.
- Keep policy names exactly as above for consistent evidence and automation.
