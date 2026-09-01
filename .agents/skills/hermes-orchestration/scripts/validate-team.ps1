param()

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..\..\..')).Path
$roles = @('researcher', 'analyst', 'architect', 'executor', 'reviewer', 'verifier')
$titles = @(
    'Hermes · Researcher',
    'Hermes · Analyst',
    'Hermes · Architect',
    'Hermes · Executor',
    'Hermes · Reviewer',
    'Hermes · Verifier'
)
$errors = [System.Collections.Generic.List[string]]::new()

function Require-File([string]$relativePath) {
    $path = Join-Path $projectRoot $relativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $errors.Add("Missing file: $relativePath")
    }
}

Require-File 'AGENTS.md'
Require-File 'HARNESS.md'
Require-File '.hermes\team\PROTOCOL.md'
Require-File '.hermes\team\ROSTER.md'

foreach ($role in $roles) {
    Require-File ".hermes\team\roles\$role.md"
    Require-File ".hermes\team\memory\$role.md"
    Require-File ".hermes\team\evolution\$role.md"
    Require-File ".agents\skills\hermes-$role\SKILL.md"

    $skillPath = Join-Path $projectRoot ".agents\skills\hermes-$role\SKILL.md"
    if (Test-Path -LiteralPath $skillPath) {
        $skill = Get-Content -Raw -LiteralPath $skillPath
        if ($skill -notmatch "(?m)^name: hermes-$role$") {
            $errors.Add("Invalid skill name: hermes-$role")
        }
        if ($skill -notmatch '(?m)^description: .+') {
            $errors.Add("Missing skill description: hermes-$role")
        }
    }

    $profilePath = Join-Path $projectRoot ".hermes\team\roles\$role.md"
    if (Test-Path -LiteralPath $profilePath) {
        $profile = Get-Content -Raw -LiteralPath $profilePath
        if ($profile -notmatch [regex]::Escape(".hermes/team/memory/$role.md")) {
            $errors.Add("Role ownership missing memory path: $role")
        }
        if ($profile -notmatch [regex]::Escape(".hermes/team/evolution/$role.md")) {
            $errors.Add("Role ownership missing evolution path: $role")
        }
    }
}

$rosterPath = Join-Path $projectRoot '.hermes\team\ROSTER.md'
if (Test-Path -LiteralPath $rosterPath) {
    $roster = Get-Content -Raw -LiteralPath $rosterPath
    foreach ($title in $titles) {
        if ($roster -notmatch [regex]::Escape($title)) {
            $errors.Add("Missing roster title: $title")
        }
    }
    $modelCount = ([regex]::Matches($roster, '\| `gpt-5\.6-luna` \| `high` \|')).Count
    if ($modelCount -ne 6) {
        $errors.Add("Expected 6 Luna-high core rows; found $modelCount")
    }
    if ($roster -match '\bPENDING\b') {
        $errors.Add('Roster still contains PENDING task IDs')
    }
}

$protocolPath = Join-Path $projectRoot '.hermes\team\PROTOCOL.md'
if (Test-Path -LiteralPath $protocolPath) {
    $protocol = Get-Content -Raw -LiteralPath $protocolPath
    foreach ($required in @('HERMES-MSG v1', 'at most two', 'gpt-5.6-luna')) {
        if ($protocol -notmatch [regex]::Escape($required)) {
            $errors.Add("Protocol invariant missing: $required")
        }
    }
    if ($protocol -notmatch 'reasoning\s+effort\s+`high`') {
        $errors.Add('Protocol invariant missing: Luna reasoning effort high')
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Hermes team validation passed.'
Write-Output 'Core roles: 6'
Write-Output 'Specialist model: gpt-5.6-luna'
Write-Output 'Reasoning effort: high'
Write-Output "Project root: $projectRoot"
