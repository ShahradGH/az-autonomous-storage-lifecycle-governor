# Operational Runbook: Autonomous Vector Lifecycle Governor: Storage Tiering & Tombstoning in Azure AI Search (L2 / L3 Triage)

## 1. Scope & Ownership
- **Accountable Owner**: Lead AI Platform Architect & FinOps Director
- **Primary Evaluator**: `src/Invoke-VectorIndexTombstoneSweep.ps1`
- **Telemetry Source**: `diagnostics/Telemetry-Queries.kql`

## 2. Triage Procedure When Veto Gate Trips
1. Inspect the structured refusal object emitted by `src/Invoke-VectorIndexTombstoneSweep.ps1` and correlate the timestamp in Azure Monitor Log Analytics.
2. Do not bypass or disable the pre-flight policy gate without cryptographic dual-signature approval from the Lead AI Platform Architect & FinOps Director.
3. Verify remediation locally by running `Invoke-Pester -Path ./tests/Boundary-Verification.Tests.ps1 -Output Detailed`.
