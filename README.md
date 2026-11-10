# Autonomous Vector Lifecycle Governor: Storage Tiering & Tombstoning in Azure AI Search

[![Pester Verification](https://img.shields.io/badge/pester-16%2F16%20passing-brightgreen)](tests/StorageLifecycle.Tests.ps1)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Architecture Deep-Dive](https://img.shields.io/badge/blog-alerasoul.net-0a1128)](https://alerasoul.net/autonomous-vector-index-lifecycle-governor/)

> **Primary Governance Artefact:** Vector Index Tombstone & Cold-Tier Eviction Matrix  
> **Accountable Service Owner:** Lead AI Platform Architect & FinOps Director  
> **Full Architectural Deep-Dive:** [https://alerasoul.net/autonomous-vector-index-lifecycle-governor/](https://alerasoul.net/autonomous-vector-index-lifecycle-governor/)

---

## Repository Layout (9 Files)

```text
├── .gitignore
├── LICENSE
├── README.md
├── docs/STORAGE-FINOPS-GUIDE.md
├── fixtures/storage-access-heatmap.json
├── policies/blob-tiering-rules.json
├── queries/CoolTier-EarlyRead-Penalty.kql
├── src/Invoke-VectorIndexTombstoneSweep.ps1
└── tests/StorageLifecycle.Tests.ps1
```

## Quickstart & Offline Verification

```powershell
# 1. Execute the primary PowerShell 7 evaluator
pwsh -NoProfile -File ./src/Invoke-VectorIndexTombstoneSweep.ps1

# 2. Run the 16-test Pester verification contract
Invoke-Pester -Path ./tests/StorageLifecycle.Tests.ps1 -Output Detailed
```

## License

Released under the [MIT License](LICENSE). Authored by **Shahrad Alerasoul** ([alerasoul.net](https://alerasoul.net)).
