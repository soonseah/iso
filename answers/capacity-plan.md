# Capacity Plan for Year 2026

**Document Owner**: CTO (Soon Seah)
**Prepared By**: Farhan (Infrastructure) + Gna (R&D Director)
**Last Updated**: 2025-10-15
**Planning Period**: January 2026 - December 2026
**Review Frequency**: Quarterly
**Next Review**: April 2026

---

## 1. Summary of Key Resources and Recommendations

The following table summarizes the current capacity usage for NetGain Systems' information processing facilities and recommendations to ensure that sufficient capacity is provided.

| Resource | Current Capacity | Current Usage | Usage % | Threshold Alert | Recommendation | Priority | Timeline |
|----------|------------------|---------------|---------|-----------------|----------------|----------|----------|
| **AKS Cluster (SEA) - Compute** | 11 nodes<br>40 vCPUs<br>204 GB RAM | ~24 vCPUs<br>~133 GB RAM | 60-65% | >80% | Monitor monthly<br>Add 2 nodes if approaching 80% | High | When needed |
| **AKS Cluster (AU) - Compute** | 3 nodes<br>6 vCPUs<br>42 GB RAM | ~2.4 vCPUs<br>~19 GB RAM | 40-45% | >80% | Monitor quarterly<br>Consider 1 node if >70% | Medium | When needed |
| **Elasticsearch Storage** | ~500 GB | ~350 GB | 70% | >85% | Monitor weekly<br>Implement data lifecycle policy<br>Expand when >80% | High | Ongoing |
| **Azure Storage (PVCs)** | ~2 TB | ~1.2 TB | 60% | >80% | Monitor quarterly<br>Add storage as needed per PVC | Medium | As needed |
| **Container Registry** | Unlimited | ~50 GB | Low | >500 GB | Implement image cleanup policy | Low | Q4 2026 |
| **Database (CRM)** | ~50 GB | ~30 GB | 60% | >85% | Monitor quarterly<br>Expand when needed | Medium | When needed |
| **Azure Bandwidth** | Pay-as-you-go | ~500 GB/month | N/A | Cost spike >30% | Monitor monthly costs | Low | Ongoing |
| **Log Analytics Workspace** | Pay-as-you-go | ~10 GB/month | Low | Cost spike | Monitor costs after enabling AKS monitoring | Medium | Q1 2026 |
| **GitHub Storage** | Unlimited | ~5 GB | Very low | N/A | No action needed | Low | N/A |
| **Office365 Storage** | 1 TB per user | ~200 GB total | 20% | >80% | No action needed | Low | N/A |

---

## 2. Infrastructure Details

### 2.1 AKS Cluster (Southeast Asia) - Primary Production

**Current Configuration**:
- **Cluster**: aks (Southeast Asia)
- **Kubernetes Version**: 1.26.12
- **Node Pools**:
  - cvsstorage2: 7 nodes × Standard_D4as_v4 (4 vCPU, 16 GB RAM each) = 28 vCPU, 112 GB RAM
  - services2: 2 nodes × Standard_DS11_v2 (2 vCPU, 14 GB RAM each) = 4 vCPU, 28 GB RAM
  - cvsdefault3: 2 nodes × Standard_E4ads_v5 (4 vCPU, 32 GB RAM each) = 8 vCPU, 64 GB RAM
- **Total**: 11 nodes, 40 vCPUs, 204 GB RAM

**Current Usage** (estimated based on node count and typical usage):
- **CPU**: ~60% average (24 vCPUs used)
- **Memory**: ~65% average (133 GB used)
- **Peak Usage**: ~80% during high load

**Workloads**:
- Cloud Vista observability platform (main application)
- Elasticsearch cluster (monitoring data storage)
- CRM application
- Supporting microservices
- Nginx ingress controller
- Monitoring agents

**Growth Drivers**:
- New customer onboarding: +3-5 customers expected in 2026
- Increased data volume per customer: +20% year-over-year
- New features/microservices deployment

**Forecast**:
- **Q1 2026**: 62% CPU, 67% RAM
- **Q2 2026**: 66% CPU, 70% RAM
- **Q3 2026**: 72% CPU, 75% RAM (action needed)
- **Q4 2026**: 78% CPU, 80% RAM (with expansion)

**Recommendation**:
1. **Q3 2026**: Add 2 nodes to cvsstorage2 pool (9 nodes total, +8 vCPU, +32 GB RAM)
2. **Monitor**: Weekly during growth periods
3. **Alert**: Set up alert when CPU >75% or Memory >75% for 1 hour
4. **Cost**: ~$400-500/month for 2 additional nodes

**Risk if Not Expanded**:
- Performance degradation for customers
- Service timeouts and errors
- Inability to onboard new customers
- Potential SLA violations

---

### 2.2 AKS Cluster (Australia East) - Regional Production

**Current Configuration**:
- **Cluster**: aksau (Australia East)
- **Kubernetes Version**: 1.22.6 ⚠️ (NEEDS UPGRADE)
- **Node Pools**:
  - cvsdefault2: 1 node × Standard_DS11_v2 (2 vCPU, 14 GB RAM)
  - cvsstorage1: 2 nodes × Standard_DS11_v2 (2 vCPU, 14 GB RAM each) = 4 vCPU, 28 GB RAM
- **Total**: 3 nodes, 6 vCPUs, 42 GB RAM

**Current Usage**:
- **CPU**: ~40% (2.4 vCPUs used)
- **Memory**: ~45% (19 GB used)
- Lower usage due to fewer AU region customers

**Forecast**:
- Stable growth: +15% over year
- Q4 2026: ~46% CPU, ~52% RAM

**Recommendation**:
1. **URGENT (Q1 2026)**: Upgrade Kubernetes to 1.26.x (security risk)
2. **Monitor**: Quarterly review
3. **Q4 2026**: Consider adding 1 node if usage exceeds 70%
4. **Cost**: Minimal change (~$150/month if node added)

**Risk if Not Upgraded**:
- Security vulnerabilities
- Lack of support from Azure
- Compliance failure

---

### 2.3 Elasticsearch Storage

**Current Configuration**:
- **Platform**: Running in AKS on persistent volumes
- **Estimated Storage**: ~500 GB total across nodes
- **Current Usage**: ~350 GB (70%)
- **Data Types**: Metrics, logs, traces from Cloud Vista platform

**Growth Drivers**:
- New customers: Each customer adds ~20-30 GB/year
- Increased monitoring granularity: +10% data per customer
- Log volume increase: +30% year-over-year

**Forecast**:
- **Q1 2026**: 385 GB (77%)
- **Q2 2026**: 420 GB (84%) - **ACTION NEEDED**
- **Q3 2026**: 455 GB (61% of new 750 GB)
- **Q4 2026**: 490 GB (65% of new 750 GB)

**Recommendation**:
1. **Q2 2026**: Increase storage to 750 GB
2. **Implement**: Data lifecycle management
   - Delete data older than 1 year (current retention policy)
   - Archive cold data to cheaper storage (Azure Blob)
   - Implement index lifecycle policies (ILM)
3. **Monitor**: Weekly storage usage
4. **Alert**: When usage >85%
5. **Cost**: ~$100-150/month additional for storage

**Data Lifecycle Policy** (to implement):
- **Hot data** (0-30 days): Full performance SSD
- **Warm data** (31-180 days): Standard SSD
- **Cold data** (181-365 days): Compressed, slower queries OK
- **Archive** (>365 days): Azure Blob storage, queryable but slow

**Risk if Not Expanded**:
- Elasticsearch stops ingesting new data
- Data loss (old data deleted prematurely)
- Service outage
- Cannot monitor customer systems

---

### 2.4 Virtual Machines

**Current Configuration**:
- **m1-emedge1**: Standard_D2as_v4 (2 vCPU, 8 GB RAM, 100 GB disk)
- **ubuntu-test1**: Standard_B2ms (2 vCPU, 8 GB RAM, 30 GB disk)
- **emedge-vm1**: Standard_D2as_v4 (2 vCPU, 8 GB RAM)
- **emedge-vm2**: Standard_D2as_v4 (2 vCPU, 8 GB RAM)

**Current Usage**:
- m1-emedge1: 40% CPU, 60% RAM, 65% disk
- Others: Low usage (test/HA environment)

**Forecast**:
- Stable - VMs are for edge agents, not scaling with customers
- m1-emedge1 disk may reach 80% by Q4 2026

**Recommendation**:
1. **Monitor**: Monthly via Azure Monitor alerts
2. **Q3 2026**: If m1-emedge1 disk >75%, expand to 150 GB
3. **Cost**: Minimal (~$10-20/month for disk expansion)

**No Action Needed**: Capacity adequate for 2026

---

### 2.5 Azure Storage Accounts (PVCs)

**Current Configuration**:
- Multiple persistent volume claims in AKS
- Total estimated: ~2 TB across all PVCs
- Current usage: ~1.2 TB (60%)

**Types**:
- Database storage (Elasticsearch, CRM, MongoDB)
- Application data
- Logs and backups within K8s

**Forecast**:
- Growth: +25% (300 GB)
- Q4 2026: 1.5 TB (75%)

**Recommendation**:
1. **Monitor**: Quarterly PVC usage review
2. **Alert**: Individual PVC >80% triggers expansion
3. **Automate**: Use K8s storage classes with auto-expansion where possible
4. **Cost**: Pay-as-you-grow, ~$30-50/month for 300 GB

**Action**:
- Q1 2026: Document all PVCs and their purposes
- Q2 2026: Implement PVC monitoring dashboard
- Ongoing: Expand individual PVCs as needed

---

### 2.6 Azure Container Registry

**Current Configuration**:
- **Registry**: netgain (Standard tier)
- **Storage**: Unlimited (pay for what you use)
- **Current Usage**: ~50 GB (Docker images)

**Forecast**:
- Growth: +50 GB/year (new images, versions)
- Q4 2026: ~100 GB

**Recommendation**:
1. **Q4 2026**: Implement image retention policy
   - Keep last 10 versions per image
   - Delete untagged images >90 days old
   - Archive old versions to blob storage
2. **Monitor**: Quarterly review
3. **Cost**: Minimal, ~$20-30/month

**No Immediate Action Needed**

---

### 2.7 Network Bandwidth

**Current Configuration**:
- Azure bandwidth: Pay-as-you-go
- Current usage: ~500 GB/month outbound
- Ingress is free

**Growth Drivers**:
- Customer monitoring data: More customers = more data transfer
- API calls and integrations

**Forecast**:
- Growth: +20% (100 GB/month)
- Q4 2026: ~600 GB/month

**Recommendation**:
1. **Monitor**: Monthly cost review
2. **Optimize**: Enable compression on API responses
3. **Alert**: If bandwidth cost spikes >30% month-over-month
4. **Cost**: ~$50-60/month (at $0.087/GB after first 100 GB free)

**No Immediate Action Needed** - cost-effective

---

### 2.8 Log Analytics & Monitoring

**Current Configuration**:
- **Log Analytics Workspace**: Pay-per-GB ingestion
- **Current Usage**: ~10 GB/month (without AKS container logs)
- **Retention**: 30 days (default)

**Changes Coming**:
- **Q1 2026**: Enable AKS monitoring (OMS agent)
- Expected increase: +3-5 GB/month (30-50% increase)

**Forecast**:
- Q1 2026: 13 GB/month (after OMS enabled)
- Q4 2026: 15 GB/month

**Recommendation**:
1. **Q1 2026**: Monitor costs after enabling OMS agent
2. **Optimize**: Only log necessary data
3. **Consider**: Extended retention to 180 days for compliance (+cost)
4. **Cost**: ~$30-40/month at 15 GB/month

**Action**:
- Q1 2026: Enable OMS agent and monitor cost impact
- Q2 2026: Decide on extended retention based on ISO 27001 requirements

---

## 3. Capacity Management Process

### 3.1 Monitoring & Alerting

**Current Monitoring**:
- ✅ VM metrics via Azure Monitor
- ✅ Application metrics via Cloud Vista
- ⚠️ AKS node metrics (Prometheus, but OMS agent disabled)
- ❌ Storage capacity alerts (need to implement)

**Recommended Alerts** (to implement Q1 2026):
1. **AKS CPU** >75% for 1 hour → Alert Farhan, Gna
2. **AKS Memory** >75% for 1 hour → Alert Farhan, Gna
3. **Elasticsearch Storage** >85% → Alert Farhan, Gna (critical)
4. **PVC Storage** >80% → Alert Farhan
5. **VM Disk** >80% → Alert Farhan
6. **Monthly Cost** increase >30% → Alert SS, Gna
7. **AKS Node Count** change → Notify Farhan (for tracking)

---

### 3.2 Review Cadence

| Frequency | Activity | Owner | Participants |
|-----------|----------|-------|--------------|
| **Weekly** | Review Elasticsearch storage growth | Farhan | - |
| **Weekly** | Check AKS CPU/Memory trends during growth | Farhan | - |
| **Monthly** | Review Azure costs | Farhan | SS (if spike) |
| **Quarterly** | Full capacity review (all resources) | Farhan + Gna | SS |
| **Annually** | Capacity planning for next year | Gna + Farhan | SS, Finance |

---

### 3.3 Approval Process

**Capacity Expansions Requiring Approval**:

| Change Type | Approval Required | Timeline |
|-------------|-------------------|----------|
| Add 1-2 AKS nodes | Gna approval | 1 day |
| Add 3+ AKS nodes | SS (CTO) approval | 1-2 days |
| Storage expansion <200 GB | Farhan (no approval) | Immediate |
| Storage expansion >200 GB | Gna approval | 1 day |
| New VM deployment | Gna approval | 1-2 days |
| Major architecture change | SS + Gna approval | 1-2 weeks planning |
| Monthly cost increase >20% | SS (CTO) approval | Review before implementation |

---

## 4. Cost Projections

### 4.1 Current Monthly Costs (Estimated)

| Resource | Current Monthly Cost (USD) |
|----------|----------------------------|
| AKS Cluster (SEA) - 11 nodes | ~$2,200 |
| AKS Cluster (AU) - 3 nodes | ~$450 |
| VMs (4 total) | ~$350 |
| Storage (PVCs, disks) | ~$200 |
| Container Registry | ~$30 |
| Bandwidth | ~$50 |
| Log Analytics | ~$25 |
| Backup storage | ~$100 |
| Other (networking, etc.) | ~$200 |
| **Total** | **~$3,605/month** |

---

### 4.2 Projected Costs After Expansions (Dec 2026)

| Resource | Dec 2026 Monthly Cost (USD) | Increase |
|----------|----------------------------|----------|
| AKS Cluster (SEA) - 13 nodes | ~$2,600 | +$400 |
| AKS Cluster (AU) - 3-4 nodes | ~$450-600 | +$0-150 |
| VMs (4 total, expanded disks) | ~$370 | +$20 |
| Storage (expanded by 500 GB) | ~$250 | +$50 |
| Container Registry | ~$30 | $0 |
| Bandwidth | ~$60 | +$10 |
| Log Analytics (with AKS logs) | ~$40 | +$15 |
| Backup storage | ~$120 | +$20 |
| Other | ~$200 | $0 |
| **Total** | **~$4,720/month** | **+$1,115/month (+31%)** |

**Annual Impact**: +$13,380/year in infrastructure costs

**Cost per New Customer** (if 5 new customers):
- ~$2,676/year per customer (~$223/month)
- Must be factored into pricing

---

### 4.3 Cost Optimization Opportunities

**Potential Savings** (to implement throughout 2026):

1. **Reserved Instances for VMs**: Save 30-40%
   - Current: Pay-as-you-go for VMs
   - Switch to: 1-year reserved instances
   - **Savings**: ~$100-150/month

2. **Azure Hybrid Benefit**: Save on Windows licenses
   - Not applicable (Linux VMs only)

3. **Right-sizing VMs**: Review underutilized VMs
   - ubuntu-test1, emedge VMs may be oversized
   - Potential savings: ~$50/month

4. **Storage Lifecycle Management**: Archive old data
   - Elasticsearch data >6 months old → cheaper storage
   - **Savings**: ~$30-50/month

5. **Image Cleanup**: Delete old container images
   - Implement retention policy
   - **Savings**: ~$10-20/month

6. **Committed Use Discounts for AKS**: 1-year commitment
   - Save 5-15% on AKS compute
   - **Savings**: ~$150-300/month

**Total Potential Savings**: ~$340-670/month (~$4,000-8,000/year)

**Net Increase After Optimization**: +$445-775/month (~$5,000-9,000/year)

---

## 5. Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| **Elasticsearch runs out of space** | High | Critical | Implement storage alerts, expand Q2 2026, lifecycle policy |
| **AKS cluster CPU/RAM exhaustion** | Medium | High | Monitor weekly, add nodes Q3 2026, auto-scaling (future) |
| **Cost overrun (>40% increase)** | Medium | Medium | Monthly cost reviews, optimize resources, approval process |
| **Customer onboarding delayed due to capacity** | Low | High | Proactive expansion Q3 2026, buffer capacity maintained |
| **AU cluster failure (outdated K8s)** | High | Medium | URGENT upgrade Q1 2026 |
| **Storage expansion delay causing outage** | Low | High | Pre-approve expansion budget, automate where possible |

---

## 6. Action Plan Timeline

### Q1 2026 (Jan-Mar)
- [ ] **Week 1**: Implement capacity monitoring alerts (Farhan)
- [ ] **Week 2**: Upgrade aksau cluster to K8s 1.26.x (Farhan)
- [ ] **Week 3**: Enable OMS agent on aks cluster (Farhan)
- [ ] **Week 4**: Document all PVCs and current usage (Farhan)
- [ ] **Monthly**: Review costs and trends (Farhan → Gna)

### Q2 2026 (Apr-Jun)
- [ ] **April**: Quarterly capacity review (Farhan + Gna → SS)
- [ ] **May**: Expand Elasticsearch storage to 750 GB (Farhan)
- [ ] **May**: Implement data lifecycle management (Dev team)
- [ ] **June**: Review cost optimization opportunities (Farhan + Finance)

### Q3 2026 (Jul-Sep)
- [ ] **July**: Quarterly capacity review (Farhan + Gna → SS)
- [ ] **August**: Add 2 nodes to AKS SEA cluster (Farhan, approved by Gna/SS)
- [ ] **September**: Verify performance post-expansion

### Q4 2026 (Oct-Dec)
- [ ] **October**: Quarterly capacity review + Annual planning (Farhan + Gna → SS)
- [ ] **November**: Implement container image retention policy (Dev team)
- [ ] **November**: Expand m1-emedge1 disk if needed (Farhan)
- [ ] **December**: Year-end review and 2027 capacity planning

---

## 7. Success Metrics

**Capacity Planning Success Metrics**:
1. ✅ **Zero capacity-related outages** in 2026
2. ✅ **Maintain <80% resource utilization** for all critical resources
3. ✅ **Cost increase <35%** compared to budget (after optimization)
4. ✅ **Support 5+ new customer onboardings** without performance issues
5. ✅ **All quarterly reviews completed** on time
6. ✅ **All alerts implemented** by Q1 2026

---

## 8. Approval & Sign-off

**Capacity Plan Prepared By**:
- Farhan (Infrastructure Engineer): _______________ Date: _______

**Reviewed By**:
- Gna (R&D Director): _______________ Date: _______

**Approved By**:
- Soon Seah (CTO): _______________ Date: _______

---

## Appendix A: Resource Inventory

### AKS Cluster (aks) - Southeast Asia
- **Node Pool**: cvsstorage2 (7 nodes)
  - VM Size: Standard_D4as_v4
  - Per Node: 4 vCPU, 16 GB RAM
  - Total: 28 vCPU, 112 GB RAM

- **Node Pool**: services2 (2 nodes)
  - VM Size: Standard_DS11_v2
  - Per Node: 2 vCPU, 14 GB RAM
  - Total: 4 vCPU, 28 GB RAM

- **Node Pool**: cvsdefault3 (2 nodes)
  - VM Size: Standard_E4ads_v5
  - Per Node: 4 vCPU, 32 GB RAM
  - Total: 8 vCPU, 64 GB RAM

**Cluster Total**: 11 nodes, 40 vCPUs, 204 GB RAM

### AKS Cluster (aksau) - Australia East
- **Node Pool**: cvsdefault2 (1 node)
  - VM Size: Standard_DS11_v2
  - Per Node: 2 vCPU, 14 GB RAM

- **Node Pool**: cvsstorage1 (2 nodes)
  - VM Size: Standard_DS11_v2
  - Per Node: 2 vCPU, 14 GB RAM each
  - Total: 4 vCPU, 28 GB RAM

**Cluster Total**: 3 nodes, 6 vCPUs, 42 GB RAM

### Virtual Machines
1. m1-emedge1 (Standard_D2as_v4): 2 vCPU, 8 GB RAM, 100 GB disk
2. ubuntu-test1 (Standard_B2ms): 2 vCPU, 8 GB RAM, 30 GB disk
3. emedge-vm1 (Standard_D2as_v4): 2 vCPU, 8 GB RAM
4. emedge-vm2 (Standard_D2as_v4): 2 vCPU, 8 GB RAM

---

## Appendix B: Growth Assumptions

**Customer Growth**:
- Current customers: ~20 (estimated)
- New customers in 2026: 5 (+25%)
- Customer churn: 1-2 (<10%)
- Net new customers: 3-4

**Data Growth per Customer**:
- Monitoring data: +20% year-over-year
- Log volume: +30% year-over-year
- Metrics granularity increase: +10%

**Feature Expansion**:
- New microservices: 2-3 in 2026
- Enhanced monitoring features: +15% resource usage

**External Factors**:
- Cloud cost inflation: 3-5% annual increase (Azure pricing)
- No major architecture changes planned

---
