# Data Storage & Databases

**Last Updated:** 2025-10-15

---

## Overview

NetGain Systems handles several types of data:
1. **Customer PII**: CRM data
2. **Observability Platform Data**: Customer monitoring data (metrics, logs, traces)
3. **Application Data**: In-house built systems
4. **Source Code**: GitHub repositories
5. **Financial/HR Data**: External SaaS (Xero, JustLogin)

---

## Database Systems

### 1. Elasticsearch

**Purpose**: Observability product data storage

**Details**:
- **Platform**: Running in Azure Kubernetes (AKS)
- **Data Type**:
  - Metrics from monitored systems
  - Logs from customer applications
  - Traces and APM data
  - Time-series data
- **Customer Data**: Yes - contains customer monitoring data

**Status**: ❓ Need to document:
- [ ] Elasticsearch version
- [ ] Cluster configuration (nodes, replicas)
- [ ] Data retention policy in Elasticsearch
- [ ] Index management strategy
- [ ] Storage capacity and growth rate
- [ ] Which AKS cluster hosts Elasticsearch (aks in SEA, aksau in AU, or both?)

**Encryption**:
- ✅ At rest: Azure disk encryption (default)
- ❓ In transit: Need to verify TLS/SSL between nodes
- ❓ Application-level encryption

---

### 2. CRM Database

**Purpose**: In-house built CRM system

**Details**:
- **Platform**: Azure Kubernetes (AKS)
- **Data Type**:
  - Customer contact information
  - Company details
  - Sales pipeline data
  - Contract information
- **Contains PII**: Yes

**Status**: ❓ Need to document:
- [ ] Database technology (MongoDB, PostgreSQL, MySQL, SQL Server?)
- [ ] Which AKS cluster
- [ ] Database size
- [ ] Access control (who can access CRM database)
- [ ] Data retention policy
- [ ] Backup strategy specific to CRM

**Encryption**:
- ✅ At rest: Azure disk encryption (default)
- ❓ In transit: Need to verify
- ❓ Application-level field encryption for sensitive data

---

### 3. MongoDB

**Purpose**: Application data (based on tech stack)

**Details**:
- **Mentioned in tech stack**: Yes
- **Platform**: Likely Azure Kubernetes (AKS) or MongoDB Atlas

**Status**: ❓ Need to document:
- [ ] What applications use MongoDB
- [ ] Self-hosted in AKS or MongoDB Atlas?
- [ ] Database size and collections
- [ ] Replica set configuration
- [ ] Backup and restore procedures
- [ ] Access control

**Encryption**:
- ✅ At rest: Azure disk encryption (default if in AKS)
- ❓ In transit: Need to verify
- ❓ MongoDB encryption at rest enabled

---

## Data Location

### Primary Regions
1. **Southeast Asia** (aks cluster)
   - Primary production databases
   - 11 nodes available for workloads

2. **Australia East** (aksau cluster)
   - Regional databases (if any)
   - 3 nodes available for workloads

**Status**: ❓ Need to document:
- [ ] Data residency requirements by customer
- [ ] Which customers are in SEA vs AU
- [ ] Data replication between regions
- [ ] DR strategy for databases

---

## Persistent Storage in Kubernetes

### Persistent Volumes

From Azure audit, multiple PVCs (Persistent Volume Claims) found:

**Southeast Asia AKS (aks):**
- Multiple kubernetes-dynamic-pvc-* disks
- Multiple pvc-* disks
- Storage for databases, application data, logs

**Australia East AKS (aksau):**
- kubernetes-dynamic-pvc-* disks
- Storage for databases

**Status**: ❓ Need to document:
- [ ] Map each PVC to application/database
- [ ] Storage class used (Azure Disk, Azure Files?)
- [ ] Size of each volume
- [ ] Backup strategy for PVCs
- [ ] Snapshot schedules

### Storage Classes
**Status**: ❓ Need to document:
```bash
# Run to check storage classes
kubectl get storageclass --context <cluster-context>

# Document:
- [ ] What storage classes are configured
- [ ] Default storage class
- [ ] Performance tier (Standard, Premium SSD)
- [ ] Replication (LRS, ZRS, GRS)
```

---

## Data Encryption

### At Rest

**Azure Default Encryption**:
- ✅ Azure Managed Disks: Encrypted by default with Microsoft-managed keys
- ✅ Azure Storage Accounts: Encrypted by default
- ✅ AKS Persistent Volumes: Encrypted by default

**Status**: ✅ CONFIRMED - Azure encrypts data at rest by default

**Additional Encryption**:
❓ Need to verify:
- [ ] Customer-managed keys (CMK) in Key Vault?
- [ ] Database-level encryption (TDE for SQL, MongoDB encryption at rest)
- [ ] Application-level field encryption for sensitive fields

### In Transit

**Status**: ❓ Need to document:
- [ ] TLS/SSL for Elasticsearch cluster communication
- [ ] TLS/SSL for database connections from applications
- [ ] TLS/SSL for CRM application
- [ ] Certificate management process
- [ ] Certificate expiration monitoring

---

## Data Classification

### Sensitive Data Types

1. **Customer PII (CRM)**
   - Names, email addresses, phone numbers
   - Company information
   - Contract details

2. **Customer Monitoring Data (Observability Platform)**
   - System metrics
   - Application logs (may contain sensitive info)
   - Performance data
   - Infrastructure topology

3. **Internal Data**
   - Employee information (in JustLogin - external SaaS)
   - Financial data (in Xero - external SaaS)
   - Source code (GitHub)

**Status**: ❓ Need to document:
- [ ] Data classification policy
- [ ] How sensitive data is marked/tagged
- [ ] Access restrictions based on classification
- [ ] Data handling procedures

---

## Data Access Control

### Database Access

**Status**: ❓ Need to document:
- [ ] Who has direct database access
- [ ] How database credentials are managed
- [ ] Service accounts used by applications
- [ ] Database user roles and permissions
- [ ] Audit logging of database access
- [ ] Production database access from developer machines (should be restricted)

### Application Access

**NetGain Cloud Vista** (Observability Platform):
- Customer access to their own monitoring data
- Internal access for support/troubleshooting

**CRM System**:
- Sales team access
- Management access
- API access (if any)

**Status**: ❓ Need to document:
- [ ] Role-based access control (RBAC) in applications
- [ ] Multi-tenancy isolation (how customer data is separated)
- [ ] Audit logging in applications
- [ ] Session management and timeout

---

## Data Backup & Retention

### Backup Strategy

**Infrastructure Backups** (from earlier documentation):
- ✅ Azure Backup Vaults: main-vault (SEA), main-vault-au (AU), recovery-vault-sea
- ✅ Daily automated snapshots
- ✅ Last restore test: 3 months ago
- ✅ Retention period: 3 years (mostly)

**Database Backups**:
**Status**: ❓ Need to document:
- [ ] Elasticsearch snapshot strategy
- [ ] CRM database backup schedule
- [ ] MongoDB backup approach
- [ ] Backup verification process
- [ ] Point-in-time recovery capability (RPO)

### Data Retention Policies

**Confirmed Retention Periods**:
- **Infrastructure Backups**: 3 years
- **Application Logs** (in Cloud Vista): 1 year
- **Monitoring Data**: ❓ Need to confirm (likely shorter than 1 year for performance)

**Status**: ❓ Need to document:
- [ ] CRM data retention policy
- [ ] Customer monitoring data retention (by customer contract)
- [ ] Compliance requirements driving retention
- [ ] Data deletion/purging process
- [ ] Legal hold procedures

---

## Data Recovery

### Recovery Objectives

**Status**: ❓ Need to define and document:
- [ ] **RTO** (Recovery Time Objective): How quickly must data be restored?
- [ ] **RPO** (Recovery Point Objective): How much data loss is acceptable?
- [ ] Different RTO/RPO for different data types

### Recovery Procedures

**Last Restore Test**: ✅ 3 months ago

**Status**: ❓ Need to document:
- [ ] What was tested in last restore test
- [ ] Restore test results and issues found
- [ ] Restore procedure documentation
- [ ] Recovery runbooks for different scenarios:
  - Database corruption
  - Accidental deletion
  - Ransomware attack
  - Regional outage
  - Complete disaster

### Disaster Recovery

**Status**: ❓ Need to document:
- [ ] DR plan for databases
- [ ] Failover procedures (SEA to AU or vice versa)
- [ ] Data replication strategy
- [ ] DR testing schedule

---

## Data Privacy & Compliance

### Customer Data Handling

**Status**: ❓ Need to document:
- [ ] Customer data processing agreements (DPA)
- [ ] GDPR/PDPA compliance measures
- [ ] Right to erasure (data deletion) process
- [ ] Data portability procedures
- [ ] Customer data access requests handling

### Data Minimization

**Status**: ❓ Need to document:
- [ ] What data is collected and why
- [ ] Data minimization practices
- [ ] Anonymization/pseudonymization techniques
- [ ] Test data management (using production data?)

---

## Data Transfer

### Between Environments

**Status**: ❓ Need to document:
- [ ] How data moves between dev/staging/prod
- [ ] Production data in non-prod environments (should be anonymized)
- [ ] Data masking techniques

### Between Regions

**Status**: ❓ Need to document:
- [ ] Cross-region data transfer (SEA <-> AU)
- [ ] Data sovereignty requirements
- [ ] Customer data residency preferences

### To/From Customers

**On-Premise Installations**:
- Engineers deploy software at customer sites
- Customer data stays at customer location

**Cloud Service**:
- Customer monitoring data sent to NetGain Cloud Vista
- Data transmitted over internet (secure channels?)

**Status**: ❓ Need to document:
- [ ] Data transmission security (TLS, VPN)
- [ ] Customer data onboarding process
- [ ] Data import/export procedures

---

## Database Monitoring

### Health Monitoring

**Status**: ❓ Need to document:
- [ ] Database performance monitoring
- [ ] Storage capacity monitoring and alerting
- [ ] Query performance monitoring
- [ ] Replication lag monitoring (if applicable)

### Security Monitoring

**Status**: ❓ Need to document:
- [ ] Failed login attempts
- [ ] Suspicious query patterns
- [ ] Data access anomalies
- [ ] Schema changes audit

---

## Action Items

### Immediate Priority
- [ ] Identify exact database technologies in use (verify MongoDB, check what else)
- [ ] Map Kubernetes persistent volumes to specific databases/applications
- [ ] Document database access control (who has access)
- [ ] Verify TLS/SSL for database connections

### High Priority
- [ ] Document Elasticsearch configuration and retention
- [ ] Document CRM database specifics
- [ ] Define RTO/RPO for each database
- [ ] Create database recovery runbooks
- [ ] Document data classification policy

### Medium Priority
- [ ] Verify database-level encryption settings
- [ ] Document data retention policies for all data types
- [ ] Implement database audit logging
- [ ] Schedule regular restore testing (quarterly)
- [ ] Document DR procedures

---

## ISO 27001 Requirements

### Currently Satisfied
- ✅ Data at rest encryption (A.10.1.1)
- ✅ Regular backups (A.12.3.1)
- ✅ Backup testing (3 months ago) (A.12.3.1)

### Requires Documentation
- ❓ Data classification scheme (A.8.2.1)
- ❓ Access control to databases (A.9.4.1)
- ❓ Data retention and disposal (A.8.3.1)
- ❓ Backup retention policy (A.12.3.1)

### Requires Verification
- ❓ Data in transit encryption (A.10.1.2)
- ❓ Database audit logging (A.12.4.1)
- ❓ Multi-tenancy isolation (A.9.4.4)
- ❓ Data privacy controls (A.18.1.4)

---
