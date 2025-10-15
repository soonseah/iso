# Development & Deployment Process

**Last Updated:** 2025-10-15

---

## Source Code Management

### Repository
- **Platform**: GitHub
- **Organization**: NetGain Systems
- **2FA**: ✅ Enabled

### Key Personnel with Access
- **R&D Director**: Gna (gna@netgain-systems.com)
- **CTO**: Soon Seah (soonseah@netgain-systems.com)
- Additional team members (to be documented)

---

## Git Workflow

### Standard Development Flow

```
1. Code Development
   ↓
2. Commit (to feature/dev branch)
   ↓
3. Push to GitHub
   ↓
4. Create Pull Request (PR)
   ↓
5. Code Review
   ↓
6. PR Approval (by Gna or SS)
   ↓
7. Merge PR
   ↓
8. CI/CD Build (Jenkins)
   ↓
9. Selective Deployment
```

### Branch Protection
**Status**: ❓ Need to document:
- [ ] Main/master branch protection rules
- [ ] Required reviewers count
- [ ] Automated checks before merge
- [ ] Who can merge to main

### Code Review Requirements
- **Required**: Yes
- **Reviewers**: Gna (R&D Director) and/or SS (CTO)
- **Status**: ❓ Need to document:
  - [ ] Minimum number of approvals required
  - [ ] Whether self-approval is allowed
  - [ ] Code review checklist/standards

---

## CI/CD Pipeline

### Tools Used
- **Jenkins**: Build and CI/CD orchestration
- **Kubernetes**: Deployment target (Azure AKS)

### Build Process
1. Code merged to main/master branch
2. Jenkins triggered (webhook or scheduled)
3. Build process:
   - Compile code
   - Run tests (❓ need to document what tests)
   - Build Docker images
   - Push to Azure Container Registry (netgain)
4. Selective deployment to environments

### Jenkins Configuration
**Status**: ❓ Need to document:
- [ ] Jenkins server location (Azure VM? AKS?)
- [ ] Jenkins admin access (who has it?)
- [ ] Jenkins job configurations
- [ ] Build pipeline steps
- [ ] Security scanning in pipeline (SAST, dependency check)
- [ ] Test automation in pipeline

---

## Deployment Process

### Deployment Types

#### 1. Cloud Deployment (Azure AKS)
- **Target**: Azure Kubernetes clusters (aks, aksau)
- **Method**: Manual deployment
- **Process**:
  1. Jenkins builds Docker image
  2. Image pushed to Azure Container Registry (netgain)
  3. Engineer manually deploys to K8s using kubectl/helm
  4. Verify deployment health

**Status**: ❓ Need to document:
- [ ] kubectl/helm commands used
- [ ] Deployment manifests/charts location
- [ ] Environment-specific configurations
- [ ] Deployment checklist

#### 2. On-Premise Customer Installations
- **Method**: Manual installation at customer site
- **Process**:
  1. Engineer takes software package
  2. Deploys at customer site
  3. Customer-specific configuration
  4. Validation and handover

**Status**: ❓ Need to document:
- [ ] Deployment packages format
- [ ] Installation documentation
- [ ] Customer deployment checklist
- [ ] Support handover process

### Deployment Approval
- **Who can deploy to production**: Engineers with appropriate access (need to document specific names)
- **Approval required**: Likely from Gna or SS (need to confirm)
- **Change management**: ❓ Need to document approval workflow

---

## Environments

### Identified Environments

Based on Azure infrastructure:

1. **Production (Southeast Asia)**
   - AKS cluster: aks
   - 11 nodes
   - Customer-facing services

2. **Production (Australia)**
   - AKS cluster: aksau
   - 3 nodes
   - Customer-facing services (AU region)

3. **Testing/HA Testing**
   - Resource Group: rg-emedge-HA-test
   - VMs: emedge-vm1, emedge-vm2
   - Purpose: High availability testing

4. **Development**
   - Resource Group: rg-soonseah-0555_ai
   - Contains Key Vault
   - Development/testing work

**Status**: ❓ Need to verify:
- [ ] AKS namespaces used (prod, staging, dev in same cluster?)
- [ ] Environment isolation strategy
- [ ] How staging/QA testing is done
- [ ] Data separation between environments

---

## Quality Assurance

### Testing
**Status**: ❓ Need to document:
- [ ] Unit testing (automated?)
- [ ] Integration testing
- [ ] Security testing (SAST, DAST, dependency scanning)
- [ ] Performance testing
- [ ] User acceptance testing (UAT)

### Test Environments
**Status**: ❓ Need to document:
- [ ] Where tests are run (Jenkins, AKS, local?)
- [ ] Test data management
- [ ] How production data is anonymized for testing

---

## Rollback Procedures

**Status**: ❓ Need to document:
- [ ] How to rollback a failed deployment
- [ ] Container image versioning strategy
- [ ] K8s rollback commands
- [ ] Database rollback strategy
- [ ] Rollback decision maker (who authorizes?)

---

## Change Management

### Change Types
**Status**: ❓ Need to document:
- [ ] Standard changes (low risk, pre-approved)
- [ ] Normal changes (require approval)
- [ ] Emergency changes (expedited process)

### Change Approval Process
**Status**: ❓ Need to document:
- [ ] Who approves production changes
- [ ] Change request documentation
- [ ] Communication of changes
- [ ] Post-deployment verification

### Release Management
**Status**: ❓ Need to document:
- [ ] Release schedule (weekly, bi-weekly, monthly?)
- [ ] Release notes process
- [ ] Version numbering scheme
- [ ] Release communication to customers

---

## Configuration Management

### Container Images
- **Registry**: Azure Container Registry (netgain)
- **Access**:
  - soonseah@netgain-systems.com: Owner
  - gna@netgain-systems.com: AcrPush

**Status**: ❓ Need to document:
- [ ] Image tagging strategy
- [ ] Image scanning for vulnerabilities
- [ ] Image retention policy
- [ ] Base image updates process

### Kubernetes Configurations
**Status**: ❓ Need to document:
- [ ] ConfigMaps usage
- [ ] Secrets management in K8s
- [ ] Helm charts (if used)
- [ ] Infrastructure as Code (IaC) tools used

### Application Configuration
**Status**: ❓ Need to document:
- [ ] Environment variables
- [ ] Configuration files location
- [ ] Configuration change process
- [ ] Configuration backup

---

## Security in Development

### Code Security
**Status**: ❓ Need to document:
- [ ] Dependency scanning (Dependabot, Snyk?)
- [ ] Static code analysis (SonarQube?)
- [ ] Secret scanning in code
- [ ] Security code review checklist

### Secrets Management
- **Dev Environment**: Key Vault (kv-defaulth969906751183)
- **Production**: ❓ To be confirmed (Key Vault vs K8s secrets vs env vars)

**Status**: ❓ Need to document:
- [ ] How developers access dev secrets
- [ ] How production secrets are deployed
- [ ] Secrets rotation policy
- [ ] Who has access to production secrets

### Access Control
**Status**: ❓ Need to document:
- [ ] Who can access Jenkins
- [ ] Who can access production K8s clusters
- [ ] Who can push to production container registry
- [ ] Service account management

---

## Deployment Credentials

### Kubernetes Access
- **Owner**: soonseah@netgain-systems.com (AKS Owner/Contributor)
- **Users**: gna@netgain-systems.com (AKS Cluster User)
- **Others**: ❓ Need to document who else has kubectl access

### Jenkins Access
**Status**: ❓ Need to document:
- [ ] Jenkins admin users
- [ ] Jenkins service accounts
- [ ] Jenkins credentials management
- [ ] Jenkins security configuration

---

## Customer Deployment

### On-Premise Installation Process
1. Software package preparation
2. Engineer travels to customer site (or remote deployment)
3. Installation at customer location
4. Customer-specific configuration
5. Testing and validation
6. Training and handover

**Status**: ❓ Need to document:
- [ ] Installation documentation
- [ ] Pre-installation checklist
- [ ] Customer system requirements
- [ ] Post-installation support process
- [ ] Customer deployment tracking

### Customer Support
**Status**: ❓ Need to document:
- [ ] Support SLA
- [ ] Escalation process
- [ ] Remote access to customer systems (how is it secured?)
- [ ] Customer data access policies

---

## Action Items

### Immediate Priority
- [ ] Document who can deploy to production
- [ ] Document branch protection rules in GitHub
- [ ] Document Jenkins location and access
- [ ] Document K8s deployment commands/procedures

### High Priority
- [ ] Document rollback procedures
- [ ] Document change approval process
- [ ] Document secrets management for production
- [ ] Implement security scanning in CI/CD pipeline
- [ ] Document environment separation strategy

### Medium Priority
- [ ] Document testing strategy and automation
- [ ] Document release management process
- [ ] Document container image scanning
- [ ] Create deployment runbooks
- [ ] Document customer deployment procedures

---

## ISO 27001 Requirements Met

### Currently Satisfied
- ✅ Code review process (A.14.2.8)
- ✅ Version control (A.14.2.2)
- ✅ Segregation of duties (Gna/SS approval)

### Requires Documentation
- ❓ Change management process (A.14.2.2)
- ❓ Test data protection (A.14.2.9)
- ❓ Deployment authorization (A.14.2.8)
- ❓ Rollback procedures (A.14.2.9)

### Requires Implementation/Verification
- ❓ Security testing in pipeline (A.14.2.8)
- ❓ Environment separation (A.14.2.1)
- ❓ Secrets management (A.9.4.1)

---
