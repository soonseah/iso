# Azure Capacity - Facts from CLI Audit

**Last Updated:** 2025-10-15
**Source**: Direct Azure CLI queries

---

## AKS Clusters - Confirmed Configuration

### AKS Southeast Asia (aks)
- **Location**: Southeast Asia
- **Kubernetes Version**: 1.26.12
- **Resource Group**: core_sea
- **Managed Resource Group**: MC_core_sea_aks_southeastasia

**Node Pools**:
1. **cvsstorage2**: 7 nodes
   - VM Size: Standard_D4as_v4
   - OS Disk: 128 GB per node
   - Total OS Disk: 896 GB

2. **services2**: 2 nodes
   - VM Size: Standard_DS11_v2
   - OS Disk: 128 GB per node
   - Total OS Disk: 256 GB

3. **cvsdefault3**: 2 nodes
   - VM Size: Standard_E4ads_v5
   - OS Disk: 128 GB per node
   - Total OS Disk: 256 GB

**Totals**: 11 nodes, 1,408 GB OS disk space

**Persistent Volumes**: 32 PVCs attached (size data unavailable via Azure CLI)

---

### AKS Australia East (aksau)
- **Location**: Australia East
- **Kubernetes Version**: 1.22.6 ⚠️ **OUTDATED - CRITICAL**
- **Resource Group**: core_au
- **Managed Resource Group**: MC_core_au_aksau_australiaeast

**Node Pools**:
1. **cvsdefault2**: 1 node
   - VM Size: Standard_DS11_v2
   - OS Disk: 128 GB

2. **cvsstorage1**: 2 nodes
   - VM Size: Standard_DS11_v2
   - OS Disk: 128 GB per node
   - Total OS Disk: 256 GB

**Totals**: 3 nodes, 384 GB OS disk space

**Persistent Volumes**: 8 PVCs attached (size data unavailable via Azure CLI)

---

## Virtual Machines - Confirmed Status

### Active VMs

1. **m1-emedge1**
   - Resource Group: CORE_SEA
   - Location: Southeast Asia
   - VM Size: Standard_D2as_v4
   - **Status**: ✅ Running

2. **emedge-vm1**
   - Resource Group: RG-EMEDGE-HA-TEST
   - Location: Southeast Asia
   - VM Size: Standard_D2as_v4
   - **Status**: ✅ Running

3. **emedge-vm2**
   - Resource Group: RG-EMEDGE-HA-TEST
   - Location: Southeast Asia
   - VM Size: Standard_D2as_v4
   - **Status**: ✅ Running

### Deallocated VMs

4. **ubuntu-test1**
   - Resource Group: CORE_SEA
   - Location: Southeast Asia
   - VM Size: Standard_B2ms
   - **Status**: ⏸️ Deallocated (not consuming compute resources)

**Note**: ubuntu-test1 is deallocated and not using compute resources, only storage costs apply.

---

## Container Registry - CRITICAL ISSUE

**Registry Name**: netgain
**Resource Group**: core_sea
**SKU**: Basic
**Storage Account**: null (managed by Azure)

### Capacity
- **Limit**: 10 GB (Basic SKU limit)
- **Current Usage**: 193,839,234,256 Bytes = **193.8 GB**
- **Usage Percentage**: **1,938%** (nearly 20x over limit!)

### Usage Details
- **Webhooks**: 0/2 used
- **ScopeMaps**: 0/100 used
- **Tokens**: 0/100 used

### Repositories (47 total)
1. apiserver
2. apmserver
3. asknetgain
4. astra
5. bugzilla
6. certbot
7. chromedriver
8. cicd
9. crm
10. cv
11. cv_livedemo
12. cv_v14
13. cvsctl
14. cvsrouter
15. docs
16. download
17. emedge
18. emedge_v14
19. monitor
20. mysql
21. n8n
22. n8n-postgresql
23. nessus
24. neural-ops/backend
25. neural-ops/frontend
26. neuralops
27. neuralops/backend
28. neuralops/frontend
29. neuroops/backend
30. neuroops/frontend
31. ng-grafana
32. notify
33. ollama
34. oracle-xe
35. platform/backend
36. platform/frontend
37. portal
38. redis
39. sd/app
40. sd/backend
41. sd/frontend
42. servicedesk
43. spogdocs
44. svcgateway
45. webproxy
46. wix
47. wordpress

### Critical Action Required
🔴 **IMMEDIATE**: Container registry is massively over Basic SKU limit
- Basic SKU limit: 10 GB
- Current usage: 193.8 GB
- Basic SKU is throttled and may have performance issues

**Actions Needed**:
1. **Upgrade to Standard SKU immediately** (unlimited storage, pay for usage)
2. **Implement image retention policy**:
   - Keep only last 10 versions per image
   - Delete untagged images older than 90 days
   - Remove unused repositories
3. **Estimate cost**: At Standard pricing ~$0.10/GB/month = ~$20/month for current 193.8 GB
4. **Review 47 repositories**: Many appear to be old/unused (bugzilla, wordpress, wix, etc.)

---

## Storage Accounts - Confirmed List

**Total**: 7 storage accounts

| Name | Resource Group | Location | SKU | Purpose |
|------|----------------|----------|-----|---------|
| cs11003200031c03ddf | cloud-shell-storage-southeastasia | Southeast Asia | Standard_LRS | Cloud Shell |
| emedgeconfigst | rg-emedge-HA-test | Southeast Asia | Standard_ZRS | EMEdge HA config |
| f818db82f0b1d4a3dba63cb | mc_core_sea_aks_southeastasia | Southeast Asia | Standard_LRS | AKS SEA storage |
| f875118f142c344728c2041 | mc_core_sea_aks_southeastasia | Southeast Asia | Premium_LRS | AKS SEA premium |
| fc3e9bb1f4c41448a8a6aef | mc_core_sea_aks_southeastasia | Southeast Asia | Standard_LRS | AKS SEA storage |
| fd9ea005c933048b686fdb3 | mc_core_au_aksau_australiaeast | Australia East | Standard_LRS | AKS AU storage |
| stdefaulthub969906751183 | rg-soonseah-0555_ai | Australia East | Standard_LRS | AI/dev hub |

**Note**: Storage usage requires per-account query, not available in summary.

---

## Log Analytics Workspace

**Name**: DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU
**Resource Group**: DefaultResourceGroup-EAU
**Location**: Australia East

**Configuration**:
- **SKU**: PerGB2018 (pay-per-GB ingestion)
- **Retention**: 30 days (default)
- **Current Usage**: Unknown (requires log query)

**Recommendation**: Consider extending retention to 180 days for ISO 27001 compliance

---

## Persistent Volumes (PVCs)

### Southeast Asia AKS
- **Count**: 32 PVCs
- **Naming Pattern**:
  - `kubernetes-dynamic-pvc-*` (9 volumes)
  - `pvc-*` (23 volumes)
- **State**: Attached to pods
- **Size**: Not available via Azure CLI (requires `kubectl get pvc`)

### Australia East AKS
- **Count**: 8 PVCs
- **Naming Pattern**: Mix of kubernetes-dynamic-pvc and pvc
- **State**: Attached to pods
- **Size**: Not available via Azure CLI (requires `kubectl get pvc`)

**Action Required**: Use `kubectl get pvc --all-namespaces` to get actual sizes and purposes

---

## Data Collection Limitations

### Metrics Not Available via Azure CLI

1. **AKS Node CPU/RAM Usage**
   - Requires: `kubectl top nodes` (needs metrics-server)
   - Or: Azure Monitor Container Insights (OMS agent disabled)

2. **PVC Storage Usage**
   - Requires: `kubectl get pvc -A` for sizes
   - Requires: `kubectl exec` + `df -h` for actual usage percentage

3. **Storage Account Usage**
   - Requires: Per-account query with `az storage account show-usage`
   - Or: Azure portal for detailed metrics

4. **VM Metrics**
   - Available in Azure Monitor (portal)
   - Can query via `az monitor metrics list` but requires specific metric names

5. **Log Analytics Ingestion**
   - Requires: Kusto query on workspace
   - Example: `Usage | where TimeGenerated > ago(30d) | summarize sum(Quantity) by bin(TimeGenerated, 1d)`

---

## Key Findings Summary

### Critical Issues
1. 🔴 **Container Registry**: 193.8 GB used on 10 GB Basic SKU (1,938% over limit)
2. 🔴 **AU Cluster**: Kubernetes v1.22.6 (outdated, unsupported)
3. ⚠️ **Monitoring**: OMS agent disabled - can't measure AKS resource usage

### Capacity Status
- **AKS SEA**: 11 nodes deployed, usage unknown without monitoring
- **AKS AU**: 3 nodes deployed, usage unknown without monitoring
- **VMs**: 3 running, 1 deallocated
- **Storage**: Multiple accounts, individual usage unknown
- **PVCs**: 40 total (32 SEA + 8 AU), sizes and usage unknown

### Required Actions
1. **Immediate**: Upgrade container registry to Standard SKU
2. **Immediate**: Clean up container images (193.8 GB → target <50 GB)
3. **Q1 2026**: Upgrade AU cluster from K8s 1.22.6
4. **Q1 2026**: Enable OMS agent for AKS monitoring
5. **Q1 2026**: Document all PVCs using kubectl
6. **Ongoing**: Implement monitoring dashboards for capacity tracking

---

## CLI Commands for Future Reference

### Get AKS Details
```bash
az aks show --resource-group core_sea --name aks --query "{name:name, k8sVersion:kubernetesVersion, nodes:agentPoolProfiles}"
```

### Get Container Registry Usage
```bash
az acr show-usage --name netgain --resource-group core_sea --output table
```

### Get VM Status
```bash
az vm list --show-details --query "[].{name:name, powerState:powerState, size:hardwareProfile.vmSize}"
```

### Get Storage Account List
```bash
az storage account list --query "[].{name:name, resourceGroup:resourceGroup, sku:sku.name}"
```

### Get PVC Disks
```bash
az disk list --query "[?contains(name,'pvc-')].{name:name, sizeGB:diskSizeGb, state:diskState}"
```

### Get Log Analytics Config
```bash
az monitor log-analytics workspace show --resource-group DefaultResourceGroup-EAU --workspace-name DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU
```

---
