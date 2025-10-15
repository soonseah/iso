# ISMS-ORG-11-F1: Exercise & Test Plan

**Document Owner**: CTO / R&D Director
**Last Updated**: 2025-10-15
**Review Frequency**: Annually
**Next Review Date**: 2026-10-15

---

## Purpose

This document outlines the exercise and testing plan for NetGain Systems' Information Security Management System (ISMS) to ensure:
- Business continuity and disaster recovery capabilities are effective
- Incident response procedures are functional
- Technical controls operate as designed
- Team members are trained and prepared
- Compliance with ISO 27001 requirements (A.17.1.3)

---

## 1. Backup & Recovery Testing

### 1.1 VM Backup Restore Test

**Objective**: Verify ability to restore virtual machines from Azure Backup

**Frequency**: Quarterly (every 3 months)

**Scope**: All production VMs (m1-emedge1, ubuntu-test1, emedge-vm1, emedge-vm2)

**Test Procedure**:
1. Select one VM for restore testing (rotate through VMs each quarter)
2. Restore VM from most recent snapshot to test environment
3. Verify VM boots successfully
4. Verify applications start correctly
5. Verify data integrity
6. Document time taken (RTO measurement)
7. Document any data loss (RPO measurement)
8. Clean up test environment

**Success Criteria**:
- VM restored within 4 hours (RTO)
- Data loss less than 24 hours (RPO)
- All applications functional
- No data corruption detected

**Participants**: Infrastructure team, designated engineer

**Last Test**: July 2025 (approximately)

**Next Test**: January 2026

---

### 1.2 Database Backup Restore Test

**Objective**: Verify ability to restore databases (Elasticsearch, CRM, MongoDB)

**Frequency**: Quarterly (every 3 months)

**Scope**:
- Elasticsearch (observability data)
- CRM database
- MongoDB (if applicable)

**Test Procedure**:
1. Select one database for testing (rotate each quarter)
2. Restore database from backup to test environment/namespace
3. Verify data integrity (record counts, sample queries)
4. Test application connectivity
5. Measure restore time
6. Verify no data corruption
7. Document findings
8. Clean up test resources

**Success Criteria**:
- Database restored within 4 hours
- Data integrity verified
- Applications can connect successfully
- No data corruption

**Participants**: Database administrator, development team

**Next Test**: January 2026

---

### 1.3 Kubernetes Persistent Volume Restore

**Objective**: Verify ability to restore AKS persistent volumes

**Frequency**: Semi-annually (every 6 months)

**Scope**: Critical persistent volumes in production AKS clusters

**Test Procedure**:
1. Identify PVC to test
2. Create snapshot or backup
3. Simulate data loss (in test namespace)
4. Restore PVC from snapshot
5. Reattach to pod and verify data
6. Document restore time and issues
7. Clean up test resources

**Success Criteria**:
- PVC restored successfully
- Data accessible by pods
- No data loss beyond RPO
- Restore time within RTO

**Participants**: Kubernetes administrator, DevOps team

**Next Test**: March 2026

---

## 2. Disaster Recovery Testing

### 2.1 Failover Test (SEA to AU)

**Objective**: Test failover from Southeast Asia region to Australia East region

**Frequency**: Annually

**Scope**: Failover of critical services from aks (SEA) to aksau (AU)

**Test Procedure**:
1. **Planning Phase** (2 weeks before):
   - Document current state
   - Notify stakeholders
   - Prepare rollback plan
   - Schedule maintenance window

2. **Pre-Test Checks**:
   - Verify aksau cluster health
   - Verify data replication status
   - Verify DNS/load balancer configuration
   - Backup current configurations

3. **Failover Execution**:
   - Update DNS/traffic routing to AU region
   - Verify application availability in AU
   - Test customer access
   - Monitor for errors
   - Document failover time

4. **Post-Test**:
   - Restore traffic to SEA (failback)
   - Document lessons learned
   - Update DR procedures
   - Communicate results to team

**Success Criteria**:
- Failover completed within 8 hours
- All critical services functional in AU
- No data loss
- Customer access maintained

**Participants**: CTO, R&D Director, Infrastructure team, Development team

**Next Test**: Q3 2026 (full DR test)

---

### 2.2 DR Tabletop Exercise

**Objective**: Walk through disaster scenarios without actual failover

**Frequency**: Semi-annually (6 months)

**Scope**: Various disaster scenarios (datacenter outage, ransomware, etc.)

**Test Procedure**:
1. Select disaster scenario
2. Gather response team (Gna, SS, Farhan, engineers)
3. Walk through response steps
4. Identify gaps or unclear procedures
5. Document action items
6. Update DR plan

**Scenarios to Test**:
- Complete SEA region outage
- Ransomware attack on AKS cluster
- Database corruption
- Prolonged internet outage
- Key personnel unavailable

**Success Criteria**:
- Team understands roles and responsibilities
- Procedures are clear and actionable
- Gaps identified and documented
- DR plan updated

**Participants**: CTO (SS), R&D Director (Gna), Farhan, key engineers

**Next Test**: Q1 2026, Q3 2026

---

## 3. Incident Response Testing

### 3.1 Security Incident Simulation

**Objective**: Test incident response procedures for security incidents

**Frequency**: Annually

**Scope**: Simulated security incident (e.g., compromised account, malware detection)

**Test Procedure**:
1. **Preparation**:
   - Select scenario (rotate scenarios each year)
   - Brief facilitator (not participants)
   - Prepare inject materials

2. **Simulation**:
   - Inject incident (simulated alert/report)
   - Observe team response
   - Provide additional injects as needed
   - Document response actions and timeline

3. **Debrief**:
   - Discuss what went well
   - Identify improvement areas
   - Update incident response procedures
   - Schedule remediation actions

**Scenarios**:
- Year 1: Compromised developer account
- Year 2: Malware detected on laptop
- Year 3: Customer data breach
- Year 4: DDoS attack
- Year 5: Insider threat

**Success Criteria**:
- Incident detected and reported promptly
- Correct personnel notified
- Containment actions taken
- Jira ticket created
- Communication appropriate
- Post-incident review scheduled

**Participants**: CTO (SS), Gna, Farhan, incident response team

**Next Test**: Q2 2026

---

### 3.2 Incident Communication Drill

**Objective**: Test communication procedures during incidents

**Frequency**: Semi-annually

**Scope**: Internal and external communication during incidents

**Test Procedure**:
1. Simulate incident requiring customer communication
2. Test alert notification (email, SMS, etc.)
3. Practice status page updates (if applicable)
4. Draft customer communication
5. Practice escalation procedures
6. Document communication timeline

**Success Criteria**:
- All team members receive alerts within 15 minutes
- Stakeholders notified appropriately
- Customer communication clear and timely
- Escalation chain followed

**Participants**: CTO (SS), Gna, Farhan, customer-facing team

**Next Test**: Q2 2026, Q4 2026

---

## 4. Security Controls Testing

### 4.1 Access Control Review & Testing

**Objective**: Verify access controls are working as designed

**Frequency**: Quarterly

**Scope**: Azure RBAC, Kubernetes RBAC, GitHub access, application access

**Test Procedure**:
1. Review current access lists (Azure AD, GitHub, etc.)
2. Test access restrictions:
   - Verify prod DB inaccessible from dev machines
   - Test MFA enforcement
   - Verify least privilege access
3. Review external/guest users (17 users)
4. Remove unnecessary accounts
5. Document findings and remediation

**Success Criteria**:
- No unauthorized access detected
- External users reviewed and justified
- Unused accounts removed
- MFA functioning correctly

**Participants**: Farhan, CTO approval for changes

**Next Test**: Q1 2026 (then quarterly)

---

### 4.2 Vulnerability Scanning Verification

**Objective**: Verify vulnerability scanning tools are functioning

**Frequency**: Monthly (after initial setup)

**Scope**: Dependabot, GitHub Advanced Security, Azure Defender

**Test Procedure**:
1. Verify Dependabot alerts are generated
2. Verify CodeQL scans running on PRs
3. Check Azure Defender findings
4. Review open vulnerabilities
5. Verify remediation workflow
6. Document scan results

**Success Criteria**:
- All scanning tools operational
- Vulnerabilities detected and reported
- High/critical issues addressed within SLA
- Scan results reviewed monthly

**Participants**: Development team, Farhan

**Next Test**: Monthly starting Q1 2026

---

### 4.3 Penetration Testing

**Objective**: Independent security assessment of systems

**Frequency**: Annually

**Scope**: Cloud Vista platform, CRM application, Azure infrastructure

**Test Procedure**:
1. Engage external penetration testing firm
2. Define scope (in-scope vs out-of-scope)
3. Provide necessary access
4. Monitor testing (notify team it's happening)
5. Review findings report
6. Prioritize remediation
7. Re-test critical findings
8. Document results

**Success Criteria**:
- Penetration test completed
- No critical vulnerabilities found (or all remediated)
- Report reviewed with team
- Remediation plan created

**Participants**: CTO (SS), Gna, Farhan, external pen test firm

**Next Test**: Q2 2026 (first pen test)

---

## 5. Monitoring & Alerting Testing

### 5.1 Alert Testing

**Objective**: Verify monitoring alerts are working correctly

**Frequency**: Semi-annually

**Scope**: Cloud Vista alerts, Azure Monitor alerts, security alerts

**Test Procedure**:
1. Trigger test alerts (in non-prod if possible):
   - VM CPU spike
   - Pod failure in AKS
   - Failed authentication attempts
   - Disk space threshold
2. Verify alerts received by correct people
3. Verify alert contains useful information
4. Test escalation if no response
5. Document response time
6. Update alert configurations if needed

**Success Criteria**:
- Alerts delivered within 5 minutes
- Correct recipients notified (Gna, SS, Farhan)
- Alert information actionable
- Escalation works if needed

**Participants**: Farhan, on-call engineer

**Next Test**: Q2 2026, Q4 2026

---

### 5.2 Log Review Exercise

**Objective**: Practice log analysis for security events

**Frequency**: Quarterly

**Scope**: Cloud Vista logs, Azure logs, AKS logs

**Test Procedure**:
1. Select time period for review (e.g., past week)
2. Review logs for:
   - Failed authentication attempts
   - Unusual access patterns
   - Configuration changes
   - Errors or anomalies
3. Investigate suspicious events
4. Document findings
5. Update alerting rules if needed

**Success Criteria**:
- Logs accessible and searchable
- Anomalies detected (if any)
- Team familiar with log analysis tools
- Process documented

**Participants**: Security team, Farhan, senior engineers

**Next Test**: Quarterly starting Q1 2026

---

## 6. Business Continuity Testing

### 6.1 Key Personnel Unavailability Drill

**Objective**: Test procedures when key personnel are unavailable

**Frequency**: Annually

**Scope**: Simulate absence of CTO, R&D Director, or key engineer

**Test Procedure**:
1. Select key person to simulate absence
2. Brief team (person X is unavailable for 24 hours)
3. Introduce scenario requiring decisions/actions
4. Observe how team responds without key person
5. Test backup contacts and procedures
6. Document gaps in knowledge transfer
7. Update procedures and documentation

**Success Criteria**:
- Critical operations continue
- Team knows who to escalate to
- Documentation sufficient for continuity
- Gaps identified and addressed

**Participants**: Remaining team members (rotate who is "unavailable")

**Next Test**: Q3 2026

---

### 6.2 Supplier Failure Scenario

**Objective**: Test response to critical supplier/vendor failure

**Frequency**: Annually

**Scope**: Azure outage, GitHub outage, critical SaaS tool failure

**Test Procedure**:
1. Select vendor to simulate (e.g., "Azure SEA region down")
2. Walk through response steps
3. Identify dependencies
4. Test failover or workarounds
5. Document gaps in procedures
6. Update business continuity plan

**Success Criteria**:
- Team understands dependencies
- Workarounds identified
- Customer communication planned
- Procedures updated

**Participants**: CTO (SS), Gna, Farhan, operations team

**Next Test**: Q4 2026

---

## 7. Training & Awareness Testing

### 7.1 Phishing Simulation

**Objective**: Test employee security awareness

**Frequency**: Quarterly

**Scope**: All 15 employees

**Test Procedure**:
1. Send simulated phishing emails
2. Track who clicks or reports
3. Provide immediate training to those who clicked
4. Document results
5. Conduct security awareness refresher training
6. Repeat quarterly with different scenarios

**Success Criteria**:
- <20% click rate
- >50% report phishing emails
- Improvement over time
- Training provided to those who clicked

**Participants**: All employees

**Next Test**: Quarterly starting Q1 2026

---

### 7.2 Security Awareness Quiz

**Objective**: Verify employee understanding of security policies

**Frequency**: Semi-annually

**Scope**: All employees

**Test Procedure**:
1. Create quiz covering:
   - Password policies
   - Data handling
   - Incident reporting
   - Acceptable use
   - Social engineering awareness
2. Distribute quiz
3. Review results
4. Provide additional training where needed
5. Document completion

**Success Criteria**:
- 100% completion rate
- >80% average score
- Remedial training for low scorers

**Participants**: All employees

**Next Test**: Q2 2026, Q4 2026

---

## 8. Compliance Testing

### 8.1 Audit Simulation

**Objective**: Prepare for ISO 27001 audit

**Frequency**: Annually (before real audit)

**Scope**: Full ISMS documentation and controls

**Test Procedure**:
1. Internal audit of ISMS
2. Review all documentation
3. Interview personnel
4. Test technical controls
5. Identify non-conformities
6. Create corrective action plan
7. Implement corrections before real audit

**Success Criteria**:
- All documentation complete and current
- Controls operating effectively
- Non-conformities identified and resolved
- Team prepared for audit questions

**Participants**: CTO (SS), Gna, Farhan, all process owners

**Next Test**: Q3 2026 (before certification audit)

---

## Test Schedule Summary

| Test Activity                      | Frequency     | Next Test  | Owner          |
|------------------------------------|---------------|------------|----------------|
| VM Backup Restore                  | Quarterly     | Jan 2026   | Infrastructure |
| Database Backup Restore            | Quarterly     | Jan 2026   | Dev/DBA        |
| K8s PVC Restore                    | Semi-annually | Mar 2026   | DevOps         |
| DR Failover Test                   | Annually      | Q3 2026    | CTO/All        |
| DR Tabletop Exercise               | Semi-annually | Q1, Q3 2026| CTO/Gna/Farhan |
| Security Incident Simulation       | Annually      | Q2 2026    | CTO/Gna/Farhan |
| Incident Communication Drill       | Semi-annually | Q2, Q4 2026| CTO/Gna        |
| Access Control Review              | Quarterly     | Q1 2026    | Farhan         |
| Vulnerability Scan Verification    | Monthly       | Monthly    | Dev/Farhan     |
| Penetration Testing                | Annually      | Q2 2026    | CTO/External   |
| Alert Testing                      | Semi-annually | Q2, Q4 2026| Farhan         |
| Log Review Exercise                | Quarterly     | Quarterly  | Security team  |
| Key Personnel Unavailability       | Annually      | Q3 2026    | All            |
| Supplier Failure Scenario          | Annually      | Q4 2026    | CTO/Gna        |
| Phishing Simulation                | Quarterly     | Quarterly  | HR/IT          |
| Security Awareness Quiz            | Semi-annually | Q2, Q4 2026| HR/IT          |
| Internal Audit Simulation          | Annually      | Q3 2026    | CTO/All        |

---

## Documentation Requirements

After each test, the following must be documented:
- Test date and participants
- Test objectives
- Test procedures followed
- Results and observations
- Issues/failures identified
- Corrective actions required
- Time taken (for RTO/RPO measurement)
- Lessons learned
- Updates needed to procedures

**Documentation Location**: Jira (test tickets) + This document (summary)

---

## Roles & Responsibilities

| Role              | Responsibilities                                        |
|-------------------|---------------------------------------------------------|
| CTO (SS)          | Overall ISMS test plan ownership, DR tests, audits     |
| R&D Director (Gna)| Technical test coordination, incident simulation        |
| Farhan            | Security tests, Azure Defender, access reviews          |
| Infrastructure    | Backup/restore tests, VM management                     |
| Development Team  | Database tests, application testing, code security      |
| DevOps/K8s Team   | AKS tests, container tests, deployment tests            |
| All Employees     | Security awareness, phishing tests, training            |

---

## Review & Updates

This Exercise & Test Plan will be reviewed and updated:
- Annually (October each year)
- After each major test (lessons learned)
- When significant changes occur to infrastructure or processes
- After ISO 27001 audits

**Next Review Date**: October 2026

---

**Document Approval**:
- CTO (Soon Seah): _________________ Date: _________
- R&D Director (Gna): _________________ Date: _________

---
