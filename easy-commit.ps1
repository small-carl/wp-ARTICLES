#!/usr/bin/env pwsh
# easy-commit.ps1 — stage everything, commit, push to small-carl/wp-ARTICLES
#
# Usage:
#   .\easy-commit.ps1                      # auto timestamp message
#   .\easy-commit.ps1 "add SO(3) figure"  # custom message
#   .\easy-commit.ps1 -DryRun             # show what would be staged, don't commit

param(
    [string]$Message = "",
    [switch]$DryRun
)

$repo = $PSScriptRoot

# ── check for changes ────────────────────────────────────────────────────────
$changed = git -C $repo status --porcelain
if (-not $changed) {
    Write-Host "Nothing to commit — working tree is clean."
    exit 0
}

# ── show staged diff preview ─────────────────────────────────────────────────
Write-Host "`nPending changes:"
git -C $repo status --short
Write-Host ""

if ($DryRun) {
    Write-Host "[dry-run] Would commit and push the changes above."
    exit 0
}

# ── build commit message ─────────────────────────────────────────────────────
if (-not $Message) {
    $Message = "update $(Get-Date -Format 'yyyy-MM-dd')"
}

# ── stage, commit, push ──────────────────────────────────────────────────────
git -C $repo add -A
git -C $repo commit -m $Message
git -C $repo push origin main
