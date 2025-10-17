# Tech 04 — Azure Admin Security: Verification Guide

Run the commands below with an account that has Conditional Access Administrator (or Global Administrator). These commands produce concrete evidence files under `answers/evidence/azure/`.

## Quick Run (recommended)
- Prereqs: `az login` and consent for Microsoft Graph as prompted by `az rest`.
- Execute:
  - `bash scripts/verify-tech04.sh`
- Outputs:
  - `answers/evidence/azure/conditional-access-policies.json`
  - `answers/evidence/azure/conditional-access-summary.txt`
  - `answers/evidence/azure/legacy-auth-block-check.txt`
  - `answers/evidence/azure/mfa-admin-roles-check.txt`
  - `answers/evidence/azure/mfa-admin-policy.json`
  - `answers/evidence/azure/authentication-methods-policy.json`

## What Auditors Look For (Pass Criteria)
- Legacy authentication blocked: a policy targeting `exchangeActiveSync`/`other` with `grantControls = block` and `state = enabled`.
- MFA enforced for admin roles: policy with `grantControls` containing `mfa`, `includeRoles` non‑empty, `state = enabled`.
- Session/Device hardening: admin policies with sign‑in frequency and `compliantDevice` where applicable (see `mfa-admin-policy.json`).
- Authentication methods policy shows MFA methods enabled and registration control.

## Optional Portal Screenshots
- Entra ID > Conditional Access > Policies list (showing CA‑001/002/003 “On”).
- CA‑002 policy: Client apps (legacy) + Grant = Block.
- CA‑001 policy: Grant = Require multifactor; Session = Sign‑in frequency 8h; Persistent browser = Never.
- PIM settings: Entra ID > Roles & administrators > Privileged Identity Management > Settings (time‑bound + MFA).

## Tips
- Start policies in Report‑only; validate via Sign‑in logs; then enable.
- Keep names consistent with `answers/entra-conditional-access-baseline.md` for clarity.
