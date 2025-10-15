# Access Control & User Management

**Last Updated:** 2025-10-15

---

## Azure AD (Microsoft Entra ID)

**Tenant ID**: a1264c1d-cea3-44c4-b322-4bb6ddaba9c8

### User Summary
- **Total Accounts**: 46
- **Internal Users** (@netgain-systems.com): ~29
- **External/Guest Users** (#EXT#): 17
- **Service Accounts**: 4

---

## Internal Users (@netgain-systems.com)

### Key Personnel
- admin@netgainsys.onmicrosoft.com
- soonseah@netgain-systems.com (Azure Owner)
- gna@netgain-systems.com (Azure Contributor)
- farhan@netgain-systems.com (Azure Contributor)

### Team Members
- aiden@netgain-systems.com (Aiden Lee)
- albert@netgain-systems.com (Albert Wei)
- alvin@netgain-systems.com (Alvin Lam)
- bryan@netgain-systems.com (Bryan Corporal)
- denver@netgain-systems.com (Denver Del Castillo)
- edwin@netgain-systems.com (Edwin Thorman)
- farhan@netgain-systems.com (Farhan Hoesny)
- FarhanNetGainSystems@netgain-systems.com (Farhan - NetGain Systems)
- fifi@netgain-systems.com (Fifi)
- garvan@netgain-systems.com (Garvan Long)
- gna@netgain-systems.com (Gna Jayamani Gnanachelvi)
- hazlie@netgain-systems.com (Hazlie)
- hueymiin@netgain-systems.com (Huey Miin Leong, +61421985345)
- isabelle@netgain-systems.com (Isabelle Pan)
- jacelynn@netgain-systems.com (Jacelynn)
- james@netgain-systems.com (James Chia)
- jeffrey@netgain-systems.com (Jeffrey Lim)
- jootian@netgain-systems.com (Joo Tian Tan)
- paiboon@netgain-systems.com (Paiboon Norasetthekul)
- ranjith@netgain-systems.com (Ranjith R)
- xinzheng@netgain-systems.com (Cindy Wang)
- xoveign@netgain-systems.com (Xoveign Chan - Intern, mobile: 94833796)

### Service Accounts
- no-reply@netgain-systems.com
- support@netgain-systems.com
- servicedesk@netgain-systems.com
- NetGainSSbooking@netgain-systems.com
- d5134831-64f6-4c01-941a-808e4a0ad296@netgainsys.onmicrosoft.com (no-reply spog.ai)

---

## External/Guest Users (#EXT#)

### Contractors (d-connect.net) - 4 users
1. carla.beloy@d-connect.net (Carla Catrina Beloy)
2. khentjohn.pague@d-connect.net (Kent John Pague)
3. ryan.j@d-connect.net (Ryan Jimenez)
4. uxville.unabia@d-connect.net

**Purpose**: Likely offshore development/support contractors

---

### Partners (atos.net) - 3 users
1. kumaraveel.ganeson@atos.net (Kumaraveel Ganeson)
2. panir-selvam.kuppusamy@atos.net (Panir Selvam Kuppusamy)
3. puneet.kumar@atos.net

**Purpose**: Partner organization access

---

### Customer (m1.com.sg) - 2 users
1. hokc@m1.com.sg (Ho Kok Cheong)
2. ongwf@m1.com.sg (Ong Wei Fah)

**Purpose**: M1 customer access (likely for m1-emedge1 VM)

---

### China Office (netgain-systems.com.cn) - 3 users
1. dongshen@netgain-systems.com.cn
2. jingwei@netgain-systems.com.cn
3. xinzheng@netgain-systems.com.cn

**Purpose**: China office team members

---

### Other External Users - 5 users
1. betriz001@e.ntu.edu.sg (#BETRIZ TRIA ANANDA# - likely intern from NTU)
2. bryancorporal231426@gmail.com (bryancorporal231426)
3. gary@grayforceconsulting.com (Gary Sng - consultant)
4. weejianyang@gmail.com (weejianyang)
5. xaviertanjiaxuan12@gmail.com (xaviertanjiaxuan12)

---

## Azure RBAC Roles

### Subscription Level

**Owner (Full Control)**
- soonseah@netgain-systems.com
  - Subscription: /subscriptions/9dd85c82-2a04-45f0-891a-959d1fab5cd4
  - Has Owner role on all resource groups

**Contributor**
- gna@netgain-systems.com
  - Subscription: /subscriptions/9dd85c82-2a04-45f0-891a-959d1fab5cd4

- farhan@netgain-systems.com
  - Subscription: /subscriptions/9dd85c82-2a04-45f0-891a-959d1fab5cd4

---

### Resource-Level Roles

**soonseah@netgain-systems.com has Owner role on:**
- AKS clusters (aks, aksau)
- Container Registry (netgain)
- VMs (m1-emedge1)
- All resource groups (core_sea, core_au, MC groups, etc.)
- Backup Vaults (main-vault, main-vault-au)
- Network resources (vnets, NSGs, public IPs, load balancers)
- Storage accounts

**soonseah@netgain-systems.com specific roles:**
- Network Contributor: /subscriptions/.../resourceGroups/core_sea
- Virtual Machine Administrator Login: m1-emedge1
- Contributor: aks cluster

**gna@netgain-systems.com specific roles:**
- Azure Kubernetes Service Cluster User Role: core_sea
- AcrPush: netgain (Container Registry)

---

## Service Principals

**Note**: Current service principal used for CLI has limited permissions and cannot list all service principals.

**Service Principal in Use**:
- ID: e0173625-e11f-4120-bef3-b9e0b42c672f
- Type: servicePrincipal
- Used for: Azure CLI authentication

**Action Required**: Need account with higher privileges to audit all service principals and their permissions.

---

## SSH Key Management

**SSH Public Keys in Azure:**
1. oraclexe_key (core_sea, Southeast Asia)
2. m1-emedge1_key (core_sea, Southeast Asia)
3. albert-ssh (core_sea, Southeast Asia)
4. ubuntu-test1_key (core_sea, Southeast Asia)

**Status**: ❓ Need to document:
- Who has access to private keys
- Key rotation policy
- Where keys are stored
- Approved key usage procedures

---

## MFA & Authentication

### Current Status
- ✅ MFA enabled
- ✅ Password policies in place
- ✅ GitHub 2FA enabled
- ✅ Azure AD authentication for VMs (AADSSHLoginForLinux extension)

### Questions Requiring Documentation
- [ ] Which users have MFA enforced vs optional?
- [ ] Are there Conditional Access policies?
- [ ] What's the MFA enforcement policy for admins vs regular users?
- [ ] Is MFA required for Azure portal access?
- [ ] Is MFA required for GitHub access?

---

## SSO Configuration

**Status**: ❓ Need to document which services use Azure AD SSO:
- Office365 (likely integrated)
- GitHub (need to verify)
- Trello (need to verify)
- Other SaaS tools

---

## Access Review Requirements (ISO 27001)

### High Priority Actions

1. **External User Review** (17 users)
   - [ ] Verify d-connect.net contractors still need access (4 users)
   - [ ] Verify atos.net partners still need access (3 users)
   - [ ] Review M1 customer access requirements (2 users)
   - [ ] Verify China office users are current employees (3 users)
   - [ ] Review other external users (5 users - interns, consultants)
   - [ ] Document approval process for guest users
   - [ ] Set up quarterly access review

2. **Admin Access Review**
   - [ ] Document why soonseah has Owner (acceptable as CTO/technical lead)
   - [ ] Document why gna and farhan have Contributor
   - [ ] Review need for Network Contributor and VM Admin Login roles
   - [ ] Implement principle of least privilege

3. **Service Account Review**
   - [ ] Document purpose of each service account
   - [ ] Review where service account credentials are stored
   - [ ] Implement service account password rotation

---

## User Lifecycle Management

### Onboarding Process
**Status**: ❓ Need to document:
- [ ] How new employee accounts are created
- [ ] Who approves new accounts
- [ ] What baseline access is granted
- [ ] How role-specific access is requested/approved
- [ ] Training requirements (security awareness)

### Offboarding Process
**Status**: ❓ Need to document:
- [ ] Account deactivation procedure
- [ ] Timeline for deactivation (immediate? same day?)
- [ ] Azure access removal checklist
- [ ] GitHub access removal
- [ ] SaaS tool access removal (Office365, Trello, etc.)
- [ ] SSH key revocation
- [ ] Recovery of hardware/credentials

### Access Change Process
**Status**: ❓ Need to document:
- [ ] How users request additional access
- [ ] Who approves access changes
- [ ] How access changes are tracked
- [ ] Regular access recertification schedule

---

## GitHub Access Control

**Organization**: NetGain Systems GitHub organization (need to verify org name)
**2FA Status**: ✅ Enabled

**Status**: ❓ Need to document:
- [ ] Who has admin access to GitHub org
- [ ] Repository access levels
- [ ] Branch protection rules
- [ ] Code review requirements
- [ ] Whether Azure AD SSO is configured
- [ ] GitHub user list and their roles

---

## Action Items

### Immediate Priority
- [ ] Conduct access review of 17 external/guest users
- [ ] Document user onboarding/offboarding procedures
- [ ] Obtain permissions to list service principals
- [ ] Verify MFA enforcement per user

### High Priority
- [ ] Set up quarterly access review process
- [ ] Document SSH key management procedures
- [ ] Review and document GitHub access control
- [ ] Document approval workflows for access requests

### Medium Priority
- [ ] Verify SSO configuration for all SaaS tools
- [ ] Document Conditional Access policies (if any)
- [ ] Create access control matrix (role vs permissions)
- [ ] Implement access request ticketing system

---
