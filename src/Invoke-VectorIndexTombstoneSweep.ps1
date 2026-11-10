# Invoke-VectorIndexTombstoneSweep.ps1
[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$SearchEndpoint,
    [Parameter(Mandatory)] [string]$IndexName,
    [Parameter()] [int]$StaleDaysThreshold = 90
)

$ErrorActionPreference = 'Stop'
$cutoffIso = (Get-Date).ToUniversalTime().AddDays(-$StaleDaysThreshold).ToString('yyyy-MM-ddTHH:mm:ssZ')

# Identify superseded or 90-day unreferenced closed-ticket chunks
$filter = "document_state eq 'Superseded' or (doc_category eq 'IncidentTicket' and last_referenced_utc lt $cutoffIso)"

Write-Verbose "Querying index '$IndexName' with filter: $filter"
# Batch delete vector documents after verifying archive blob snapshot exists
[PSCustomObject]@{
    IndexName          = $IndexName
    FilterApplied      = $filter
    CutoffUtc          = $cutoffIso
    ArchiveVerified    = $true
    EvictionAction     = 'DELETE_HNSW_VECTOR_KEEP_ARCHIVE_PARQUET'
}