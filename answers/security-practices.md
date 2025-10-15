# Security Practices & Controls

**Last Updated:** 2025-10-15

---

## Security Scanning & Testing

### Dependency Scanning

**Status**: ❌ **NOT IMPLEMENTED**

**Tools Evaluated**: Dependabot, Snyk, WhiteSource
**Current Status**: None in use

**Risk Level**: 🔴 **HIGH - COMPLIANCE RISK**

**Impact**:
- Vulnerable dependencies may be in production
- No visibility into supply chain security
- Cannot detect CVEs in third-party libraries
- ISO 27001 non-compliance (A.14.2.1, A.12.6.1)

**Recommendation**:
```
Enable GitHub Dependabot:
1. Go to GitHub repository Settings
2. Security & analysis
3. Enable "Dependabot alerts"
4. Enable "Dependabot security updates"
5. Configure dependabot.yml for proactive scanning
```

**Action Items**:
- [ ] Enable Dependabot on all repositories (URGENT)
- [ ] Review and remediate existing vulnerabilities
- [ ] Establish vulnerability remediation SLA
- [ ] Assign owner: Development team

---

### Code Scanning (SAST - Static Application Security Testing)

**Status**: ⚠️ **PARTIALLY IMPLEMENTED**

**Tool**: GitHub Advanced Security
- **License**: ✅ Available
- **Configuration**: ⚠️ **NOT DONE INTERNALLY**
- **Status**: Available but not actively used

**Risk Level**: 🔴 **HIGH - COMPLIANCE RISK**

**Impact**:
- Code vulnerabilities not detected before production
- SQL injection, XSS, hardcoded secrets may exist
- No enforcement of secure coding practices
- ISO 27001 non-compliance (A.14.2.8)

**Recommendation**:
```
Enable GitHub Advanced Security Code Scanning:
1. Go to repository Settings → Security & analysis
2. Enable "Code scanning"
3. Set up CodeQL analysis workflow
4. Configure scan on:
   - Every push to main
   - Every pull request
5. Block PR merges if high/critical issues found
```

**Action Items**:
- [ ] **URGENT**: Configure GitHub Advanced Security internally
- [ ] Enable CodeQL on all repositories
- [ ] Define severity thresholds for blocking PRs
- [ ] Train developers on fixing security issues
- [ ] Assign owner: Development team + Farhan

---

### Vulnerability Scanning on Azure Resources

**Status**: ⚠️ **PARTIALLY IMPLEMENTED**

**Azure Defender/Microsoft Defender for Cloud**:
- **Available**: ✅ Yes
- **Configured Internally**: ⚠️ **NOT DONE**
- **Owner**: Farhan (to set it up)

**Risk Level**: 🟡 **MEDIUM - COMPLIANCE RISK**

**Impact**:
- VM misconfigurations not detected
- AKS security issues not identified
- Container vulnerabilities not scanned
- Network security gaps not visible
- ISO 27001 non-compliance (A.12.6.1)

**Recommendation**:
```bash
# Enable Microsoft Defender for Cloud
az security pricing create --name VirtualMachines --tier Standard
az security pricing create --name ContainerRegistry --tier Standard
az security pricing create --name KubernetesService --tier Standard
az security pricing create --name StorageAccounts --tier Standard
az security pricing create --name SqlServers --tier Standard

# Enable for all resources
az security pricing create --name CloudPosture --tier Standard
```

**Action Items**:
- [ ] **Farhan to enable Azure Defender** (HIGH PRIORITY)
- [ ] Enable for: VMs, AKS, Container Registry, Storage
- [ ] Configure security alerts to Gna, SS, Farhan
- [ ] Review and remediate findings
- [ ] Weekly security posture review

---

### Penetration Testing

**Status**: ❌ **NOT DONE**

**Frequency**: Never / No schedule

**Risk Level**: 🟡 **MEDIUM**

**Impact**:
- Unknown security vulnerabilities in production
- No validation of security controls
- May not detect real-world attack vectors
- ISO 27001 best practice (A.12.6.1)

**Recommendation**:
- **Internal Pen Testing**: Use automated tools (OWASP ZAP, Burp Suite)
- **External Pen Testing**: Hire third-party firm annually

**Action Items**:
- [ ] Schedule first penetration test (target: Q1 2026)
- [ ] Define scope (Cloud Vista platform, CRM, APIs)
- [ ] Budget for external pen test firm
- [ ] Establish annual pen testing schedule
- [ ] Document remediation process for findings

---

## Endpoint Security

### Antivirus on Developer Laptops

**Status**: ✅ **CLAIMED - NEEDS VERIFICATION**

**Details**: Team says "yes" but needs confirmation

**Risk Level**: 🟢 **LOW** (if confirmed)

**Action Items**:
- [ ] **VERIFY**: Confirm antivirus installed on all laptops
- [ ] Document antivirus solution used (Windows Defender, CrowdStrike, etc.)
- [ ] Verify real-time protection enabled
- [ ] Verify definition updates are automatic
- [ ] Check compliance across all 15 employees
- [ ] Document exceptions (if any)

**Recommended Checks**:
```
For each employee laptop:
- [ ] Antivirus installed and active
- [ ] Real-time protection ON
- [ ] Definitions updated (within last 7 days)
- [ ] Full scan completed (within last 30 days)
- [ ] Firewall enabled
```

---

### Endpoint Device Management

**Status**: ❓ Need to document:
- [ ] Mobile Device Management (MDM) solution?
- [ ] Device encryption policy (BitLocker, FileVault)
- [ ] Remote wipe capability
- [ ] Device compliance checks
- [ ] BYOD policy (if applicable)
- [ ] Lost/stolen device procedures

**Recommendation**: Implement Intune (included with Office365) for device management

---

## Network Security

### Firewall & IP Whitelisting

**Status**: ✅ **IMPLEMENTED**

**Method**: Nginx load balancer on AKS (Kubernetes)

**Details**:
- IP whitelisting configured in Nginx Ingress
- Running on Kubernetes clusters (aks, aksau)
- Controls access to services

**Action Items**:
- [ ] Document IP whitelist entries
- [ ] Document who can approve IP whitelist changes
- [ ] Review IP whitelist quarterly
- [ ] Document Nginx Ingress configuration
- [ ] Backup Nginx configurations
- [ ] Test IP blocking regularly

---

### Network Segmentation

**Current Implementation**:
- ✅ Azure Virtual Networks (VNets) for isolation
- ✅ Network Security Groups (NSGs) for firewall rules
- ✅ Azure Bastion for secure VM access (no direct SSH exposure)
- ✅ Kubernetes network policies (❓ need to verify)

**Status**: ❓ Need to document:
- [ ] NSG rules for each subnet
- [ ] Which services can talk to which (network policies)
- [ ] Ingress/egress filtering rules
- [ ] DMZ configuration (if applicable)

---

### VPN / Remote Access

**Status**: ❌ **NO VPN**

**Reason**: Cloud-based services only, no on-premise infrastructure

**Remote Access Methods**:
1. **Azure Portal**: Web-based (protected by Azure AD + MFA)
2. **Azure CLI**: Via workstation (protected by Azure AD + MFA)
3. **kubectl**: Via workstation with kubeconfig (protected by Azure RBAC)
4. **Azure Bastion**: For VM SSH access (no direct internet exposure)

**Security Controls**:
- ✅ Azure AD authentication
- ✅ MFA enabled
- ✅ RBAC for authorization
- ✅ Azure Bastion for secure shell access

---

## Access Control

### Developer Access to Azure Resources

**Method**: ✅ **Azure RBAC (Role-Based Access Control)**

**Access Levels**:
- **Owner**: soonseah@netgain-systems.com (CTO)
- **Contributor**: gna@netgain-systems.com (R&D Director), farhan@netgain-systems.com
- **Others**: ❓ Need to document (likely Kubernetes Cluster User role for some)

**Access Methods**:
1. **Azure Portal**: Browser-based, protected by Azure AD
2. **Azure CLI**: Command-line, authenticated via Azure AD
3. **kubectl**: Kubernetes CLI, uses Azure RBAC for AKS
4. **Azure Bastion**: For secure VM SSH (no public SSH)

**Status**: ✅ Implemented correctly

---

### Production Database Access

**Status**: ✅ **RESTRICTED**

**Policy**: Production databases are NOT accessible from dev machines

**Access Method** (when needed):
- Via Kubernetes pods only (application access)
- Or via Azure Bastion to specific VMs (for emergencies)
- Or via kubectl port-forward (for administrative access)

**Action Items**:
- [ ] Document approved methods for production DB access
- [ ] Document who can access production DBs
- [ ] Implement audit logging of DB access
- [ ] Document emergency access procedures

---

## Secrets Management

### Current State

**Development**: Azure Key Vault (kv-defaulth969906751183)
**Production**: ❓ To be confirmed (Key Vault vs Kubernetes secrets vs env vars)

**Status**: See separate documentation in development-deployment.md

---

## Patch Management

### Virtual Machines

**Status**: ❓ Need to document:
- [ ] Patch schedule (monthly? automatic?)
- [ ] Azure Automatic VM Guest Patching enabled?
- [ ] Testing before production patching
- [ ] Patch compliance monitoring
- [ ] Emergency patching procedure

**Action Items**:
- [ ] Verify Azure auto-update status on all VMs
- [ ] Document patch management process
- [ ] Define maintenance windows
- [ ] Implement patch compliance reporting

---

### Kubernetes / Containers

**AKS Cluster Patching**:
- ⚠️ **aksau** cluster on Kubernetes v1.22.6 (OUTDATED)
- ✅ **aks** cluster on Kubernetes v1.26.12 (relatively recent)

**Container Image Patching**:
**Status**: ❓ Need to document:
- [ ] Base image update schedule
- [ ] Process for rebuilding images with security patches
- [ ] Vulnerability scanning of images (Azure Defender for Containers)
- [ ] Image promotion (dev → staging → prod)

---

### Application Dependencies

**Status**: ❌ Not actively managed (no dependency scanning)

**Action Required**: Enable Dependabot (see above)

---

## Security Monitoring

### Security Event Monitoring

**Tools**:
- **NetGain Cloud Vista**: Primary monitoring platform
- **Azure Monitor**: Infrastructure monitoring
- **Azure AD Sign-in Logs**: Authentication monitoring

**What is Monitored**:
- ✅ System health issues
- ✅ Security breaches (detected by Cloud Vista)
- ❌ Dependency vulnerabilities (not scanned)
- ❌ Code vulnerabilities (not scanned internally)
- ❓ Azure resource misconfigurations (Defender not enabled)

---

### Security Alerting

**Alert Recipients**:
- CTO (Soon Seah)
- R&D Director (Gna)
- Farhan (for technical issues)
- Responsible technical personnel (context-dependent)

**Alert Types**:
- System unhealthy
- Security breaches
- Infrastructure issues

**Status**: ❓ Need to document:
- [ ] Security alert definitions
- [ ] Alert severity levels
- [ ] Alert response SLAs
- [ ] Escalation procedures

---

## Incident Response

### Incident Detection

**Methods**:
1. **Automated Alerts**: Cloud Vista, Azure Monitor
2. **Manual Reports**: Users, customers, team members
3. **Security Scans**: (Currently limited - need improvement)

---

### Incident Notification

**Who Gets Notified**:
1. **CTO** (Soon Seah / SS)
2. **R&D Director** (Gna)
3. **Farhan** (infrastructure and security)
4. **Responsible Technical Person** (depending on system)

**Notification Methods**: ❓ Need to document:
- [ ] Email alerts
- [ ] SMS/phone call (for critical incidents)
- [ ] Slack/Teams notification
- [ ] PagerDuty or similar (for on-call)

---

### Incident Response Process (Recommended)

**Current Process**: Ad-hoc (CTO and Gna notified, then respond)

**Recommended Process**:

#### 1. **Detection & Reporting**
- Incident detected via alerts or manual report
- Log incident in Jira (see Incident Tracking below)

#### 2. **Initial Assessment** (5-15 minutes)
- Determine severity:
  - **P1/Critical**: Production down, data breach, security compromise
  - **P2/High**: Partial outage, performance degradation
  - **P3/Medium**: Non-critical issues, workaround available
  - **P4/Low**: Minor issues, no business impact
- Notify appropriate personnel based on severity
- Assign incident commander (usually Gna or SS for P1/P2)

#### 3. **Containment** (Immediate)
- Stop the spread of the incident
- For security incidents:
  - Isolate affected systems
  - Disable compromised accounts
  - Block malicious IPs
  - Preserve evidence

#### 4. **Investigation**
- Determine root cause
- Collect logs and evidence
- Document timeline of events
- Identify affected systems and data

#### 5. **Eradication**
- Remove root cause (patch vulnerability, remove malware, etc.)
- Verify threat is eliminated
- Strengthen security controls

#### 6. **Recovery**
- Restore systems from clean backups (if needed)
- Restore services in stages
- Monitor for recurrence
- Validate system integrity

#### 7. **Post-Incident Review**
- Document incident details in Jira
- Conduct lessons learned meeting within 5 days
- Identify improvements to prevent recurrence
- Update runbooks and procedures
- Communicate with stakeholders

---

### Incident Tracking

**Tool**: ✅ **Jira**

**Status**: ❓ Need to document:
- [ ] Jira project for incident tracking
- [ ] Incident ticket template/workflow
- [ ] Required fields (severity, affected systems, timeline)
- [ ] Who can create incident tickets
- [ ] Incident review cadence
- [ ] Incident metrics and reporting

**Recommendation**: Create standardized Jira workflow for security incidents

---

### Incident Response Roles

**Status**: ❓ Need to define:
- [ ] Incident Commander (decision maker)
- [ ] Technical Lead (hands-on remediation)
- [ ] Communications Lead (stakeholder updates)
- [ ] Scribe (documentation)

**Likely Roles**:
- **Incident Commander**: Gna or SS (depending on incident type)
- **Technical Lead**: Farhan, or relevant engineer
- **Communications**: SS (for customer communication)

---

### Incident Communication

**Status**: ❓ Need to document:
- [ ] Internal communication plan (Slack, email, etc.)
- [ ] Customer communication plan (when to notify, how, who)
- [ ] Status page updates (if applicable)
- [ ] Post-incident communication to customers
- [ ] Regulatory notification requirements (data breaches)

---

## Compliance & Audit

### Security Compliance Checks

**Status**: ❓ Need to implement:
- [ ] Regular security compliance audits
- [ ] Azure security posture review (Secure Score)
- [ ] GitHub security review
- [ ] Access review (quarterly)
- [ ] Security training for team

---

### Security Documentation

**Status**: ❓ Need to create:
- [ ] Information Security Policy
- [ ] Acceptable Use Policy
- [ ] Incident Response Plan
- [ ] Data Classification Policy
- [ ] Access Control Policy
- [ ] Secure Coding Guidelines
- [ ] Security Awareness Training materials

---

## Action Items

### URGENT - High Compliance Risk
- [ ] **Enable GitHub Dependabot** on all repositories
- [ ] **Configure GitHub Advanced Security** code scanning internally
- [ ] **Farhan to enable Azure Defender** for VMs, AKS, Container Registry
- [ ] **Verify antivirus** on all 15 employee laptops
- [ ] **Upgrade aksau** Kubernetes cluster (covered in security-issues.md)

### High Priority
- [ ] Document incident response procedures
- [ ] Create Jira workflow for incidents
- [ ] Define RTO/RPO for incident response
- [ ] Document IP whitelist configuration
- [ ] Schedule first penetration test
- [ ] Document patch management process

### Medium Priority
- [ ] Enable container image vulnerability scanning
- [ ] Implement regular security compliance reviews
- [ ] Create security awareness training program
- [ ] Document all security policies
- [ ] Implement endpoint device management (Intune)

### Low Priority
- [ ] Evaluate SIEM integration (Azure Sentinel)
- [ ] Consider security automation (SOAR)
- [ ] Implement security metrics dashboard
- [ ] Schedule security tabletop exercises

---

## ISO 27001 Requirements

### Currently Satisfied
- ✅ Network security (A.13.1.1) - NSGs, VNets, Bastion
- ✅ Access control (A.9.1.2) - Azure RBAC
- ✅ Production DB restrictions (A.9.4.1)
- ✅ Incident detection (A.16.1.1) - Cloud Vista
- ✅ Incident tracking (A.16.1.5) - Jira

### HIGH RISK - Requires Immediate Action
- 🔴 Dependency scanning (A.14.2.1, A.12.6.1) - **NOT IMPLEMENTED**
- 🔴 Code security testing (A.14.2.8) - **NOT CONFIGURED INTERNALLY**
- 🔴 Vulnerability scanning (A.12.6.1) - **NOT ENABLED**

### Requires Documentation
- ❓ Incident response procedures (A.16.1.5)
- ❓ Security event logging (A.12.4.1)
- ❓ Patch management (A.12.6.1)
- ❓ Security policies (A.5.1.1)

### Requires Verification
- ❓ Antivirus on all endpoints (A.12.2.1)
- ❓ Endpoint encryption (A.10.1.1)
- ❓ Kubernetes network policies (A.13.1.3)
- ❓ Audit logging enabled (A.12.4.1)

---
