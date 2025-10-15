# Backup & Recovery Procedures

**Last Updated:** 2025-10-15

---

## Backup Infrastructure

### Azure Backup Vaults

1. **main-vault**
   - **Type**: Data Protection Backup Vault
   - **Location**: Southeast Asia
   - **Resource Group**: core_sea
   - **Status**: ✅ Active

2. **main-vault-au**
   - **Type**: Data Protection Backup Vault
   - **Location**: Australia East
   - **Resource Group**: core_au
   - **Status**: ✅ Active

3. **recovery-vault-sea**
   - **Type**: Recovery Services Vault
   - **Location**: Southeast Asia
   - **Resource Group**: core_sea
   - **Status**: ✅ Active

---

## Backup Schedule

### Virtual Machines

**Automated Daily Backups**: ✅ Enabled

**VMs with Backup**:
- m1-emedge1 (core_sea)
- ubuntu-test1 (core_sea)
- emedge-vm1 (rg-emedge-HA-test) - ❓ Need to verify
- emedge-vm2 (rg-emedge-HA-test) - ❓ Need to verify

**Backup Schedule**:
- **Frequency**: Daily
- **Time**: Around 12:30 PM SGT (based on snapshot timestamps)
- **Backup Type**: Azure VM snapshot

**Evidence**: Snapshots visible from Oct 7-14, 2025:
- AzureBackup_fa42e21e-7ba9-4d7e-b366-a7b2f240a294_*
- AzureBackup_74c7512c-bdc6-438d-a638-b41aa727887c_*
- AzureBackup_9e27e2f1-7005-4e6a-a071-6cdb1556bfb1_*

---

### Kubernetes Persistent Volumes

**Status**: ❓ Need to document:
- [ ] Are PVCs backed up? (via Velero, Kasten, or Azure Backup for AKS?)
- [ ] Backup schedule for PVCs
- [ ] What data is on PVCs (databases, application data)
- [ ] Snapshot policy for persistent storage

**Recommendation**: Implement dedicated K8s backup solution (Velero recommended)

---

### Databases

**Elasticsearch** (Observability platform data):
**Status**: ❓ Need to document:
- [ ] Snapshot schedule
- [ ] Snapshot repository (Azure Storage?)
- [ ] Snapshot retention
- [ ] Automated or manual backups

**CRM Database**:
**Status**: ❓ Need to document:
- [ ] Backup method (database dumps, snapshots)
- [ ] Backup schedule
- [ ] Backup storage location
- [ ] Backup encryption

**MongoDB** (if used):
**Status**: ❓ Need to document:
- [ ] Backup strategy (mongodump, Atlas backup)
- [ ] Backup schedule
- [ ] Backup verification

---

## Backup Retention

### Confirmed Retention Periods

**Infrastructure Backups**: ✅ **3 years** (mostly)
- VM snapshots: 3 years
- Disk backups: 3 years
- System state: 3 years

**Application Logs**: ✅ **1 year** (in Cloud Vista)

**Monitoring Data**: ❓ Need to confirm
- Metrics in Elasticsearch: ❓
- Logs in Elasticsearch: 1 year
- Azure Monitor data: ❓

---

### Retention Policy Requirements

**ISO 27001 Recommendations**:
- Critical system backups: 1-3 years minimum
- Financial records: 7 years (if applicable)
- Audit logs: 1-2 years minimum
- Application logs: 6-12 months

**NetGain Current Status**: ✅ Meets requirements for infrastructure (3 years)

**Status**: ❓ Need to document retention for:
- [ ] Database backups
- [ ] Application configuration backups
- [ ] Source code (GitHub retention)
- [ ] Customer data backups

---

## Backup Verification & Testing

### Last Restore Test

**Date**: ✅ **3 months ago** (approximately July 2025)

**What Was Tested**: ❓ Need to document:
- [ ] Which systems were tested
- [ ] Type of restore (full VM, files, database)
- [ ] Success/failure results
- [ ] Issues encountered
- [ ] Time taken to restore
- [ ] Lessons learned

---

### Restore Testing Schedule

**Recommended Schedule**:
- **VM Restore Testing**: Quarterly (every 3 months)
- **Database Restore Testing**: Quarterly
- **File-level Restore Testing**: Semi-annually
- **Full DR Test**: Annually

**Current Status**: ✅ Last test 3 months ago (on schedule)

**Action Required**:
- [ ] Document formal testing schedule
- [ ] Create restore test procedures
- [ ] Assign testing responsibilities
- [ ] Next test due: January 2026 (approximately)

---

## Recovery Objectives

### Recovery Time Objective (RTO)

**Status**: ❓ Need to define RTO for each system:

| System                    | Proposed RTO | Status      |
|---------------------------|--------------|-------------|
| Production AKS (aks)      | 4 hours      | ❓ To define |
| Australia AKS (aksau)     | 8 hours      | ❓ To define |
| m1-emedge1 (customer)     | 2 hours      | ❓ To define |
| CRM System                | 4 hours      | ❓ To define |
| Elasticsearch             | 4 hours      | ❓ To define |
| Cloud Vista Platform      | 2 hours      | ❓ To define |

**Definition**: Maximum acceptable time to restore service after an incident

---

### Recovery Point Objective (RPO)

**Status**: ❓ Need to define RPO for each system:

| System                    | Proposed RPO | Status      |
|---------------------------|--------------|-------------|
| Production AKS (aks)      | 24 hours     | ❓ To define |
| Australia AKS (aksau)     | 24 hours     | ❓ To define |
| m1-emedge1 (customer)     | 24 hours     | ❓ To define |
| CRM System                | 1 hour       | ❓ To define |
| Elasticsearch             | 4 hours      | ❓ To define |
| Cloud Vista Platform      | 4 hours      | ❓ To define |

**Definition**: Maximum acceptable data loss (time between last backup and incident)

**Notes**:
- Daily VM backups = 24 hour RPO maximum
- For lower RPO, need more frequent backups or replication

---

## Recovery Procedures

### VM Recovery

**Azure VM Restore Options**:
1. **Create new VM from snapshot** (fastest, <1 hour)
2. **Restore disks and attach** (1-2 hours)
3. **File-level recovery** (for specific files only)

**Procedure** (High-level):
```bash
# 1. List available restore points
az backup recoverypoint list \
  --resource-group core_sea \
  --vault-name recovery-vault-sea \
  --container-name <vm-container> \
  --item-name <vm-name> \
  --output table

# 2. Trigger restore job
az backup restore restore-disks \
  --resource-group core_sea \
  --vault-name recovery-vault-sea \
  --container-name <vm-container> \
  --item-name <vm-name> \
  --rp-name <recovery-point-name> \
  --storage-account <storage-account> \
  --target-resource-group <target-rg>

# 3. Monitor restore job
az backup job list \
  --resource-group core_sea \
  --vault-name recovery-vault-sea \
  --output table

# 4. Create VM from restored disks
# (Manual steps in Azure portal or additional CLI commands)
```

**Status**: ❓ Need detailed runbook with:
- [ ] Step-by-step restore instructions
- [ ] Screenshots or detailed CLI commands
- [ ] Expected duration for each step
- [ ] Validation steps after restore
- [ ] Rollback plan if restore fails

---

### Kubernetes Recovery

**AKS Cluster Recovery**:

**Scenario 1: Application Failure** (most common)
1. Identify failed pods/deployments
2. Rollback to previous version: `kubectl rollout undo deployment/<name>`
3. Or restore from backup (if configuration lost)

**Scenario 2: Persistent Volume Data Loss**
1. Restore PVC from snapshot (if snapshot exists)
2. Or restore database from backup
3. Reattach to pod

**Scenario 3: Complete Cluster Loss**
1. Rebuild AKS cluster (Infrastructure as Code preferred)
2. Restore application deployments from Git
3. Restore persistent data from backups
4. Restore secrets from Key Vault
5. Reconfigure networking and ingress

**Status**: ❓ Need detailed runbook for each scenario

---

### Database Recovery

**Elasticsearch Recovery**:
**Status**: ❓ Need to document:
- [ ] Restore from snapshot to same cluster
- [ ] Restore to new cluster
- [ ] Point-in-time recovery (if available)
- [ ] Data validation after restore

**CRM Database Recovery**:
**Status**: ❓ Need to document:
- [ ] Restore procedure
- [ ] Connection string updates
- [ ] Application downtime required
- [ ] Data consistency checks

**MongoDB Recovery** (if used):
**Status**: ❓ Need to document:
- [ ] Restore from mongodump
- [ ] Or restore from snapshot
- [ ] Replica set reconfiguration
- [ ] Validation queries

---

## Backup Monitoring

### Backup Job Monitoring

**Status**: ❓ Need to implement:
- [ ] Alerts for backup job failures
- [ ] Alerts for backup duration anomalies
- [ ] Alerts for backup size anomalies (may indicate issue)
- [ ] Dashboard showing backup status
- [ ] Weekly backup success report

**Recommendation**: Configure in Azure Monitor or Cloud Vista

---

### Backup Integrity

**Current Status**: ❓ Unknown

**Recommendations**:
- [ ] Regular backup verification (checksum, test restores)
- [ ] Monitor backup storage capacity
- [ ] Alert on incomplete backups
- [ ] Verify backup encryption
- [ ] Test backup corruption scenarios

---

## Disaster Recovery (DR)

### DR Strategy

**Geographic Distribution**:
- Primary: Southeast Asia (aks cluster)
- Secondary: Australia East (aksau cluster)

**DR Approach**: ❓ Need to define:
- [ ] Active-Active (both regions serving traffic)
- [ ] Active-Passive (AU is hot standby)
- [ ] Cold DR (AU must be rebuilt if SEA fails)

**Status**: ❓ Need to document:
- [ ] Data replication strategy between regions
- [ ] Failover procedures (SEA to AU)
- [ ] Failback procedures (AU back to SEA)
- [ ] DNS/traffic management during failover
- [ ] Customer communication plan

---

### DR Testing

**Status**: ❓ Need to implement:
- [ ] Annual full DR test
- [ ] Tabletop exercises (scenario walk-throughs)
- [ ] Partial failover testing
- [ ] Document DR test results
- [ ] Update DR plan based on test findings

---

## Backup Security

### Backup Access Control

**Who has access to backups**:
- soonseah@netgain-systems.com (Azure Owner)
- Others with Azure Contributor role: gna, farhan

**Status**: ❓ Need to document:
- [ ] Principle of least privilege applied?
- [ ] Separate backup admin role?
- [ ] MFA required for backup access?
- [ ] Audit logging of backup access

---

### Backup Encryption

**Azure Default**:
- ✅ Backups encrypted at rest (Azure platform-managed keys)
- ✅ Backups encrypted in transit (HTTPS)

**Status**: ❓ Need to verify:
- [ ] Customer-managed encryption keys (CMK)?
- [ ] Backup data cannot be decrypted by Microsoft?
- [ ] Key management for backup encryption

---

### Backup Retention Lock

**Status**: ❓ Need to verify:
- [ ] Immutable backups (cannot be deleted before retention expires)
- [ ] Protection against ransomware (prevent backup deletion)
- [ ] Soft delete enabled (deleted backups recoverable for X days)

**Recommendation**: Enable immutable backups and soft delete for ransomware protection

---

## Backup Documentation

### What Needs to be Documented

- [ ] Complete backup inventory (what is backed up)
- [ ] Backup schedules for all systems
- [ ] Backup retention policies
- [ ] Recovery procedures (runbooks)
- [ ] RTO/RPO definitions
- [ ] Backup testing schedule and results
- [ ] DR plan
- [ ] Roles and responsibilities
- [ ] Contact information for escalations

---

## Action Items

### Immediate Priority
- [ ] Document last restore test details
- [ ] Define RTO/RPO for each system
- [ ] Schedule next restore test (January 2026)
- [ ] Implement backup job failure alerts

### High Priority
- [ ] Document VM recovery runbooks
- [ ] Document database backup strategy
- [ ] Implement Kubernetes backup (Velero or similar)
- [ ] Create DR plan with failover procedures
- [ ] Verify backup encryption settings

### Medium Priority
- [ ] Test database restore procedures
- [ ] Document AKS cluster recovery procedures
- [ ] Implement backup monitoring dashboard
- [ ] Enable immutable backups for ransomware protection
- [ ] Schedule annual DR test

### Low Priority
- [ ] Optimize backup storage costs
- [ ] Evaluate backup compression
- [ ] Consider incremental backups where appropriate
- [ ] Document backup retention exceptions

---

## ISO 27001 Requirements

### Currently Satisfied
- ✅ Regular backups (A.12.3.1) - Daily VM backups
- ✅ Backup testing (A.12.3.1) - Last test 3 months ago
- ✅ Long retention (3 years for infrastructure)
- ✅ Backup encryption (A.10.1.1)

### Requires Documentation
- ❓ Backup procedures (A.12.3.1)
- ❓ Recovery procedures (A.12.3.1)
- ❓ RTO/RPO definitions (A.17.1.2)
- ❓ Backup verification process (A.12.3.1)
- ❓ DR plan (A.17.1.2)

### Requires Implementation/Verification
- ❓ Kubernetes backup solution (A.12.3.1)
- ❓ Database backup verification (A.12.3.1)
- ❓ Backup monitoring and alerting (A.12.3.1)
- ❓ Immutable backups (A.12.3.1)
- ❓ DR testing schedule (A.17.1.3)

---
