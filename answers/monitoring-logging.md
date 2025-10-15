# Monitoring, Logging & Alerting

**Last Updated:** 2025-10-15

---

## Overview

NetGain Systems uses its own observability platform (NetGain Cloud Vista) to monitor internal systems, supplemented by Azure monitoring services.

---

## Primary Monitoring: NetGain Cloud Vista

### Product Details
- **Name**: NetGain Cloud Vista
- **Type**: AI-powered observability platform
- **Purpose**: Monitor NetGain's own infrastructure and customer systems

### What is Monitored
**Status**: ❓ Need to document:
- [ ] Azure Kubernetes clusters (aks, aksau)
- [ ] Virtual machines (m1-emedge1, ubuntu-test1, emedge VMs)
- [ ] Application performance
- [ ] Database performance
- [ ] Network connectivity
- [ ] Security events

### Capabilities
- **Monitoring**: Metrics collection from systems
- **Logging**: Application and system logs
- **Alerting**: Real-time alerts for issues
- **AI-Powered Analysis**: Anomaly detection, root cause analysis

### Data Storage
- **Application Logs**: Stored in NetGain Cloud Vista
- **Retention**: 1 year
- **Platform**: Running on Azure Kubernetes

---

## Azure Native Monitoring

### Application Insights
- **Name**: ng-us-central
- **Location**: Central US
- **Resource Group**: core_sea
- **Status**: ✅ Configured

**Purpose**: Application performance monitoring (APM)

**Status**: ❓ Need to document:
- [ ] Which applications send data to App Insights
- [ ] What metrics are collected
- [ ] Alert rules configured
- [ ] Integration with Cloud Vista (if any)

---

### Log Analytics Workspace
- **Name**: DefaultWorkspace-9dd85c82-2a04-45f0-891a-959d1fab5cd4-EAU
- **Location**: Australia East
- **Resource Group**: DefaultResourceGroup-EAU
- **Status**: ✅ Configured

**Retention**: ❓ Need to verify (default is 30-90 days, recommend 180+ days for ISO 27001)

**Status**: ❓ Need to document:
- [ ] What logs are sent to Log Analytics
- [ ] Query patterns used
- [ ] Integration with Cloud Vista
- [ ] Access control (who can query logs)

---

### Azure Monitor (Prometheus)
- **Data Collection Endpoint**: MSProm-southeastasia-aks
- **Azure Monitor Account**: defaultazuremonitorworkspace-sea
- **Location**: Southeast Asia

**Prometheus Rule Groups Configured**:
- NodeRecordingRulesRuleGroup - aks
- NodeRecordingRulesRuleGroup-Win - aks
- KubernetesRecordingRulesRuleGroup - aks
- UXRecordingRulesRuleGroup - aks
- UXRecordingRulesRuleGroup-Win - aks
- NodeAndKubernetesRecordingRulesRuleGroup-Win - aks

**Status**: ✅ Prometheus monitoring configured for AKS
**Issue**: ⚠️ OMS agent disabled on main aks cluster - container logs not collected

---

## Logging

### Application Logs

**Primary Storage**: NetGain Cloud Vista
- **Retention**: 1 year
- **Sources**:
  - Application logs from services
  - API logs
  - Error logs
  - Audit logs

**Status**: ❓ Need to document:
- [ ] Log format and structure
- [ ] What events are logged
- [ ] Log levels used (DEBUG, INFO, WARN, ERROR)
- [ ] Sensitive data handling in logs (masking, filtering)

---

### Infrastructure Logs

**Azure Infrastructure Logs**:
- **Activity Logs**: Azure resource changes (default 90 days)
- **Diagnostic Logs**: Resource-specific logs
- **VM Logs**: System logs from Linux VMs
- **AKS Logs**: ⚠️ Not fully collected (OMS agent disabled)

**Status**: ❓ Need to document:
- [ ] Which Azure diagnostic logs are enabled
- [ ] Retention settings for different log types
- [ ] Where VM logs are sent (Log Analytics? Cloud Vista?)

---

### Database Logs

**Status**: ❓ Need to document:
- [ ] Elasticsearch logs (queries, errors, performance)
- [ ] CRM database logs
- [ ] MongoDB logs (if applicable)
- [ ] Slow query logging
- [ ] Authentication logs

---

### Security Logs

**Status**: ❓ Need to document:
- [ ] Authentication attempts (success/failure)
- [ ] Authorization failures
- [ ] Configuration changes
- [ ] Privileged access (sudo, root)
- [ ] Azure AD sign-in logs
- [ ] Network security group logs
- [ ] Firewall logs

---

## Log Retention Summary

| Log Type                    | Retention Period | Storage Location     | Status      |
|-----------------------------|------------------|----------------------|-------------|
| Application Logs            | 1 year           | Cloud Vista          | ✅ Confirmed |
| Cloud Vista Monitoring Data | ❓               | Elasticsearch in AKS | ❓ To verify |
| Azure Activity Logs         | 90 days (default)| Azure                | ❓ To verify |
| Azure Diagnostic Logs       | ❓               | Log Analytics        | ❓ To verify |
| Infrastructure Backups      | 3 years          | Azure Backup Vaults  | ✅ Confirmed |
| VM System Logs              | ❓               | ❓                   | ❓ To verify |
| AKS Container Logs          | ❌ Not collected | N/A                  | ⚠️ Issue    |

**Recommendation**: Extend retention to 180+ days or 1 year for compliance purposes where currently less.

---

## Alerting

### Alert Recipients

**Primary Contacts**:
- **Gna** (R&D Director): gna@netgain-systems.com
- **Soon Seah (SS)** (CTO): soonseah@netgain-systems.com
- **Responsible Technical Personnel**: Context-dependent

### Alert Triggers

**Confirmed Alerts**:
1. **System Health Issues**
   - Systems unhealthy
   - Performance degradation
   - Service failures

2. **Security Events**
   - Security breaches
   - Unauthorized access attempts
   - Suspicious activities

3. **Infrastructure Alerts** (Azure Monitor)
   - VM Availability (m1-emedge1)
   - Percentage CPU (m1-emedge1)
   - Available Memory Bytes (m1-emedge1)
   - OS Disk IOPS Consumed (m1-emedge1)
   - Data Disk IOPS Consumed (m1-emedge1)

---

### Azure Action Groups

**Configured Action Groups**:
1. **RecommendedAlertRules-AG-1** (core_sea)
   - Associated with VM alerts
   - ❓ Members need to be documented

2. **Application Insights Smart Detection** (core_sea)
   - Smart detection anomalies
   - ❓ Members need to be documented

**Status**: ❓ Need to document:
```bash
# Check action group members
az monitor action-group show \
  --resource-group core_sea \
  --name RecommendedAlertRules-AG-1 \
  --query "emailReceivers[].{Name:name,Email:emailAddress}" \
  --output table
```

---

### Alert Categories

**Status**: ❓ Need to document alerts for:

**Infrastructure**:
- [ ] AKS cluster health (node down, pod failures)
- [ ] AKS resource exhaustion (CPU, memory, disk)
- [ ] VM performance thresholds
- [ ] Network connectivity issues
- [ ] Disk space warnings

**Applications**:
- [ ] Application errors (error rate threshold)
- [ ] Application performance (response time)
- [ ] API failures
- [ ] Database connection failures
- [ ] Queue depth/backlog

**Security**:
- [ ] Failed authentication attempts (threshold)
- [ ] Unauthorized access
- [ ] Security policy violations
- [ ] Malware detection
- [ ] Suspicious network activity

**Databases**:
- [ ] Database down
- [ ] Replication lag
- [ ] Slow queries
- [ ] Connection pool exhaustion
- [ ] Backup failures

---

## Monitoring Coverage

### What IS Monitored

✅ **Virtual Machines** (via Azure Monitor):
- m1-emedge1: Full suite of alerts
- ubuntu-test1, emedge-vm1, emedge-vm2: ❓ Need to verify

✅ **Application Performance** (via Application Insights):
- ng-us-central configured

✅ **AKS Prometheus Metrics**:
- Node metrics
- Kubernetes metrics

✅ **Internal Systems** (via Cloud Vista):
- Infrastructure health
- System performance

---

### What is NOT Monitored (Gaps)

⚠️ **AKS Container Logs**: OMS agent disabled
- Cannot see pod logs
- Cannot troubleshoot container issues
- Missing security events in containers

❓ **AKS Alerting**: No dedicated AKS alerts found
- Pod restarts
- Failed pods
- Node issues
- PersistentVolume issues

❓ **Database Monitoring**: Not documented
- Elasticsearch health
- CRM database performance
- MongoDB status (if used)

❓ **Network Monitoring**: Not documented
- Load balancer health
- Network security group violations
- Bandwidth usage

❓ **Backup Monitoring**: Not documented
- Backup job failures
- Incomplete backups
- Backup duration anomalies

---

## Incident Response via Monitoring

### Detection
- **Cloud Vista**: AI-powered anomaly detection
- **Azure Monitor**: Threshold-based alerts
- **Manual**: Team member notices issue

### Notification
- **Alerts sent to**: Gna, SS, and responsible tech person
- **Methods**: ❓ Email? SMS? Slack? PagerDuty? (need to document)

### Response Process
**Status**: ❓ Need to document:
- [ ] Incident severity classification
- [ ] Response time SLAs by severity
- [ ] Escalation procedures
- [ ] Communication plan (internal and customer)
- [ ] Post-incident review process

---

## Dashboards & Visualization

### Cloud Vista Dashboards
**Status**: ❓ Need to document:
- [ ] System health dashboard
- [ ] Application performance dashboard
- [ ] Security dashboard
- [ ] Customer-specific dashboards
- [ ] Who has access to dashboards

### Azure Dashboards
**Status**: ❓ Need to document:
- [ ] Azure portal dashboards configured
- [ ] Grafana/Kibana (if used)
- [ ] Custom visualization tools

---

## Log Analysis & SIEM

### Security Information and Event Management (SIEM)

**Current State**: Cloud Vista provides observability, but SIEM-specific features unclear

**Status**: ❓ Need to document:
- [ ] Is Cloud Vista used as SIEM?
- [ ] Security event correlation
- [ ] Threat detection capabilities
- [ ] Integration with Azure Sentinel (or other SIEM)?
- [ ] Security analytics and reporting

---

## Performance Monitoring

### Application Performance Monitoring (APM)

**Tools**:
- Application Insights (ng-us-central)
- Cloud Vista

**Status**: ❓ Need to document:
- [ ] Application response time tracking
- [ ] Transaction tracing
- [ ] Error rate monitoring
- [ ] Dependency mapping
- [ ] User experience monitoring

---

### Infrastructure Performance

**Metrics Collected** (from Azure Monitor):
- CPU utilization
- Memory usage
- Disk IOPS
- Network throughput
- Pod/container metrics (via Prometheus)

**Status**: ❓ Need to document:
- [ ] Performance baselines
- [ ] Capacity planning process
- [ ] Performance testing results
- [ ] Historical trend analysis

---

## Audit Logging

### What Should Be Audited (ISO 27001)

**User Activities**:
- [ ] User authentication (success/failure)
- [ ] Privileged access (sudo, admin)
- [ ] Data access (database queries, file access)
- [ ] Configuration changes
- [ ] User account changes (create, modify, delete)

**System Activities**:
- [ ] System startup/shutdown
- [ ] Service start/stop
- [ ] Software installation
- [ ] Patch application
- [ ] Backup/restore operations

**Security Events**:
- [ ] Firewall rule changes
- [ ] Security policy changes
- [ ] Malware detection
- [ ] Intrusion attempts
- [ ] Security alert triggers

**Status**: ❓ Need to verify which of these are currently logged and retained.

---

## Log Management Best Practices

### Current Implementation

✅ **Centralized Logging**: Cloud Vista aggregates logs
✅ **Long Retention**: 1 year for application logs
✅ **Monitoring Platform**: Own product used internally

### Gaps

❓ **Log Protection**:
- [ ] Log integrity (tamper-proof logs)
- [ ] Log access control
- [ ] Log encryption at rest and in transit

❓ **Log Review**:
- [ ] Regular log review process
- [ ] Who reviews logs and how often
- [ ] Automated log analysis
- [ ] Suspicious activity detection

❓ **Log Correlation**:
- [ ] Cross-system event correlation
- [ ] Timeline reconstruction capability
- [ ] Attack pattern detection

---

## Action Items

### Immediate Priority (Critical Issues)
- [ ] **Enable OMS agent on aks cluster** - collect container logs
- [ ] Document action group members for alerts
- [ ] Verify alert notification methods (email, SMS, etc.)

### High Priority
- [ ] Configure AKS-specific alerts (pod failures, node issues)
- [ ] Extend Log Analytics retention to 180+ days
- [ ] Document database monitoring approach
- [ ] Implement backup job monitoring and alerting

### Medium Priority
- [ ] Document log review procedures
- [ ] Implement log integrity protection
- [ ] Create security dashboard/SIEM view
- [ ] Document incident response procedures
- [ ] Set up regular log analysis reviews

### Low Priority
- [ ] Create runbooks for common alerts
- [ ] Optimize alert thresholds (reduce noise)
- [ ] Implement predictive alerting
- [ ] Create customer-facing status dashboard

---

## ISO 27001 Requirements

### Currently Satisfied
- ✅ Event logging (A.12.4.1) - via Cloud Vista
- ✅ Clock synchronization (A.12.4.4) - Azure handles
- ✅ Monitoring system use (A.12.4.1) - via Cloud Vista

### Requires Documentation
- ❓ Log review procedures (A.12.4.1)
- ❓ Log protection (A.12.4.2)
- ❓ Administrator and operator logs (A.12.4.3)
- ❓ Incident response via monitoring (A.16.1.2)

### Requires Implementation/Verification
- ⚠️ AKS container logs (A.12.4.1) - OMS agent disabled
- ❓ Audit log retention policy (A.12.4.1)
- ❓ Security event alerting (A.16.1.4)
- ❓ Log integrity protection (A.12.4.2)

---
