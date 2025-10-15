# ISMS-ORG-11-F1: Exercise & Test Plan (Simplified)

**Document Owner**: CTO (Soon Seah)
**Approved By**: R&D Director (Gna)
**Last Updated**: 2025-10-15
**Review Period**: Annually
**Next Review**: 2026-10-15

---

## Simplified Annual Exercise & Test Schedule

Focus on **low-risk, demonstrable activities** across 4 key areas:
1. **Backup & Recovery Testing**
2. **Disaster Recovery (Tabletop only)**
5. **Monitoring & Alerting Testing**
7. **Training & Awareness Testing**

---

| Type of Exercise | Exercise Plan Title | Objectives | Resources Required | Persons Involved | Date of Exercise | Duration of Exercise |
|------------------|---------------------|------------|-------------------|------------------|------------------|---------------------|
| **Backup Recovery** | VM Backup Restore Test - Q1 | - Verify VM restore capability<br>- Measure RTO/RPO<br>- Validate backup integrity | - Azure Backup Vault access<br>- Test environment<br>- VM restore runbook | - Infrastructure Engineer<br>- Farhan (oversight) | January 2026 | 4 hours |
| **Backup Recovery** | Database Restore Test - Q2 | - Verify database restore<br>- Test data integrity<br>- Measure recovery time | - Database backups<br>- Test AKS namespace<br>- Database tools | - DBA/Developer<br>- Farhan | April 2026 | 4 hours |
| **Backup Recovery** | VM Backup Restore Test - Q3 | - Verify restore still works<br>- Test different VM<br>- Update procedures | - Azure Backup Vault<br>- Test environment | - Infrastructure Engineer<br>- Farhan | July 2026 | 4 hours |
| **Backup Recovery** | Database Restore Test - Q4 | - Year-end restore verification<br>- Different database | - Database backups<br>- Test environment | - DBA/Developer<br>- Farhan | October 2026 | 4 hours |
| **Disaster Recovery** | DR Tabletop Exercise - Q1 | - Walk through DR scenarios<br>- Identify procedure gaps<br>- No actual systems affected | - DR plan documentation<br>- Meeting room<br>- Scenario documents | - CTO (SS)<br>- Gna<br>- Farhan<br>- Key Engineers | February 2026 | 2 hours |
| **Disaster Recovery** | DR Tabletop Exercise - Q3 | - Scenario: Regional outage<br>- Review procedures<br>- Update documentation | - DR plan<br>- Meeting facility<br>- Scenario materials | - CTO (SS)<br>- Gna<br>- Farhan<br>- Engineers | August 2026 | 2 hours |
| **Monitoring & Alerting** | Alert Functionality Test - Q2 | - Trigger test alerts in non-prod<br>- Verify notification delivery<br>- Test escalation chain | - Cloud Vista<br>- Azure Monitor<br>- Test environment only | - Farhan<br>- On-call Engineer | June 2026 | 2 hours |
| **Monitoring & Alerting** | Alert Functionality Test - Q4 | - Re-test alerting<br>- Verify improvements<br>- Different alert types | - Monitoring tools<br>- Test environment | - Farhan<br>- On-call Engineer | December 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q1 | - Review past week's logs<br>- Practice anomaly detection<br>- Document findings | - Cloud Vista logs<br>- Azure logs | - Farhan<br>- Senior Engineer | March 2026 | 2 hours |
| **Monitoring & Alerting** | Log Review Exercise - Q3 | - Quarterly log review<br>- Security event analysis<br>- Update alert rules | - Log analytics tools | - Farhan<br>- Security Team | September 2026 | 2 hours |
| **Training & Awareness** | Phishing Simulation - Q1 | - Send test phishing email<br>- Measure click rate<br>- Provide training | - Simple phishing tool/manual email<br>- Training materials | - Farhan/IT<br>- All Employees | February 2026 | 30 min (employee time) |
| **Training & Awareness** | Security Awareness Quiz - Q2 | - Test policy knowledge<br>- 10 question quiz<br>- Identify training needs | - Google Forms/simple quiz<br>- Quiz questions | - Farhan/HR<br>- All Employees | May 2026 | 15-20 min (employee time) |
| **Training & Awareness** | Phishing Simulation - Q3 | - Different phishing scenario<br>- Track improvement<br>- Brief training | - Email template<br>- Training slides | - Farhan/IT<br>- All Employees | August 2026 | 30 min |
| **Training & Awareness** | Security Awareness Quiz - Q4 | - Year-end knowledge check<br>- Simple quiz<br>- Annual summary | - Quiz platform<br>- Results summary | - Farhan/HR<br>- All Employees | November 2026 | 15-20 min |

---

## Summary

**Total Exercises**: 14 activities (reduced from 37)

**By Category**:
- **Backup Recovery**: 4 tests (quarterly)
- **Disaster Recovery**: 2 tabletop exercises (Q1, Q3)
- **Monitoring & Alerting**: 4 exercises (2 alert tests + 2 log reviews)
- **Training & Awareness**: 4 tests (2 phishing + 2 quizzes)

**Total Time Commitment**: ~35-40 hours for the year (vs 90-100 hours in full plan)

**Key Characteristics**:
- ✅ **Low Risk**: No production systems affected
- ✅ **Demonstrable**: Clear, auditable results
- ✅ **Manageable**: ~3 activities per quarter
- ✅ **Cost Effective**: No external vendors required
- ✅ **ISO 27001 Compliant**: Meets minimum requirements

---

## Why These Categories?

### 1. Backup & Recovery Testing ✅
- **ISO Requirement**: A.12.3.1 (Information backup)
- **Why Include**: Critical for business continuity, auditors always check
- **Risk Level**: LOW - restore to test environment only
- **Demonstrable**: Clear pass/fail, time measurements

### 2. Disaster Recovery (Tabletop Only) ✅
- **ISO Requirement**: A.17.1.3 (Verify, review and evaluate)
- **Why Include**: Required for ISO 27001, but tabletop = zero risk
- **Risk Level**: ZERO - no actual systems involved, just discussion
- **Demonstrable**: Meeting minutes, documented scenarios, action items

### 5. Monitoring & Alerting Testing ✅
- **ISO Requirement**: A.12.4.1 (Event logging), A.16.1.2 (Incident detection)
- **Why Include**: Proves security monitoring works
- **Risk Level**: LOW - trigger test alerts in non-prod only
- **Demonstrable**: Alert logs, notification receipts, response times

### 7. Training & Awareness Testing ✅
- **ISO Requirement**: A.7.2.2 (Information security awareness)
- **Why Include**: Easy to implement, low cost, high value
- **Risk Level**: ZERO - just emails and quizzes
- **Demonstrable**: Click rates, quiz scores, training records

---

## What We Removed (Lower Priority / Higher Risk)

### 3. Incident Response Testing ❌
- **Reason**: Can be complex to simulate safely
- **Alternative**: Covered by DR tabletop scenarios
- **Can add later**: Year 2 if needed

### 4. Security Controls Testing ❌
- **Reason**: Partially covered by normal operations
- **Alternative**: Access reviews = normal quarterly task, not "exercise"
- **Note**: Pen testing is expensive, can do Year 2

### 6. Business Continuity Testing ❌
- **Reason**: Overlaps with DR tabletop
- **Alternative**: DR tabletop can include BC scenarios
- **Can add later**: Year 2 if needed

### 8. Compliance Testing ❌
- **Reason**: Internal audit not required in first year
- **Alternative**: External audit will happen anyway
- **Timeline**: Add in Year 2 before recertification

---

## Quarterly Calendar View

### Q1 2026 (Jan-Mar)
- ✅ **January**: VM Backup Restore Test
- ✅ **February**: DR Tabletop Exercise, Phishing Simulation
- ✅ **March**: Log Review Exercise

### Q2 2026 (Apr-Jun)
- ✅ **April**: Database Restore Test
- ✅ **May**: Security Awareness Quiz
- ✅ **June**: Alert Functionality Test

### Q3 2026 (Jul-Sep)
- ✅ **July**: VM Backup Restore Test
- ✅ **August**: DR Tabletop Exercise, Phishing Simulation
- ✅ **September**: Log Review Exercise

### Q4 2026 (Oct-Dec)
- ✅ **October**: Database Restore Test
- ✅ **November**: Security Awareness Quiz
- ✅ **December**: Alert Functionality Test

**Average**: 3-4 activities per quarter, evenly distributed

---

## Detailed Procedures (Low-Risk)

### Backup Restore Test (Quarterly)

**Step-by-Step**:
1. **Select** a VM or database for testing (rotate each time)
2. **Restore** to TEST environment ONLY (never touch production)
3. **Verify** data integrity and application functionality
4. **Measure** time taken (for RTO documentation)
5. **Document** results in Jira ticket
6. **Clean up** test resources after validation
7. **Update** runbook if issues found

**Success Criteria**:
- Restore completes within 4 hours
- Data verified as complete and uncorrupted
- No impact to production systems

---

### DR Tabletop Exercise (Semi-annual)

**Step-by-Step**:
1. **Prepare** scenario document (e.g., "Azure SEA region is down")
2. **Schedule** 2-hour meeting with CTO, Gna, Farhan, engineers
3. **Walk through** what team would do step-by-step
4. **Identify** gaps in procedures or documentation
5. **Document** discussion and action items
6. **Update** DR plan based on findings
7. **No systems are touched** - purely discussion

**Success Criteria**:
- Meeting held with key personnel
- Scenario documented
- Action items identified and assigned
- DR plan updated within 2 weeks

---

### Alert Functionality Test (Semi-annual)

**Step-by-Step**:
1. **Use TEST environment** or non-production system
2. **Trigger** test alert (e.g., high CPU on test VM)
3. **Verify** alert received by Gna, SS, Farhan
4. **Check** alert content is useful and actionable
5. **Test** escalation if no one acknowledges
6. **Document** who received alert and when
7. **No production impact**

**Success Criteria**:
- Alert delivered within 5 minutes
- Correct recipients notified
- Alert information actionable
- No production systems affected

---

### Log Review Exercise (Semi-annual)

**Step-by-Step**:
1. **Select** time period (e.g., past week)
2. **Review** logs in Cloud Vista and Azure
3. **Look for** anomalies, failed logins, errors, unusual patterns
4. **Document** any findings
5. **Update** alert rules if needed
6. **Practice** using log search tools
7. **No changes** to production, just observation

**Success Criteria**:
- Logs reviewed by Farhan + engineer
- Any anomalies investigated
- Documentation completed
- Team familiar with log tools

---

### Phishing Simulation (Quarterly)

**Step-by-Step**:
1. **Create** simple phishing email (or use free tool)
2. **Send** to all employees
3. **Track** who clicks the link
4. **Provide** immediate brief training to those who clicked
5. **Document** click rate and training provided
6. **No system changes** - just email and training

**Success Criteria**:
- Email sent to all 15 employees
- Click rate documented
- Training provided to clickers within 1 week
- Results show improvement over time

---

### Security Awareness Quiz (Semi-annual)

**Step-by-Step**:
1. **Create** 10-question quiz (Google Forms or similar)
2. **Topics**: Passwords, data handling, incident reporting, phishing
3. **Send** to all employees
4. **Track** completion and scores
5. **Provide** additional training for low scorers
6. **Document** results
7. **No risk** - just questions

**Success Criteria**:
- 100% completion rate
- Average score >80%
- Low scorers get follow-up training
- Documentation complete

---

## Post-Exercise Documentation

After EACH exercise, create a Jira ticket with:

**Required Information**:
1. ✅ Date and time conducted
2. ✅ Participants (names)
3. ✅ Actual duration
4. ✅ Objectives achieved (Yes/No)
5. ✅ Results summary (2-3 sentences)
6. ✅ Issues found (if any)
7. ✅ Action items (owner + due date)
8. ✅ Procedure updates needed (Yes/No)

**Jira Label**: `ISMS-Exercise`

**Storage**: Attach to Jira ticket + summary in this document

---

## Risk Mitigation

**To ensure LOW RISK**:
- ✅ **Never test in production** - always use test environments
- ✅ **Schedule during business hours** - team available if issues
- ✅ **Notify team in advance** - no surprises
- ✅ **Have rollback plan** - know how to undo if needed
- ✅ **Get approval** - CTO approval for any backup restore tests
- ✅ **Document everything** - evidence for auditors

**If something goes wrong**:
1. Stop the test immediately
2. Document what happened
3. Notify CTO (SS) and Gna
4. Investigate root cause
5. Update procedures
6. Reschedule test after fixes

---

## Budget Required

**Estimated Costs**: **$0 - $500/year**

- Backup restore tests: $0 (Azure resources we already pay for)
- DR tabletop: $0 (just meeting time)
- Alert testing: $0 (existing monitoring tools)
- Log reviews: $0 (existing logs)
- Phishing simulation: $0-200 (free tools available, or manual)
- Security quiz: $0 (Google Forms free)

**Optional Enhancements** (Year 2+):
- Phishing simulation service: ~$500-1000/year (KnowBe4, etc.)
- Penetration testing: ~$5,000-10,000 (when ready)

---

## Approval

**Prepared By**: ______Farhan______ (Technical Team) Date: ___________

**Reviewed By**: ______Gna_______ (R&D Director) Date: ___________

**Approved By**: ______SS/Soon Seah______ (CTO) Date: ___________

---

## Version History

| Version | Date | Changes | Approved By |
|---------|------|---------|-------------|
| 1.0 | 2025-10-15 | Initial simplified plan (4 categories, 14 exercises) | Pending |

---

## Next Review

This plan will be reviewed:
- **Quarterly**: Check if schedule is being followed
- **After each exercise**: Lessons learned
- **Annually**: Full plan review (October 2026)
- **After audit**: Incorporate auditor feedback

**Next Scheduled Review**: January 2026 (Q1 check-in)

---
