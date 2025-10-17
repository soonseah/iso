#!/usr/bin/env bash
set -euo pipefail

# Verify Entra ID Conditional Access baseline for Tech 04
# Produces JSON evidence under answers/evidence/azure/

OUT_DIR="answers/evidence/azure"
mkdir -p "$OUT_DIR"

echo "== Azure context =="
az account show --output table || true

echo "== Fetch Conditional Access policies (Graph v1.0) =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies \
  --output json > "$OUT_DIR/conditional-access-policies.json"

echo "== Summary: name, state, grants, clientAppTypes =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies \
  --query "value[].{name:displayName,state:state,grants:grantControls.builtInControls,clientApps:conditions.clientAppTypes}" \
  --output table | tee "$OUT_DIR/conditional-access-summary.txt"

echo "== Check: Block Legacy Auth present (exchangeActiveSync/other + block) =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies \
  --query "value[?contains(join(',', conditions.clientAppTypes), 'exchangeActiveSync') || contains(join(',', conditions.clientAppTypes), 'other') && contains(join(',', grantControls.builtInControls), 'block')].[displayName,state]" \
  --output table | tee "$OUT_DIR/legacy-auth-block-check.txt"

echo "== Check: MFA for Admin Roles present =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies \
  --query "value[?grantControls && contains(join(',', grantControls.builtInControls), 'mfa') && length(conditions.users.includeRoles) > `0`].[displayName,state]" \
  --output table | tee "$OUT_DIR/mfa-admin-roles-check.txt"

echo "== Detailed Admin MFA policy (first match) =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies \
  --query "value[?grantControls && contains(join(',', grantControls.builtInControls), 'mfa') && length(conditions.users.includeRoles) > `0`][0]" \
  --output json > "$OUT_DIR/mfa-admin-policy.json"

echo "== Authentication Methods Policy =="
az rest --method GET \
  --url https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy \
  --output json > "$OUT_DIR/authentication-methods-policy.json"

echo "== Done. Evidence written to $OUT_DIR =="

