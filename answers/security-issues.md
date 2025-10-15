# Security Issues & Remediation

**Last Updated:** 2025-10-15

---

## Critical Issues

### 1. Outdated Kubernetes Version (aksau cluster)

**Issue**: Australia East AKS cluster running Kubernetes v1.22.6

**Risk Level**: 🔴 CRITICAL

**Details**:
- Kubernetes v1.22.6 was released in 2021
- This version is no longer supported by Kubernetes community
- Contains known security vulnerabilities
- May not receive security patches from Azure

**Impact**:
- Potential security vulnerabilities
- Compliance failure for ISO 27001 (lack of patch management)
- May fail security audits
- Compatibility issues with modern tooling

**Remediation**:
```bash
# Recommended steps:
1. Check upgrade path: az aks get-upgrades --resource-group core_au --name aksau
2. Plan upgrade window with team
3. Test upgrade in non-prod first (if possible)
4. Upgrade cluster: az aks upgrade --resource-group core_au --name aksau --kubernetes-version <target-version>
5. Verify workloads after upgrade
```

**Target**: Upgrade to Kubernetes v1.26.x or v1.27.x (match main cluster or newer)

**Estimated Effort**: 4-8 hours (including planning and testing)

**Owner**: TBD

**Deadline**: Within 2 weeks

---

### 2. AKS Monitoring Disabled

**Issue**: Main AKS cluster (aks) has OMS agent disabled - monitoring not enabled

**Risk Level**: 🔴 CRITICAL

**Details**:
- No container logs being collected
- No performance metrics for pods/containers
- Cannot detect security incidents or anomalies in AKS
- Cannot troubleshoot application issues effectively

**Impact**:
- ISO 27001 requirement for logging and monitoring (A.12.4.1)
- Cannot detect security breaches
- Poor incident response capability
- Difficult to troubleshoot production issues

**Remediation**:
```bash
# Enable monitoring with Log Analytics
az aks enable-addons \
  --resource-group core_sea \
  --name aks \
  --addons monitoring \
  --workspace-resource-id /subscriptions/9dd85c82-2a04-45f0-891a-959d1fab5cd4/resourceGroups/DefaultResourceGroup-EAU/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU
```

**Target**: Enable monitoring on both AKS clusters

**Estimated Effort**: 2 hours

**Owner**: TBD

**Deadline**: Within 1 week

---

### 3. No Documented Backup Restore Testing

**Issue**: Backups are running but no evidence of restore testing

**Risk Level**: 🟡 HIGH

**Details**:
- Daily snapshots are being created
- 3 backup vaults configured
- No documentation of successful restore tests
- Unknown if backups are actually recoverable

**Impact**:
- ISO 27001 requirement (A.12.3.1 - Information backup)
- May not be able to recover in disaster scenario
- Backups may be corrupted/incomplete
- RTO/RPO unknown

**Remediation**:
1. Document current backup configuration
2. Schedule restore test in non-production
3. Test VM restore from snapshot
4. Test AKS persistent volume restore
5. Document restore procedures
6. Establish quarterly restore testing schedule

**Target**: Complete first restore test and document procedures

**Estimated Effort**: 4-6 hours

**Owner**: TBD

**Deadline**: Within 3 weeks

---

### 4. Excessive External User Access

**Issue**: 17 external/guest users in Azure AD - unclear if all still need access

**Risk Level**: 🟡 HIGH

**Details**:
- 4 contractors from d-connect.net
- 3 partners from atos.net
- 2 customer users from m1.com.sg
- 3 China office users
- 5 other external users (consultants, interns)

**Impact**:
- ISO 27001 requirement for access control (A.9.2.1)
- Potential unauthorized access
- Principle of least privilege not enforced
- No documented access review process

**Remediation**:
1. Create spreadsheet of all external users
2. Contact managers/sponsors to verify need
3. Remove accounts that are no longer needed
4. Document remaining accounts and their purpose
5. Establish quarterly access review process
6. Implement expiration dates for guest accounts

**Target**: Complete access review and remove unnecessary accounts

**Estimated Effort**: 4-6 hours

**Owner**: TBD

**Deadline**: Within 2 weeks

---

## High Priority Issues

### 5. Service Principals Not Audited

**Issue**: Cannot list service principals with current permissions

**Risk Level**: 🟡 HIGH

**Details**:
- Service principals have programmatic access to Azure
- Unknown how many exist
- Unknown what permissions they have
- Credentials may not be rotated regularly

**Impact**:
- ISO 27001 requirement for privileged access management
- Potential unauthorized access via service principals
- Credentials may be hardcoded or exposed
- Cannot audit who/what has access

**Remediation**:
1. Obtain Global Admin or equivalent permissions to audit
2. List all service principals: `az ad sp list --all`
3. Document each service principal and its purpose
4. Review permissions granted to each
5. Rotate credentials for all service principals
6. Document credential rotation schedule
7. Consider using Managed Identities instead

**Target**: Complete audit and document all service principals

**Estimated Effort**: 4-8 hours

**Owner**: TBD (needs higher Azure AD permissions)

**Deadline**: Within 3 weeks

---

### 6. Secrets Management Not Documented

**Issue**: Unclear how production secrets are managed

**Risk Level**: 🟡 HIGH

**Details**:
- Key Vault exists but only in dev/AI environment
- Unknown if production uses Key Vault
- May be using environment variables or Kubernetes secrets
- No documented rotation policy

**Impact**:
- ISO 27001 requirement for cryptographic controls (A.10.1.2)
- Secrets may be exposed in code or logs
- Difficult to rotate secrets
- Unclear who has access to secrets

**Remediation**:
1. Document current secrets management approach
2. Verify if production uses Key Vault
3. Check for hardcoded secrets in code/configs
4. Implement Key Vault for production secrets
5. Migrate secrets to Key Vault
6. Document Key Vault access policies
7. Establish secrets rotation schedule
8. Use Managed Identities where possible

**Target**: Document current state and migrate to Key Vault

**Estimated Effort**: 8-16 hours

**Owner**: TBD

**Deadline**: Within 4 weeks

---

### 7. SSH Key Management Not Documented

**Issue**: 4 SSH public keys in Azure, private key management unknown

**Risk Level**: 🟡 HIGH

**Details**:
- oraclexe_key, m1-emedge1_key, albert-ssh, ubuntu-test1_key
- Unknown who has access to private keys
- No key rotation policy
- May be shared across team members

**Impact**:
- ISO 27001 requirement for secure authentication
- Potential unauthorized VM access
- Difficult to revoke access
- Keys may be compromised

**Remediation**:
1. Audit who has private keys
2. Document approved key usage
3. Implement key rotation policy
4. Consider using Azure Bastion instead (already deployed)
5. Disable direct SSH where Bastion is available
6. Generate new keys for departing employees

**Target**: Document SSH key management and implement rotation

**Estimated Effort**: 2-4 hours

**Owner**: TBD

**Deadline**: Within 3 weeks

---

## Medium Priority Issues

### 8. Log Retention Policy Not Documented

**Issue**: Unknown how long logs are retained

**Risk Level**: 🟠 MEDIUM

**Details**:
- Log Analytics workspace exists
- Application Insights configured
- Default retention is typically 30-90 days
- ISO 27001 may require longer retention

**Impact**:
- May not meet compliance requirements
- Insufficient data for forensic investigation
- Logs may be deleted before audit

**Remediation**:
```bash
# Check current retention
az monitor log-analytics workspace show \
  --resource-group DefaultResourceGroup-EAU \
  --workspace-name DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU \
  --query retentionInDays

# Set retention (example: 180 days)
az monitor log-analytics workspace update \
  --resource-group DefaultResourceGroup-EAU \
  --workspace-name DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU \
  --retention-time 180
```

**Target**: Define and implement log retention policy (recommend 180+ days)

**Estimated Effort**: 2 hours

**Owner**: TBD

**Deadline**: Within 4 weeks

---

### 9. Alert Notification Recipients Unknown

**Issue**: Alert rules configured but unclear who receives notifications

**Risk Level**: 🟠 MEDIUM

**Details**:
- Alert rules exist for m1-emedge1 VM
- Action groups: RecommendedAlertRules-AG-1, Application Insights Smart Detection
- Unknown who is in action groups
- May not reach right people during incident

**Impact**:
- Delayed incident response
- Alerts may go unnoticed
- Cannot meet RTO requirements

**Remediation**:
```bash
# Check action group members
az monitor action-group show \
  --resource-group core_sea \
  --name RecommendedAlertRules-AG-1

# Document recipients
# Add/remove members as needed
```

**Target**: Document alert recipients and update as needed

**Estimated Effort**: 2 hours

**Owner**: TBD

**Deadline**: Within 4 weeks

---

### 10. No AKS-Level Alerting

**Issue**: Alerts configured for VMs but not for AKS clusters

**Risk Level**: 🟠 MEDIUM

**Details**:
- 14 nodes across 2 AKS clusters
- No alerts for node health, pod failures, resource exhaustion
- Cannot proactively detect issues

**Impact**:
- Service degradation may go unnoticed
- Cannot meet SLA commitments
- Poor customer experience

**Remediation**:
1. Enable AKS monitoring (see issue #2)
2. Configure alerts for:
   - Node CPU/memory
   - Pod restart count
   - Failed pod count
   - PersistentVolume capacity
   - Ingress 5xx errors
3. Add to appropriate action groups

**Target**: Configure comprehensive AKS alerting

**Estimated Effort**: 4 hours

**Owner**: TBD

**Deadline**: Within 4 weeks (after enabling monitoring)

---

## Low Priority Issues

### 11. VM Patch Management Not Documented

**Issue**: Unknown how VMs are patched

**Risk Level**: 🟢 LOW (assuming Azure auto-updates enabled)

**Details**:
- 4 Linux VMs in production
- Unknown patch schedule
- May be using Azure auto-update

**Remediation**:
1. Verify Azure auto-update status
2. Document patch management process
3. Establish patch testing procedure
4. Define maintenance windows

**Estimated Effort**: 2 hours

---

### 12. Container Image Scanning Not Verified

**Issue**: Unknown if container images are scanned for vulnerabilities

**Risk Level**: 🟢 LOW

**Details**:
- Using Azure Container Registry (netgain)
- May have vulnerability scanning enabled
- Not verified

**Remediation**:
```bash
# Check if Defender for Container Registries is enabled
az security pricing show --name ContainerRegistry

# Enable if not already
az security pricing create --name ContainerRegistry --tier Standard
```

**Estimated Effort**: 1 hour

---

## Summary

| Priority | Issue Count | Must Fix For ISO 27001 |
|----------|-------------|------------------------|
| Critical | 4           | Yes                    |
| High     | 4           | Yes                    |
| Medium   | 3           | Recommended            |
| Low      | 2           | Nice to have           |

**Total Issues**: 13

**Estimated Total Effort**: 45-71 hours

**Recommended Timeline**: 4-6 weeks to address all critical and high priority issues

---
