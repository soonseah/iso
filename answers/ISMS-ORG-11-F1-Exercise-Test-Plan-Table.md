# ISMS-ORG-11-F1: Exercise & Test Plan

**Document Owner**: CTO (Soon Seah)
**Approved By**: R&D Director (Gna)
**Last Updated**: 2025-10-15
**Review Period**: Annually
**Next Review**: 2026-10-15

---

## Annual Exercise & Test Schedule

| Type of Exercise | Exercise Plan Title | Objectives | Resources Required | Persons Involved | Date of Exercise | Duration of Exercise |
|------------------|---------------------|------------|-------------------|------------------|------------------|---------------------|
| **Backup Recovery** | VM Backup Restore Test - Q1 | - Verify VM restore capability<br>- Measure RTO/RPO<br>- Validate backup integrity | - Azure Backup Vault access<br>- Test environment/subscription<br>- VM restore runbook | - Infrastructure Engineer<br>- Farhan (oversight) | January 2026 | 4 hours |
| **Backup Recovery** | Database Restore Test - Q1 | - Verify database restore<br>- Test data integrity<br>- Measure recovery time | - Database backups<br>- Test AKS namespace<br>- Database tools | - DBA/Developer<br>- Farhan | January 2026 | 4 hours |
| **Backup Recovery** | VM Backup Restore Test - Q2 | - Quarterly restore verification<br>- Test different VM<br>- Update procedures | - Azure Backup Vault<br>- Test environment | - Infrastructure Engineer<br>- Farhan | April 2026 | 4 hours |
| **Backup Recovery** | Database Restore Test - Q2 | - Quarterly DB restore test<br>- Rotate database tested | - Database backups<br>- Test environment | - DBA/Developer<br>- Farhan | April 2026 | 4 hours |
| **Backup Recovery** | K8s PVC Restore Test | - Verify PVC restore capability<br>- Test volume snapshots | - AKS cluster access<br>- PVC snapshots<br>- kubectl | - DevOps/K8s Admin<br>- Developer | March 2026 | 3 hours |
| **Disaster Recovery** | DR Tabletop Exercise - Q1 | - Walk through DR scenarios<br>- Identify procedure gaps<br>- Train team on DR plan | - DR plan documentation<br>- Meeting room/virtual meeting<br>- Scenario documents | - CTO (SS)<br>- Gna<br>- Farhan<br>- Key Engineers | February 2026 | 2 hours |
| **Disaster Recovery** | DR Failover Test (SEA→AU) | - Test region failover<br>- Verify aksau can handle load<br>- Measure failover time<br>- Practice failback | - Both AKS clusters<br>- DNS/Load balancer access<br>- Monitoring tools<br>- Customer notification plan | - CTO (SS)<br>- Gna<br>- Farhan<br>- Infrastructure Team<br>- Development Team | Q3 2026 (TBD) | 8-12 hours (planned maintenance) |
| **Disaster Recovery** | DR Tabletop Exercise - Q3 | - Scenario: Ransomware attack<br>- Test communication plan<br>- Review DR procedures | - DR plan<br>- Meeting facility<br>- Scenario inject materials | - CTO (SS)<br>- Gna<br>- Farhan<br>- Security Team | August 2026 | 2 hours |
| **Incident Response** | Security Incident Simulation | - Test incident response plan<br>- Practice containment<br>- Test Jira workflow<br>- Verify notification chain | - Incident response plan<br>- Jira access<br>- Simulation scenario<br>- Test environment | - CTO (SS)<br>- Gna<br>- Farhan<br>- Incident Response Team<br>- Facilitator | May 2026 | 3-4 hours |
| **Incident Response** | Incident Communication Drill - Q2 | - Test alert notifications<br>- Practice customer comms<br>- Verify escalation chain | - Alert system<br>- Email/SMS testing<br>- Communication templates | - CTO (SS)<br>- Gna<br>- Farhan<br>- Customer Support | June 2026 | 2 hours |
| **Incident Response** | Incident Communication Drill - Q4 | - Re-test communications<br>- Different scenario<br>- Verify improvements | - Alert system<br>- Communication tools | - CTO (SS)<br>- Gna<br>- Farhan | December 2026 | 2 hours |
| **Security Controls** | Access Control Review - Q1 | - Review Azure AD users<br>- Audit external/guest users<br>- Remove unnecessary access<br>- Test RBAC restrictions | - Azure AD access<br>- User list spreadsheet<br>- Access review checklist | - Farhan<br>- CTO (approval) | January 2026 | 3 hours |
| **Security Controls** | Access Control Review - Q2 | - Quarterly access review<br>- Verify MFA enforcement<br>- Test access restrictions | - Azure AD/RBAC<br>- Access matrix | - Farhan<br>- CTO | April 2026 | 2 hours |
| **Security Controls** | Access Control Review - Q3 | - Quarterly review<br>- External user validation | - Azure AD<br>- Access records | - Farhan<br>- CTO | July 2026 | 2 hours |
| **Security Controls** | Access Control Review - Q4 | - Year-end access review<br>- Annual cleanup<br>- Update policies | - Azure AD<br>- Annual access report | - Farhan<br>- CTO | October 2026 | 3 hours |
| **Security Controls** | Vulnerability Scan Verification | - Verify Dependabot running<br>- Check GitHub CodeQL<br>- Review Azure Defender<br>- Track remediation | - GitHub access<br>- Azure Defender portal<br>- Vulnerability reports | - Development Team<br>- Farhan | Monthly (ongoing) | 1 hour/month |
| **Security Controls** | Penetration Testing | - External security assessment<br>- Test Cloud Vista platform<br>- Test CRM application<br>- Identify vulnerabilities | - External pen test firm<br>- Test credentials<br>- Scope document<br>- Budget ($5-10k estimate) | - CTO (SS)<br>- Gna<br>- Farhan<br>- External Pen Testers | Q2 2026 (April-May) | 2 weeks (external firm) + 1 week (remediation) |
| **Monitoring & Alerting** | Alert Functionality Test - Q2 | - Trigger test alerts<br>- Verify notification delivery<br>- Test escalation chain<br>- Validate alert content | - Cloud Vista<br>- Azure Monitor<br>- Test environment<br>- Alert configuration | - Farhan<br>- On-call Engineer | June 2026 | 2 hours |
| **Monitoring & Alerting** | Alert Functionality Test - Q4 | - Re-test alerting<br>- Different alert types<br>- Verify improvements | - Monitoring tools<br>- Test environment | - Farhan<br>- On-call Engineer | December 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q1 | - Practice log analysis<br>- Review security events<br>- Train team on log tools | - Cloud Vista logs<br>- Azure logs<br>- AKS logs | - Farhan<br>- Senior Engineers<br>- Security Team | March 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q2 | - Quarterly log review<br>- Anomaly detection practice | - Log analytics tools | - Security Team<br>- Engineers | June 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q3 | - Quarterly log review<br>- Update alerting rules | - Log analytics tools | - Security Team | September 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q4 | - Year-end log review<br>- Security event summary | - Log analytics tools<br>- Annual log report | - Security Team | December 2026 | 2 hours |
| **Business Continuity** | Key Personnel Unavailability Drill | - Simulate CTO absence<br>- Test knowledge transfer<br>- Verify backup contacts<br>- Update documentation | - BC plan<br>- Contact lists<br>- Procedure documentation<br>- Scenario description | - Remaining Team Members<br>- (CTO simulated absent)<br>- Gna (lead) | August 2026 | 1 day (simulation) |
| **Business Continuity** | Supplier Failure Scenario | - Tabletop: Azure outage<br>- Identify dependencies<br>- Review workarounds<br>- Update BC plan | - BC plan<br>- Supplier/vendor list<br>- Dependency map<br>- Meeting facility | - CTO (SS)<br>- Gna<br>- Farhan<br>- Operations Team | November 2026 | 2 hours |
| **Training & Awareness** | Phishing Simulation - Q1 | - Test employee awareness<br>- Identify training needs<br>- Measure click rate | - Phishing simulation tool/service<br>- Email templates<br>- Training materials | - IT/Security Team<br>- All 15 Employees | January 2026 | 30 min (employee time) |
| **Training & Awareness** | Phishing Simulation - Q2 | - Quarterly phishing test<br>- Different scenario<br>- Track improvement | - Phishing tool<br>- New templates | - IT/Security<br>- All Employees | April 2026 | 30 min |
| **Training & Awareness** | Security Awareness Quiz - Q2 | - Test policy knowledge<br>- Identify gaps<br>- Provide training | - Quiz platform/form<br>- Quiz questions<br>- Training materials | - HR/IT<br>- All 15 Employees | May 2026 | 30 min (employee time) |
| **Training & Awareness** | Phishing Simulation - Q3 | - Quarterly test<br>- Advanced scenarios | - Phishing tool | - IT/Security<br>- All Employees | July 2026 | 30 min |
| **Training & Awareness** | Phishing Simulation - Q4 | - Year-end test<br>- Annual summary report | - Phishing tool<br>- Annual report | - IT/Security<br>- All Employees | October 2026 | 30 min |
| **Training & Awareness** | Security Awareness Quiz - Q4 | - Semi-annual knowledge test<br>- Year-end training<br>- Prepare for next year | - Quiz platform<br>- Updated materials | - HR/IT<br>- All Employees | November 2026 | 30 min |
| **Compliance** | Internal Audit Simulation | - Pre-audit readiness check<br>- Review all ISMS docs<br>- Test controls<br>- Identify gaps<br>- Create CAP | - ISMS documentation<br>- Audit checklist<br>- ISO 27001 standard<br>- Meeting rooms | - CTO (SS)<br>- Gna<br>- Farhan<br>- All Process Owners<br>- Internal Auditor (if available) | August 2026 | 3-5 days |

---

## Summary Statistics

**Total Exercises Planned**: 37 activities across 8 categories

**By Type**:
- Backup Recovery: 5 tests
- Disaster Recovery: 3 tests
- Incident Response: 3 drills
- Security Controls: 7 activities
- Monitoring & Alerting: 6 exercises
- Business Continuity: 2 drills
- Training & Awareness: 6 tests
- Compliance: 1 audit

**Total Estimated Time Commitment**: ~90-100 hours across all activities for the year

**Key Milestones**:
- Q1 2026: Backup tests, access review, phishing simulation
- Q2 2026: Incident drills, penetration test, security quiz
- Q3 2026: DR failover test, personnel drill, internal audit prep
- Q4 2026: Year-end reviews, final tests, audit simulation

---

## Post-Exercise Documentation Requirements

After EACH exercise, the following must be recorded:

1. **Exercise Completion Form** (in Jira or document):
   - Date and time conducted
   - Actual participants
   - Actual duration
   - Objectives achieved (Y/N)
   - Success criteria met (Y/N)

2. **Results Summary**:
   - What worked well
   - What didn't work
   - Issues/failures encountered
   - Time measurements (RTO/RPO if applicable)

3. **Corrective Actions**:
   - Issues requiring remediation
   - Owner assigned
   - Target completion date
   - Priority level

4. **Lessons Learned**:
   - Key takeaways
   - Training needs identified
   - Process improvements needed

5. **Documentation Updates**:
   - Procedures updated (Y/N)
   - Runbooks revised (Y/N)
   - Training materials updated (Y/N)

**Storage Location**: Jira tickets (tag: ISMS-Exercise) + Summary in this document

---

## Exercise Postponement/Rescheduling

If an exercise must be postponed:
1. Document reason for postponement
2. Get CTO approval
3. Reschedule within 30 days
4. Update this plan
5. Notify all participants

**Maximum Postponement**: No more than 60 days from original date

---

## Continuous Improvement

This plan will be updated:
- After each major exercise (lessons learned)
- Quarterly review of schedule adherence
- Annually (full plan review in October)
- When infrastructure/processes change significantly
- After ISO 27001 audits

---

## Approval

**Prepared By**: ___________________ (Technical Team) Date: ___________

**Reviewed By**: ___________________ (Gna, R&D Director) Date: ___________

**Approved By**: ___________________ (Soon Seah, CTO) Date: ___________

---

## Appendix A: Quick Reference - 2026 Calendar

**January**: VM Restore, DB Restore, Access Review, Phishing Sim
**February**: DR Tabletop
**March**: K8s PVC Restore, Log Review
**April**: Quarterly Tests (VM, DB, Access, Phishing)
**May**: Security Incident Sim, Security Quiz, Penetration Test
**June**: Comms Drill, Alert Test, Log Review
**July**: Access Review, Phishing Sim
**August**: DR Tabletop, DR Failover, Personnel Drill, Internal Audit
**September**: Log Review
**October**: Access Review, Phishing Sim
**November**: Supplier Failure Scenario, Security Quiz
**December**: Comms Drill, Alert Test, Log Review

---
