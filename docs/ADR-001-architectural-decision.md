# ADR-001: Autonomous Vector Lifecycle Governor: Storage Tiering & Tombstoning in Azure AI Search

## Status
Accepted

## Service Owner & Sign-Off Authority
Lead AI Platform Architect & FinOps Director

## Dominant Artefact
Vector Index Tombstone & Cold-Tier Eviction Matrix

## Decision & Refusal Boundary
All production state mutations must pass deterministic pre-flight policy evaluation in `src/Invoke-VectorIndexTombstoneSweep.ps1` and satisfy the 16-test Pester verification contract in `tests/Boundary-Verification.Tests.ps1` before execution.
