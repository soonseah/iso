# Team Structure & Key Personnel

**Last Updated:** 2025-10-15

---

## Leadership Team

### Executive Leadership

**James** - CEO (Chief Executive Officer)
- Email: james@netgain-systems.com
- Role: Overall business leadership and strategy

**Soon Seah (SS)** - CTO (Chief Technology Officer)
- Email: soonseah@netgain-systems.com
- Role: Technology strategy, architecture decisions
- **ISMS Responsibilities**:
  - Overall ISMS ownership
  - Final approval for major changes
  - Incident escalation point
  - DR plan ownership
  - Azure subscription Owner (full admin access)
  - ISO 27001 Management Representative (likely)

---

## Technical Leadership

**Gna** - R&D Director (Research & Development Director)
- Email: gna@netgain-systems.com
- Role: Product development, engineering team leadership
- **ISMS Responsibilities**:
  - Technical test coordination
  - Code review approvals
  - Security incident response
  - DR plan co-owner
  - Azure Contributor access
  - AKS Cluster User + Container Registry push access
  - Incident response team lead

---

## Technical Team

**Farhan** - Engineer
- Email: farhan@netgain-systems.com
- Role: Infrastructure, security, DevOps
- **ISMS Responsibilities**:
  - Azure Defender setup (assigned)
  - Security tools configuration
  - Access control reviews
  - Monitoring and alerting
  - Vulnerability management
  - Azure Contributor access
  - Security incident technical response
  - Backup and recovery implementation

---

## Sales & Operations

**Hazlie** - Sales
- Email: hazlie@netgain-systems.com
- Role: Sales and customer relationships

**Fifi** - Sales Operations / Admin
- Email: fifi@netgain-systems.com
- Role: Sales operations, administrative support

---

## Full Team List (from Azure AD Audit)

### Internal Employees (@netgain-systems.com)

**Leadership & Management:**
1. James Chia (james@netgain-systems.com) - CEO
2. Soon Seah (soonseah@netgain-systems.com) - CTO
3. Gna Jayamani Gnanachelvi (gna@netgain-systems.com) - R&D Director

**Engineering & Technical:**
4. Farhan Hoesny (farhan@netgain-systems.com) - Engineer
5. Albert Wei (albert@netgain-systems.com)
6. Alvin Lam (alvin@netgain-systems.com)
7. Bryan Corporal (bryan@netgain-systems.com)
8. Denver Del Castillo (denver@netgain-systems.com)
9. Edwin Thorman (edwin@netgain-systems.com)
10. Garvan Long (garvan@netgain-systems.com)
11. Jeffrey Lim (jeffrey@netgain-systems.com)
12. Joo Tian Tan (jootian@netgain-systems.com)
13. Paiboon Norasetthekul (paiboon@netgain-systems.com)
14. Ranjith R (ranjith@netgain-systems.com)

**Sales & Operations:**
15. Hazlie (hazlie@netgain-systems.com) - Sales
16. Fifi (fifi@netgain-systems.com) - Sales Ops/Admin
17. Isabelle Pan (isabelle@netgain-systems.com)
18. Jacelynn (jacelynn@netgain-systems.com)

**Other:**
19. Aiden Lee (aiden@netgain-systems.com)
20. Huey Miin Leong (hueymiin@netgain-systems.com) - +61421985345
21. Cindy Wang / Xinzheng (xinzheng@netgain-systems.com)
22. Xoveign Chan (xoveign@netgain-systems.com) - Intern, mobile: 94833796

**Service Accounts:**
- admin@netgainsys.onmicrosoft.com
- no-reply@netgain-systems.com
- support@netgain-systems.com
- servicedesk@netgain-systems.com
- NetGainSSbooking@netgain-systems.com
- no-reply spog.ai

**Total Internal Users**: ~29

---

## External/Guest Users (17 total)

### Contractors (d-connect.net) - 4 users
1. Carla Catrina Beloy (carla.beloy@d-connect.net)
2. Kent John Pague (khentjohn.pague@d-connect.net)
3. Ryan Jimenez (ryan.j@d-connect.net)
4. Uxville Unabia (uxville.unabia@d-connect.net)

### Partners (atos.net) - 3 users
1. Kumaraveel Ganeson (kumaraveel.ganeson@atos.net)
2. Panir Selvam Kuppusamy (panir-selvam.kuppusamy@atos.net)
3. Puneet Kumar (puneet.kumar@atos.net)

### Customers (m1.com.sg) - 2 users
1. Ho Kok Cheong (hokc@m1.com.sg)
2. Ong Wei Fah (ongwf@m1.com.sg)

### China Office (netgain-systems.com.cn) - 3 users
1. dongshen@netgain-systems.com.cn
2. jingwei@netgain-systems.com.cn
3. xinzheng@netgain-systems.com.cn

### Others - 5 users
1. Betriz Tria Ananda (betriz001@e.ntu.edu.sg) - NTU intern
2. bryancorporal231426@gmail.com
3. Gary Sng (gary@grayforceconsulting.com) - Consultant
4. weejianyang@gmail.com
5. xaviertanjiaxuan12@gmail.com

---

## ISMS Roles & Responsibilities Matrix

| Role | Person | Responsibilities |
|------|--------|-----------------|
| **ISMS Owner** | SS (CTO) | Overall ISMS, final approvals, management representative |
| **Technical Lead** | Gna (R&D Director) | Technical coordination, code reviews, DR co-owner |
| **Security Lead** | Farhan | Azure Defender, vulnerability mgmt, access reviews, security tools |
| **Incident Commander** | Gna or SS | Lead incident response (depends on incident type) |
| **Backup Owner** | Farhan | Backup configuration, restore testing |
| **Access Control Admin** | Farhan | Azure AD, RBAC reviews, quarterly access reviews |
| **Development Team** | All Engineers | Code security, dependency updates, secure coding |
| **Infrastructure** | Farhan + Engineers | Azure resources, AKS, monitoring |
| **Compliance Coordinator** | SS (CTO) | Audit coordination, documentation review |

---

## Escalation Chain

### Security Incidents
1. **Detect** → Alert/Report to Farhan, Gna, or SS
2. **Initial Response** → Farhan (technical), Gna (coordination)
3. **Escalation** → SS (CTO) for major incidents
4. **Communication** → SS to customers (if needed)

### Infrastructure Issues
1. **Detect** → Cloud Vista alerts to Gna, SS, Farhan
2. **Response** → Responsible engineer or Farhan
3. **Escalation** → Gna or SS

### Business Decisions
1. **Technical decisions** → Gna approval
2. **Strategic/customer impact** → SS approval
3. **Business/financial** → James (CEO)

---

## Contact Information (for ISMS)

### Emergency Contacts
- **Primary**: SS (CTO) - soonseah@netgain-systems.com
- **Secondary**: Gna (R&D Director) - gna@netgain-systems.com
- **Technical**: Farhan - farhan@netgain-systems.com

### After-Hours / On-Call
- **Status**: ❓ Need to document on-call rotation (if any)
- **Method**: ❓ Phone numbers for emergency contact?

---

## Training & Awareness

### Security Training Status
**Status**: ❓ Need to document:
- [ ] Who has completed ISO 27001 awareness training
- [ ] Who has completed security awareness training
- [ ] Technical security training for engineers
- [ ] Incident response training participants
- [ ] Last training date for each team member

### Role-Specific Training Needed
- **SS, Gna**: ISMS management, audit preparation
- **Farhan**: Security tools, vulnerability management, Azure security
- **All Engineers**: Secure coding, OWASP Top 10, GitHub security features
- **All Staff**: Security awareness, phishing recognition, data handling
- **Sales (Hazlie, Fifi)**: Customer data protection, confidentiality

---

## Succession Planning

### Key Person Risk

**Critical Roles**:
1. **CTO (SS)**: Azure Owner access, final decision maker
   - **Backup**: Gna (has Contributor access)
   - **Risk**: High - need to document critical knowledge

2. **R&D Director (Gna)**: Technical leadership, product knowledge
   - **Backup**: Senior engineers (need to document)
   - **Risk**: High - deep product knowledge

3. **Farhan**: Infrastructure and security knowledge
   - **Backup**: Need to identify and train
   - **Risk**: High - single point of failure for security

**Mitigation**:
- [ ] Document critical procedures (runbooks)
- [ ] Cross-train team members
- [ ] Maintain up-to-date documentation
- [ ] Regular knowledge sharing sessions
- [ ] Test "key person unavailable" scenarios (in exercise plan)

---

## Access Summary by Role

| Person | Azure Access | GitHub Access | AKS Access | Security Role |
|--------|-------------|---------------|------------|---------------|
| SS (CTO) | Owner (full) | Admin (assumed) | Full | ISMS Owner |
| Gna | Contributor | Admin (assumed) | Cluster User + AcrPush | Technical Lead |
| Farhan | Contributor | Write (assumed) | Yes | Security Lead |
| Engineers | ❓ | Write | ❓ | Developers |
| Sales/Admin | None (assumed) | None | None | End users |

**Note**: GitHub access needs to be documented - see development-deployment.md

---

## Action Items

- [ ] Verify team member count (currently shows ~29 internal, but said 15 employees)
- [ ] Document GitHub organization access levels
- [ ] Document AKS/kubectl access for all engineers
- [ ] Collect emergency phone numbers for key personnel
- [ ] Define on-call rotation (if applicable)
- [ ] Schedule security awareness training for all staff
- [ ] Identify backup personnel for critical roles
- [ ] Create knowledge transfer documentation

---
