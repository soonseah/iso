# Azure Infrastructure Details

**Last Updated:** 2025-10-15

---

## Overview

- **Subscription**: Pay-As-You-Go (ID: 9dd85c82-2a04-45f0-891a-959d1fab5cd4)
- **Tenant ID**: a1264c1d-cea3-44c4-b322-4bb6ddaba9c8
- **Primary Regions**: Southeast Asia, Australia East

---

## AKS Clusters (Kubernetes)

### 1. aks (Southeast Asia)
- **Location**: Southeast Asia
- **Kubernetes Version**: 1.26.12
- **Resource Group**: core_sea
- **Managed Resource Group**: MC_core_sea_aks_southeastasia

**Node Pools:**
| Pool Name    | VM Size           | Node Count | Purpose        |
|--------------|-------------------|------------|----------------|
| cvsstorage2  | Standard_D4as_v4  | 7          | Storage        |
| services2    | Standard_DS11_v2  | 2          | Services       |
| cvsdefault3  | Standard_E4ads_v5 | 2          | Default/compute|

**Total Nodes**: 11

**Monitoring Status**: ❌ Disabled (OMS agent not enabled)

**Public IP**: aks_ip (Southeast Asia)

---

### 2. aksau (Australia East)
- **Location**: Australia East
- **Kubernetes Version**: 1.22.6 ⚠️ **OUTDATED - NEEDS UPGRADE**
- **Resource Group**: core_au
- **Managed Resource Group**: MC_core_au_aksau_australiaeast

**Node Pools:**
| Pool Name    | VM Size          | Node Count |
|--------------|------------------|------------|
| cvsdefault2  | Standard_DS11_v2 | 1          |
| cvsstorage1  | Standard_DS11_v2 | 2          |

**Total Nodes**: 3

**Monitoring Status**: ❌ Not configured

**Public IP**: aksau_ip, 049eea03-dcd4-4d9a-a422-084981a8b548

---

## Virtual Machines

### 1. m1-emedge1 (Production)
- **Resource Group**: core_sea
- **Location**: Southeast Asia
- **Size**: Standard_D2as_v4 (2 vCPUs, 8 GB RAM)
- **OS**: Linux
- **Public IP**: edge1-m1-sg-ip, pip-edge1-m1-sg-vnet-southeastasia-default
- **VNet**: edge1-m1-sg-vnet
- **NSG**: m1-emedge1-nsg, edge1-m1-sg-nsg
- **Bastion Access**: ✅ edge1-m1-sg-vnet-bastion
- **Extensions**: AADSSHLoginForLinux, enablevmAccess
- **Backup**: ✅ Enabled (AzureBackupRG_southeastasia_1)

**Alert Rules Configured:**
- VM Availability
- Percentage CPU
- Available Memory Bytes
- OS Disk IOPS Consumed Percentage
- Data Disk IOPS Consumed Percentage

**Purpose**: M1 edge monitoring agent

---

### 2. ubuntu-test1 (Testing)
- **Resource Group**: core_sea
- **Location**: Southeast Asia
- **Size**: Standard_B2ms (2 vCPUs, 8 GB RAM)
- **OS**: Linux
- **Public IP**: ubuntu-test1-ip
- **VNet**: edge1-m1-sg-vnet (shared with m1-emedge1)
- **NSG**: ubuntu-test1-nsg
- **Backup**: ✅ Enabled (daily snapshots visible)

**Purpose**: Testing environment

---

### 3. emedge-vm1 (HA Testing)
- **Resource Group**: rg-emedge-HA-test
- **Location**: Southeast Asia
- **Size**: Standard_D2as_v4 (2 vCPUs, 8 GB RAM)
- **OS**: Linux
- **Public IP**: emedge-vm1-public-ip
- **VNet**: vnet-emedge-ha-sea
- **NSG**: nsg-emedge-collectors (shared)
- **Load Balancer**: lb-emedge-public (PublicIP-LB-EMEdge)

**Purpose**: HA testing for edge monitoring

---

### 4. emedge-vm2 (HA Testing)
- **Resource Group**: rg-emedge-HA-test
- **Location**: Southeast Asia
- **Size**: Standard_D2as_v4 (2 vCPUs, 8 GB RAM)
- **OS**: Linux
- **Public IP**: emedge-vm2-public-ip
- **VNet**: vnet-emedge-ha-sea
- **NSG**: nsg-emedge-collectors (shared)
- **Load Balancer**: lb-emedge-public (PublicIP-LB-EMEdge)

**Purpose**: HA testing for edge monitoring

---

## Container Registry

### netgain
- **Location**: Southeast Asia
- **Resource Group**: core_sea
- **Type**: Azure Container Registry
- **Purpose**: Stores Docker images for AKS deployments

**Access:**
- soonseah@netgain-systems.com: Owner
- gna@netgain-systems.com: AcrPush

---

## Storage Accounts

| Name                      | Resource Group                    | Location       | Type        | Purpose          |
|---------------------------|-----------------------------------|----------------|-------------|------------------|
| cs11003200031c03ddf       | cloud-shell-storage-southeastasia | Southeast Asia | StorageV2   | Cloud Shell      |
| emedgeconfigst            | rg-emedge-HA-test                 | Southeast Asia | StorageV2   | EMEdge config    |
| f818db82f0b1d4a3dba63cb   | mc_core_sea_aks_southeastasia     | Southeast Asia | StorageV2   | AKS storage      |
| f875118f142c344728c2041   | mc_core_sea_aks_southeastasia     | Southeast Asia | FileStorage | AKS file storage |
| fc3e9bb1f4c41448a8a6aef   | mc_core_sea_aks_southeastasia     | Southeast Asia | StorageV2   | AKS storage      |
| fd9ea005c933048b686fdb3   | mc_core_au_aksau_australiaeast    | Australia East | StorageV2   | AKS AU storage   |
| stdefaulthub969906751183  | rg-soonseah-0555_ai               | Australia East | StorageV2   | AI/dev hub       |

---

## Backup Infrastructure

### Backup Vaults

1. **main-vault**
   - Type: Data Protection Backup Vault
   - Location: Southeast Asia
   - Resource Group: core_sea

2. **main-vault-au**
   - Type: Data Protection Backup Vault
   - Location: Australia East
   - Resource Group: core_au

3. **recovery-vault-sea**
   - Type: Recovery Services Vault
   - Location: Southeast Asia
   - Resource Group: core_sea

### Backup Status
- ✅ Daily automated snapshots running
- ✅ Snapshots visible from Oct 7-14, 2025
- ❌ No documented restore testing
- ❓ Retention policy not documented

**VMs with Backup:**
- m1-emedge1: AzureBackup_m1-emedge1_70369164174380
- ubuntu-test1: Daily snapshots created

---

## Networking

### Virtual Networks

1. **aks-vnet-31818598** (MC_core_sea_aks_southeastasia)
   - AKS Southeast Asia cluster network
   - Route table: aks-agentpool-31818598-routetable

2. **aks-vnet-39240352** (MC_core_au_aksau_australiaeast)
   - AKS Australia cluster network

3. **edge1-m1-sg-vnet** (core_sea)
   - VM network for m1-emedge1 and ubuntu-test1
   - Has Azure Bastion attached

4. **vnet-emedge-ha-sea** (rg-emedge-HA-test)
   - HA testing network for emedge VMs

5. **core_au-vnet** (core_au)
   - Australia region network

### Network Security Groups (NSGs)

- aks-agentpool-31818598-nsg (AKS SEA)
- aks-agentpool-39240352-nsg (AKS AU)
- m1-emedge1-nsg
- edge1-m1-sg-nsg
- ubuntu-test1-nsg
- nsg-emedge-collectors (HA test)
- oraclexe-nsg

### Load Balancers

1. **kubernetes** (MC_core_sea_aks_southeastasia)
   - AKS Southeast Asia load balancer

2. **kubernetes** (MC_core_au_aksau_australiaeast)
   - AKS Australia load balancer

3. **lb-emedge-public** (rg-emedge-HA-test)
   - HA testing load balancer

### Bastion
- **edge1-m1-sg-vnet-bastion** (core_sea)
  - Provides secure RDP/SSH access to VMs without public IP exposure

---

## Key Vault

### kv-defaulth969906751183
- **Location**: Australia East
- **Resource Group**: rg-soonseah-0555_ai
- **Environment**: Development/AI

**Status**: ❓ Need to document:
- Access policies
- What secrets are stored
- Whether production uses this or another Key Vault
- Secrets rotation policy

---

## Monitoring & Logging

### Application Insights
- **Name**: ng-us-central
- **Location**: Central US
- **Resource Group**: core_sea
- **Purpose**: Application performance monitoring

### Log Analytics Workspace
- **Name**: DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU
- **Location**: Australia East
- **Resource Group**: DefaultResourceGroup-EAU

### Azure Monitor
- **Prometheus**: Configured for AKS
- **Data Collection Rules**: MSProm-southeastasia-aks
- **Prometheus Rule Groups**:
  - NodeRecordingRulesRuleGroup
  - KubernetesRecordingRulesRuleGroup
  - UXRecordingRulesRuleGroup
  - NodeAndKubernetesRecordingRulesRuleGroup-Win

### Azure Monitor Account
- **Name**: defaultazuremonitorworkspace-sea
- **Location**: Southeast Asia
- **Resource Group**: DefaultResourceGroup-SEA

### Alert Rules (m1-emedge1)
- VM Availability - edge1-m1-sg
- Percentage CPU - edge1-m1-sg
- Available Memory Bytes - edge1-m1-sg
- OS Disk IOPS Consumed Percentage - edge1-m1-sg
- Data Disk IOPS Consumed Percentage - edge1-m1-sg

### Action Groups
- RecommendedAlertRules-AG-1
- Application Insights Smart Detection

**Issues:**
- ❌ AKS monitoring (OMS agent) is DISABLED on main cluster
- ❓ Alert notification recipients not documented
- ❓ Log retention period not documented

---

## Resource Groups

| Name                                          | Purpose                    |
|-----------------------------------------------|----------------------------|
| core_sea                                      | Main Southeast Asia        |
| core_au                                       | Main Australia             |
| MC_core_sea_aks_southeastasia                 | AKS SEA managed            |
| MC_core_au_aksau_australiaeast                | AKS AU managed             |
| rg-emedge-HA-test                             | HA testing environment     |
| rg-soonseah-0555_ai                           | AI/dev environment         |
| cloud-shell-storage-southeastasia             | Cloud Shell storage        |
| AzureBackupRG_southeastasia_1                 | Backup artifacts           |
| NetworkWatcherRG                              | Network Watcher            |
| DefaultResourceGroup-SEA                      | Default Southeast Asia     |
| DefaultResourceGroup-EAU                      | Default Australia East     |
| MA_defaultazuremonitorworkspace-sea_southeastasia_managed | Azure Monitor managed |

---

## Action Items

### Immediate Priority
- [ ] Upgrade aksau from Kubernetes v1.22.6 to supported version
- [ ] Enable AKS monitoring on main aks cluster
- [ ] Document what's running inside AKS clusters (kubectl)
- [ ] Test backup restore procedures

### Documentation Needed
- [ ] Database locations (check AKS persistent volumes)
- [ ] Production secrets management approach
- [ ] Alert notification recipients
- [ ] Log retention policies
- [ ] Backup retention policies
- [ ] Key Vault usage and access policies

---
