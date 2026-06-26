#!/usr/bin/env pwsh
# easy-commit.ps1 -- stage everything, commit, push to small-carl/wp-ARTICLES

param(
    [string]$Message = "",
    [switch]$DryRun,
    [switch]$Yes,
    [switch]$Help
)

function Show-Help {
@"
easy-commit.ps1 -- stage all changes, commit, and push to GitHub (origin/main).

USAGE
    .\easy-commit.ps1 [Message] [-DryRun] [-Yes] [-Help]

PARAMETERS
    Message    Commit message. If omitted, uses "update <yyyy-MM-dd>".
    -DryRun    Show what would be staged, then exit without committing.
    -Yes       Skip the [y/n] confirmation (for scripts / automation).
    -Help      Show this help and exit.

EXAMPLES
    .\easy-commit.ps1
        Stage all -> message "update 2026-06-26" -> ask [y/n] -> push.

    .\easy-commit.ps1 "add SO(3) figure"
        Custom message (still asks [y/n] before pushing).

    .\easy-commit.ps1 -DryRun
        Preview the pending changes only; commit nothing.

    .\easy-commit.ps1 "ci: regen figures" -Yes
        Commit and push with no prompt.
"@
}

if ($Help) { Show-Help; exit 0 }

$repo = $PSScriptRoot
Write-Host "easy-commit -> stage all, commit, push to origin/main   (use -Help for options)"

# --- check for changes -------------------------------------------------------
$changed = git -C $repo status --porcelain
if (-not $changed) {
    Write-Host "Nothing to commit - working tree is clean."
    exit 0
}

# --- confirmation #1: review the pending changes -----------------------------
Write-Host "`nPending changes:"
git -C $repo status --short
Write-Host ""

if ($DryRun) {
    Write-Host "[dry-run] Would commit and push the changes above."
    exit 0
}

# --- build commit message ----------------------------------------------------
if (-not $Message) {
    $Message = "update $(Get-Date -Format 'yyyy-MM-dd')"
}
Write-Host "Commit message: `"$Message`""

# --- confirmation #2: explicit y/n before commit + push ----------------------
if (-not $Yes) {
    $confirm = Read-Host "Commit and push to origin/main? [y/N]"
    if ($confirm -notmatch '^[Yy]') {
        Write-Host "Aborted - nothing committed."
        exit 0
    }
}

# --- stage, commit, push -----------------------------------------------------
git -C $repo add -A
git -C $repo commit -m $Message
git -C $repo push origin main
