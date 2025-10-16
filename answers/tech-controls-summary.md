# Technical Controls Summary

## Access & IAM
- Prod access approver: CTO SS. Approvals recorded via Jira change tickets; Entra ID PIM used for time‑bound elevation with activation logs.
- MFA enforced for all admin and prod access paths; no break‑glass accounts; no human exceptions. Service principals use cert‑based auth via Key Vault.
- JML: HRIS triggers; manager approves; CTO approves prod; leavers deprovisioned within 4 hours. Quarterly access reviews for Azure subs, prod data stores, and key SaaS (evidence in Jira + Entra logs).

## Change & Deploy
- PR with 2 approvals and linked Jira; protected `main`. GitHub Actions runs plan/build on PR; deploy on `main` requires environment approval (CTO/delegate). Emergency changes logged with same‑day post‑mortem.

## Logging & Monitoring
- Centralized in Cloud Vista (from Azure diagnostic settings). Retention: 30 days hot, 365 days archive. Hosts time‑synced via Azure Time.
- Alerts post to Microsoft Teams; 24/7 on‑call rotation handles escalation.

## Backups & DR
- Targets: RPO 24h (apps) / 15m (datastores). Nightly full + 15m log shipping; AES‑256 at rest.
- Last restore test: 2025‑09‑20, successful in 45m. DR tabletop 2025‑09‑25; RTO met; action items: DNS TTL tuning, runbook clarifications.

## Vulnerability & Patch
- Scanning: OpenVAS weekly (authenticated) across relevant hosts/subnets and SaaS surfaces (where applicable).
- Patch SLAs: Critical 7d, High 14d, Medium 30d, Low 90d. Exceptions tracked in Jira with CTO approval; monthly aging report.

### Vulnerability Findings Snapshot
- Latest report: `answers/evidence/openvas-livedemo-2025-10-01.pdf` (livedemo SaaS).
- Severity counts (Critical/High/Medium/Low): [pending exact extraction from report].
- High-level status: remediation tracked in Jira; follow-up retest scheduled with the next weekly OpenVAS run.

## Incident Response
- Severity matrix Sev1–Sev4. Use Teams incident channel. Preserve Cloud Vista logs and VM snapshots. Post‑incident review within 5 business days.

## Azure Guardrails
- Azure Security Benchmark policy initiative at management group. Require diagnostic settings to Cloud Vista.
- Deny public IP on PaaS; deny public storage; require private endpoints; enforce tags and region; auto‑remediate where possible.

## Encryption & Secrets
- In transit: TLS 1.2+ with HSTS. At rest: AES‑256 (Azure‑managed keys).
- Key/secret management: Azure Key Vault via RBAC; rotation every 180 days (automation targeted). Note: CI/app secrets migration to Key Vault/OIDC tracked in gaps.

## Data & Assets
- Asset inventory: Azure Resource Graph scheduled export + SaaS register; owner per asset.
- Data classification: Public, Internal, Confidential, Restricted. Azure retention tags applied where relevant.

## Network Controls
- Azure Front Door WAF + DDoS Standard; NSGs deny‑by‑default; PaaS via private endpoints.
- No public SSH/RDP; admin access via Azure Bastion. Egress via NAT with allowlists.

## Endpoint Security (Gap Noted)
- MDM/EDR baseline rollout planned; see gaps/actions for interim controls and target date.

## IaC & Pipeline Controls
- Terraform in GitHub. CODEOWNERS enforced; PR requires 2 approvals. GitHub Actions: plan on PR, apply on `main` with environment approval. Weekly scheduled drift check via plan.

## Code & Dependency Scanning
- CodeQL (or Semgrep) on PRs/main. Dependabot/OSV‑Scanner weekly. Gitleaks pre‑commit and CI.

## Production Data Handling
- No raw prod data in non‑prod. Use synthetic data or masked exports with irreversible tokenization as needed. CTO approval required; access and use logged.

## Datastore Access (Elasticsearch)
- Direct production Elasticsearch access limited to designated admins; time‑bound elevation and access via Bastion. Elasticsearch audit logs forwarded to Cloud Vista. Data export requires Jira approval.
