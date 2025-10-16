# Audit Evidence Checklist (Tech)

- Access approvals: Jira change ticket with CTO SS approval; Entra ID PIM activation logs.
- MFA enforcement: Policy screenshots; sample login showing MFA; list of admin roles.
- JML: HRIS trigger example; deprovision ticket within 4h; quarterly access review export (Azure/SaaS).
- Change control: Example PR with 2 approvals and linked Jira; GitHub branch protection and environment approval settings; emergency change record + post‑mortem.
- Logging/Monitoring: Cloud Vista workspace config; diagnostic settings samples; retention settings; Teams alert screenshot and recent alert→ticket example.
- Backups/DR: Backup policy export; encryption settings; 2025‑09‑20 restore test report/log; DR tabletop notes and action items.
- Vulnerability: OpenVAS last scan summary and findings; remediation aging report; SLA/exception tickets.
  - Sample report to include: `answers/evidence/openvas-livedemo-2025-10-01.pdf` (from `~/Downloads/OpenVAS Scan livedemo.pdf`).
- Incident response: Runbook; recent incident timeline; preserved logs/snapshots evidence; 5‑day post‑incident review.
- Azure guardrails: Policy initiative assignment; deny rules evidence; compliance view; auto‑remediation task.
- Encryption/Secrets: TLS configuration; at‑rest encryption evidence; (gap) plan for Key Vault/OIDC + interim controls ticket.
- Assets/Data: Azure Resource Graph export; SaaS register; data classification policy.
- Network: Front Door WAF policy; DDoS Standard enablement; NSG examples; Bastion access path; private endpoints.
- IaC & CI: Terraform repo link; CODEOWNERS; CI logs showing plan/apply and approvals; weekly drift check evidence.
- Code scanning: CodeQL/Semgrep results; Dependabot/OSV‑Scanner reports; Gitleaks run sample.
- Prod data handling: Approval for any masked export; anonymization method.
- Datastore (Elasticsearch): Admin group membership; Bastion access record; audit log excerpts; Jira approval for data export.
