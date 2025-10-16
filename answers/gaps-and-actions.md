# Gaps and Actions

## Secrets Management (CI/CD & Apps)
- Gap: Not fully implemented Key Vault + OIDC + automated rotation.
- Interim controls: Restrict GitHub environment secrets to maintainers; manual rotation every 90 days tracked in Jira.
- Owner: DevOps lead. Target: 2025-12-31 to migrate to Azure Key Vault + GitHub OIDC; production first.

## Endpoint Security (MDM/EDR)
- Gap: No unified MDM/EDR, full‑disk encryption policy, or local admin controls.
- Interim controls: Manually enforce FileVault/BitLocker, weekly OS updates, 5‑minute auto‑lock, no local admin (request‑based elevation), monthly attestation checklist.
- Owner: DevOps lead. Target: 2025-12-31 to roll out Intune + Defender baseline.

## Vulnerability Coverage (OpenVAS‑only)
- Note: Scanning relies on OpenVAS weekly; consider augmenting with container and SCA scanners for depth.
- Action: Evaluate Trivy (containers) and OSV‑Scanner (deps) in CI; document scope/waivers.
- Owner: Security engineering. Target: 2025-06-30.
