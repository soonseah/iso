# ISO 27001 Technical Compliance Prep

## Technical Team Responsibilities

This document outlines what the technical team needs to prepare and provide for ISO 27001 compliance.

---

## 1. Asset Inventory

### Systems & Infrastructure
- [ ] List all servers (production, staging, dev)
- [ ] Cloud services and accounts (AWS, Azure, GCP, etc.)
- [ ] Databases and data stores
- [ ] Network equipment (routers, switches, firewalls)
- [ ] Development machines/laptops

### Software & Applications
- [ ] Production applications/services
- [ ] Internal tools and utilities
- [ ] Third-party software/SaaS tools
- [ ] Development tools and IDEs
- [ ] Security tools (AV, monitoring, logging)

### Data Assets
- [ ] Customer data locations
- [ ] Source code repositories
- [ ] Configuration files and secrets
- [ ] Backup locations
- [ ] Log storage

---

## 2. Access Control Documentation

### User Access Management
- [ ] Document how user accounts are created/removed
- [ ] List privileged accounts (admin, root, sudo)
- [ ] Document MFA implementation status
- [ ] Password policy requirements
- [ ] SSH key management process

### System Access
- [ ] Who has access to production servers
- [ ] Who has database access
- [ ] Who has cloud console access
- [ ] VPN/remote access methods
- [ ] Service accounts and API keys

### Code Repository Access
- [ ] Git repository permissions model
- [ ] Branch protection rules
- [ ] Code review requirements
- [ ] Deploy access restrictions

---

## 3. Network Security

### Network Architecture
- [ ] Network diagram showing all systems
- [ ] Firewall rules documentation
- [ ] Segmentation/VLANs in place
- [ ] DMZ configuration (if applicable)

### Security Controls
- [ ] Intrusion detection/prevention systems
- [ ] DDoS protection
- [ ] WAF (Web Application Firewall)
- [ ] VPN configuration
- [ ] Network monitoring tools

---

## 4. Development & Deployment

### SDLC Documentation
- [ ] Development workflow (branches, PRs, merges)
- [ ] Code review process
- [ ] Testing procedures (unit, integration, security)
- [ ] Deployment process/pipeline
- [ ] Rollback procedures

### Security in Development
- [ ] Secrets management (how are credentials stored)
- [ ] Dependency scanning tools
- [ ] Static code analysis tools
- [ ] Container security scanning
- [ ] Environment separation (dev/staging/prod)

### Change Management
- [ ] How changes are approved
- [ ] Release notes/changelog process
- [ ] Configuration change tracking
- [ ] Emergency change procedures

---

## 5. Data Protection

### Encryption
- [ ] Data at rest encryption (databases, backups)
- [ ] Data in transit encryption (TLS/SSL)
- [ ] Certificate management process
- [ ] Key management procedures

### Backup & Recovery
- [ ] Backup schedule and retention
- [ ] Backup storage locations
- [ ] Backup encryption status
- [ ] Recovery time objectives (RTO)
- [ ] Recovery point objectives (RPO)
- [ ] Last successful restore test date

---

## 6. Monitoring & Logging

### Logging
- [ ] What gets logged (access, errors, changes)
- [ ] Log retention period
- [ ] Log storage and protection
- [ ] Centralized logging system
- [ ] Log review process

### Monitoring
- [ ] Infrastructure monitoring tools
- [ ] Application monitoring
- [ ] Security monitoring/SIEM
- [ ] Alerting configuration
- [ ] On-call procedures

---

## 7. Incident Response

### Technical Procedures
- [ ] How security incidents are detected
- [ ] Incident escalation process
- [ ] System isolation procedures
- [ ] Forensics/evidence collection
- [ ] Post-incident analysis process

### Contact Information
- [ ] Technical team contacts
- [ ] Escalation chain
- [ ] External support contacts (cloud provider, vendors)

---

## 8. Vulnerability Management

### Patching
- [ ] OS patch management process
- [ ] Application update procedures
- [ ] Security patch SLA
- [ ] Testing before patching

### Scanning
- [ ] Vulnerability scanning tools
- [ ] Scan frequency
- [ ] Remediation process
- [ ] Penetration testing schedule

---

## 9. Physical & Environmental

### Server Rooms / Data Centers
- [ ] Physical access controls
- [ ] Environmental monitoring (temp, humidity)
- [ ] Fire suppression
- [ ] Power backup (UPS, generators)

### Devices
- [ ] Laptop encryption status
- [ ] Device management (MDM)
- [ ] Lost/stolen device procedures

---

## 10. Third-Party / Suppliers

### Technical Vendors
- [ ] List of critical vendors (cloud, SaaS, tools)
- [ ] Data they access/process
- [ ] Their security certifications
- [ ] Contract/SLA details
- [ ] Offboarding procedures

---

## 11. Configuration Standards

### Hardening
- [ ] Server hardening checklist
- [ ] Database hardening
- [ ] Default password changes
- [ ] Unnecessary services disabled
- [ ] Security baselines documented

### Documentation
- [ ] Architecture diagrams
- [ ] Network topology
- [ ] Data flow diagrams
- [ ] System configuration docs
- [ ] Runbooks and procedures

---

## 12. Audit Trails

### Technical Audit Logs
- [ ] Who accessed what systems and when
- [ ] Configuration changes tracking
- [ ] Database access logs
- [ ] Deployment history
- [ ] Privileged command logs (sudo, root)

---

---

## Organization Context

### Company Information
- **Name**: NetGain Systems
- **Industry**: IT Software Vendor (AI-powered observability platform)
- **Size**: ~15 employees
- **Location**: Singapore
- **Scope**: All departments in Singapore office
- **Core Products**: AI-powered observability platform with 20+ years enterprise monitoring expertise

### Critical Data Handled
- **Customer PII**: CRM data
- **SaaS Product Data**: Observability platform customer data
- **Intellectual Property**: Source code (GitHub)
- **Financial/HR**: Managed via SaaS (Xero for accounting, JustLogin for HR/payroll/expense)

---

## Answered - Current Technical Setup

### Infrastructure
- **Cloud Provider**: Azure (no on-premise servers)
- **Azure Subscription**: 1 subscription (Pay-As-You-Go)
- **Tech Stack**: NodeJS, Python, MongoDB, Java, Javascript, Kubernetes
- **Backup**: Azure Backup (automated via main-vault in SEA and AU)

### Detailed Azure Resources

**AKS Clusters (Kubernetes):**
- **aks** (Southeast Asia) - Kubernetes v1.26.12
  - Node Pool: cvsstorage2 - 7 nodes (Standard_D4as_v4)
  - Node Pool: services2 - 2 nodes (Standard_DS11_v2)
  - Node Pool: cvsdefault3 - 2 nodes (Standard_E4ads_v5)
  - **Total: 11 nodes**
  - Monitoring: Not enabled (OMS agent disabled)

- **aksau** (Australia East) - Kubernetes v1.22.6 (OUTDATED VERSION - needs upgrade)
  - Node Pool: cvsdefault2 - 1 node (Standard_DS11_v2)
  - Node Pool: cvsstorage1 - 2 nodes (Standard_DS11_v2)
  - **Total: 3 nodes**
  - Monitoring: Not configured

**Virtual Machines:**
- **m1-emedge1** (core_sea) - Standard_D2as_v4, Linux, Southeast Asia
- **ubuntu-test1** (core_sea) - Standard_B2ms, Linux, Southeast Asia
- **emedge-vm1** (rg-emedge-HA-test) - Standard_D2as_v4, Linux, Southeast Asia
- **emedge-vm2** (rg-emedge-HA-test) - Standard_D2as_v4, Linux, Southeast Asia
- **Total: 4 VMs**

**Container Registry:**
- **netgain** (Southeast Asia) - stores Docker images

**Storage Accounts:**
- 7 storage accounts across resource groups
- Used for: AKS storage, cloud shell, emedge config

**Backup Infrastructure:**
- **main-vault** (core_sea) - Data Protection Backup Vault
- **main-vault-au** (core_au) - Data Protection Backup Vault
- **recovery-vault-sea** (core_sea) - Recovery Services Vault
- Daily automated snapshots (visible from Oct 7-14, 2025)

**Key Vault:**
- **kv-defaulth969906751183** (rg-soonseah-0555_ai, Australia East)

**Monitoring:**
- **Log Analytics Workspace**: DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU (Australia East)
- **Application Insights**: ng-us-central (Central US)
- **Prometheus**: Rules configured for AKS monitoring
- **Alert Rules**: Configured for m1-emedge1 (VM Availability, CPU, Memory, Disk IOPS)

**Resource Groups:**
- core_sea (main Southeast Asia resources)
- core_au (main Australia resources)
- MC_core_sea_aks_southeastasia (AKS managed)
- MC_core_au_aksau_australiaeast (AKS managed)
- rg-emedge-HA-test (HA testing environment)
- rg-soonseah-0555_ai (AI/dev environment)
- cloud-shell-storage-southeastasia
- AzureBackupRG_southeastasia_1
- NetworkWatcherRG
- DefaultResourceGroup-SEA, DefaultResourceGroup-EAU

**Network:**
- Multiple VNets for AKS clusters and VMs
- Network Security Groups (NSGs) for firewall rules
- Public IPs assigned to VMs and load balancers
- Azure Bastion for secure VM access (edge1-m1-sg-vnet-bastion)

### Security Controls in Place
- **MFA**: Yes (enabled)
- **Password Policies**: Yes
- **Source Code**: GitHub with 2FA enabled
- **VPN/Firewalls**: No (cloud-based services only)

### Access Control
- **Azure AD (Entra ID)**: 46 total accounts
  - **Internal Users**: ~29 (@netgain-systems.com)
  - **External/Guest Users**: 17 (contractors, partners, customers, China office)
  - **Service Accounts**: no-reply, support, servicedesk, NetGain-SS booking

- **Azure Subscription Admin Roles**:
  - **Owner**: soonseah@netgain-systems.com
  - **Contributors**: gna@netgain-systems.com, farhan@netgain-systems.com

- **External User Breakdown**:
  - d-connect.net (contractors): 4 users
  - atos.net (partners): 3 users
  - m1.com.sg (customer): 2 users
  - netgain-systems.com.cn (China office): 3 users
  - Others: interns, consultants (5 users)

### SaaS Tools Used
- Trello (project management)
- Office365 (productivity)
- Xero (accounting)
- JustLogin (HR, payroll, expense)
- GitHub (source code repository with 2FA)
- [MORE TO BE ADDED]

---

## Questions Still to Answer

### Infrastructure Details
1. ✓ **Azure subscriptions/resource groups**: 1 subscription, 10+ resource groups (core_sea, core_au, MC groups for AKS, HA test, AI dev)
2. ✓ **Azure services in use**:
   - 2 AKS clusters (14 nodes total)
   - 4 Virtual Machines
   - 1 Container Registry
   - 3 Backup Vaults
   - 7 Storage Accounts
   - 1 Key Vault
   - Log Analytics + Application Insights
   - Azure Bastion
3. ✓ **Environments identified from resource groups**:
   - **Production**: core_sea, core_au (main AKS clusters)
   - **Testing**: rg-emedge-HA-test (HA testing with 2 VMs)
   - **Development/AI**: rg-soonseah-0555_ai (has Key Vault)
   - **Note**: Need to verify which AKS namespaces are prod vs staging
4. ✓ **What's running on Azure**:
   - Kubernetes clusters (observability platform workloads)
   - VMs for edge monitoring agents
   - Container images in netgain registry
   - **Still need**: Details on databases, specific app services running in AKS

### Access & Authentication
5. ✓ **User Account Management**: Azure AD (Microsoft Entra ID)
   - **Total Users**: 46 accounts
   - **Internal Users (@netgain-systems.com)**: ~29 users
   - **External/Guest Users (#EXT#)**: 17 users (contractors, partners, customers)
     - d-connect.net (contractors): 4 users
     - atos.net (partners): 3 users
     - m1.com.sg (customer): 2 users
     - netgain-systems.com.cn (China office): 3 users
     - Others: interns, consultants
   - **Service Accounts**: no-reply, support, servicedesk, NetGain-SS booking

   **Key Admin Roles**:
   - **Subscription Owner**: soonseah@netgain-systems.com (full admin)
   - **Subscription Contributor**: gna@netgain-systems.com, farhan@netgain-systems.com

   **Azure Resources Found**:
   - AKS clusters: Southeast Asia (aks) and Australia East (aksau)
   - Container Registry: netgain
   - Virtual Machines: m1-emedge1
   - Backup Vaults: main-vault (SEA), main-vault-au (AU)
   - Resource Groups: core_sea, core_au

   **TODO: Document**:
   - How new users are onboarded/offboarded
   - Access review process for external users
   - MFA enforcement status per user
   - Guest user approval process

6. SSO configured for which services? [STILL TO CHECK - likely Office365/Azure AD integrated]
7. ✓ Who has admin access to Azure portal?
   - Owner: soonseah@netgain-systems.com
   - Contributors: gna@netgain-systems.com, farhan@netgain-systems.com
8. ✓ **Secrets Management**:
   - **Key Vault Found**: kv-defaulth969906751183 (in AI/dev environment)
   - **Still need to document**:
     - How production secrets are stored (Key Vault vs env vars vs Kubernetes secrets?)
     - Service principal list (couldn't retrieve with current permissions)
     - Who has access to Key Vault
     - Secrets rotation policy

### Development & Deployment
9. ✓ **Git workflow**: Code → Commit → Push → Create PR → Review & Approve → Merge → CI/CD Build & Deploy
10. ✓ **Code reviews**: Yes, required. Reviewed and approved by Gna (R&D Director) or SS (CTO)
11. ✓ **CI/CD pipeline**: Jenkins + Kubernetes
12. ✓ **Who can deploy**: Engineers with appropriate access (manual selective deployment)
13. ✓ **Deployment method**:
    - Cloud: Manual deployment to AKS after Jenkins build
    - On-premise: Engineers deploy at customer sites manually

### Data & Databases
14. ✓ **Observability product data**: Elasticsearch (running in AKS)
15. ✓ **CRM data**: In-house built CRM, data stored in Azure Kubernetes
16. ✓ **Database encryption**: Yes (Azure encrypts data at rest by default)
17. ✓ **Last backup restore test**: 3 months ago (approximately July 2025)
18. ✓ **Backup retention**: 3 years (mostly)

### Monitoring & Logging
19. ✓ **Primary Monitoring**: NetGain Cloud Vista (own product)
   - Application Insights: ng-us-central (Central US)
   - Log Analytics Workspace: DefaultWorkspace (Australia East)
   - Azure Monitor with Prometheus for AKS
   - Alert Rules for VM metrics (m1-emedge1)
   - **Issue**: AKS monitoring (OMS agent) is DISABLED on main cluster
20. ✓ **Application logs**: Stored in Cloud Vista
21. ✓ **Log retention**: 1 year (in Cloud Vista)
22. ✓ **Alerting configured for**:
   - System health issues
   - Security breaches
   - VM metrics (Availability, CPU, Memory, Disk IOPS)
23. ✓ **Alert recipients**: Gna (R&D Director), SS (CTO), and responsible tech personnel

### Security Tools & Practices
24. ❌ **Dependency scanning**: No (NOT IMPLEMENTED - HIGH RISK)
25. ⚠️ **Code scanning**: GitHub Advanced Security available but NOT configured internally (HIGH RISK)
26. ⚠️ **Vulnerability scanning on Azure**: Yes, but NOT done internally - Farhan to set up (MEDIUM RISK)
27. ❌ **Penetration testing**: No
28. ✅ **Antivirus on laptops**: Yes (needs verification across all 15 employees)

### Incident Response
29. ✓ **Security incident detected**: CTO and Gna notified
30. ✓ **Who gets notified**: CTO (SS), Gna (R&D Director), Farhan, or responsible tech person
31. ✓ **Incident tracking**: Jira

### Network & Access
32. ✓ **Developer access to Azure**: Azure RBAC (portal, CLI, kubectl)
33. ✓ **Production DB access from dev machines**: No (restricted)
34. ✓ **IP whitelisting**: Yes, via Nginx load balancer on AKS (Kubernetes)

---

## Action Items

### Completed
- [x] Identify Azure AD user accounts and roles
- [x] Document Azure infrastructure resources (AKS, VMs, Storage, Backup)
- [x] Identify subscription admins
- [x] Document monitoring and logging infrastructure
- [x] Identify Key Vault existence
- [x] Map environments (prod, test, dev)

### High Priority - Access Control
- [ ] Document user onboarding/offboarding process
- [ ] Review and document MFA enforcement per user/role
- [ ] Create access review process for external/guest users (17 external users need regular review)
- [ ] Document guest user approval workflow
- [ ] List all service principals and their permissions (need higher Azure permissions)
- [ ] Document production secrets management (Key Vault vs Kubernetes secrets vs env vars)
- [ ] Document Key Vault access policies
- [ ] Define secrets rotation policy

### High Priority - Asset Documentation
- [ ] Document what's running inside AKS clusters (kubectl to list pods, services, deployments)
- [ ] Document databases and where customer data is stored (check AKS persistent volumes)
- [ ] Create architecture diagrams (network topology, data flow)
- [ ] Document AKS namespaces and which are prod/staging
- [ ] Verify and document VM purposes (edge agents, testing?)

### URGENT - Critical Security & Compliance Risks
- [ ] **URGENT**: Enable GitHub Dependabot on all repositories (HIGH ISO 27001 RISK)
- [ ] **URGENT**: Configure GitHub Advanced Security code scanning internally (HIGH ISO 27001 RISK)
- [ ] **URGENT**: Farhan to enable Azure Defender for Cloud (MEDIUM ISO 27001 RISK)
- [ ] **URGENT**: Verify antivirus on all 15 employee laptops
- [ ] **URGENT**: Upgrade aksau cluster from Kubernetes v1.22.6
- [ ] **URGENT**: Enable AKS monitoring (OMS agent) on main aks cluster

### High Priority - Security Issues
- [ ] Review and clean up 17 external/guest users - are they all still needed?
- [ ] Document incident response procedures (currently ad-hoc)
- [ ] Configure Azure Defender alerts to Gna, SS, Farhan
- [ ] Schedule first penetration test (target Q1 2026)

### Medium Priority - Security Controls
- [ ] Document backup retention policy (verify current settings)
- [ ] Verify VM patch status (4 VMs: m1-emedge1, ubuntu-test1, emedge-vm1, emedge-vm2)
- [ ] Verify container image patching process
- [ ] Document log retention period (check Log Analytics workspace settings)
- [ ] Configure AKS-level alerting (currently only VM alerts exist)
- [ ] Check who receives alerts (review action groups)
- [ ] Enable Azure Defender/Security Center recommendations

### Medium Priority - Development Process
- [ ] Document git workflow and branch protection
- [ ] Document code review requirements
- [ ] Document CI/CD pipeline
- [ ] Document deployment approval process
- [ ] Document who can deploy to production

### Low Priority - Policies & Procedures
- [ ] Write incident response procedures
- [ ] Test incident response procedures
- [ ] Document vulnerability scanning process
- [ ] Create runbooks for common operations
- [ ] Document change management process

---

---

## Key Findings Summary (from az cli audit)

### Infrastructure Summary
- **2 AKS Clusters**: 14 total nodes across SEA and AU regions
- **4 Virtual Machines**: Linux VMs for edge agents and testing
- **10+ Resource Groups**: Including prod, test, and dev environments
- **Backup**: Automated daily snapshots to 3 backup vaults

### Critical Issues Identified
1. **aksau cluster running Kubernetes v1.22.6** - OUTDATED and unsupported
2. **AKS monitoring disabled** - OMS agent not enabled on main cluster
3. **17 external/guest users** - Need access review and cleanup
4. **Dependency scanning NOT implemented** - HIGH COMPLIANCE RISK
5. **GitHub Advanced Security NOT configured** - HIGH COMPLIANCE RISK
6. **Azure Defender NOT enabled** - MEDIUM COMPLIANCE RISK (Farhan to set up)

### Security Controls Present
✓ MFA enabled
✓ Password policies in place
✓ Azure Bastion for secure VM access
✓ Network Security Groups configured
✓ Daily automated backups
✓ Application Insights + Log Analytics
✓ Key Vault exists (dev environment)
✓ Container Registry (netgain)

### Gaps Requiring Documentation
- Secrets management approach (production)
- Service principal inventory
- Database locations and encryption
- Log retention policies
- Alert notification recipients
- User onboarding/offboarding procedures
- AKS workload inventory
- Git workflow and code review process
- CI/CD pipeline details

---

*Last Updated: 2025-10-15*
