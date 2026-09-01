[CmdletBinding()]
param(
    [string]$SourceRoot,
    [switch]$RequireLiveRoster,
    [switch]$RequireCleanTrackedTree
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { $script:failures.Add($Message) }
}

function Read-Text {
    param([string]$RelativePath)
    $path = Join-Path $projectRoot $RelativePath
    Assert-True (Test-Path -LiteralPath $path -PathType Leaf) "Missing file: $RelativePath"
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        return Get-Content -LiteralPath $path -Raw
    }
    return ''
}

$manifestText = Read-Text '.hermes\social\capability-manifest.json'
$manifest = $null
try { $manifest = $manifestText | ConvertFrom-Json -Depth 20 }
catch { $failures.Add("Invalid capability manifest JSON: $($_.Exception.Message)") }

$expectedProfiles = @(
    'smanalyst', 'smorchestrator', 'smplanner', 'smproducer',
    'smpublisher', 'smreviewer', 'smstrategist'
)
$expectedCommon = @(
    'apple-notes','apple-reminders','findmy','imessage','claude-code','codex',
    'computer-use','hermes-agent','opencode','architecture-diagram','ascii-video',
    'baoyu-infographic','claude-design','design-md','humanizer','manim-video',
    'p5js','popular-web-designs','songwriting-and-ai-music','sdlc-review',
    'email-inbox-triage','himalaya','gif-search','songsee','youtube-content',
    'obsidian','airtable','box','chief-social-media','document-to-action-items',
    'docx','finday-social-governance','google-workspace','maps',
    'meeting-action-items','notion','pdf','powerpoint','product-price-monitor',
    'teams-meeting-pipeline','weekly-review-planning','xlsx','arxiv',
    'competitor-news-monitor','grounded-citations','llm-wiki','xurl',
    'codebase-inspection','dogfood','github','hermes-agent-skill-authoring',
    'inspecting-hermes-desktop-dom','node-inspect-debugger','python-debugpy',
    'requesting-code-review','simplify-code','spike','systematic-debugging',
    'test-driven-development','blocked-page-recovery'
)
$expectedUnique = @(
    'orchestrator-bot','finday-social-production',
    'social-content-calendar-workbooks','social-content-quality-gates',
    'finday-social-plan-artifact-validation','rencana-konten-iklan',
    'finday-native-raster-production'
)

if ($null -ne $manifest) {
    $rows = @($manifest.capabilities)
    $common = @($rows | Where-Object source_kind -eq 'common')
    $unique = @($rows | Where-Object source_kind -eq 'unique')
    Assert-True ($manifest.accounting.profiles -eq 7) 'Manifest accounting.profiles must be 7.'
    Assert-True ($manifest.accounting.common_logical -eq 60) 'Manifest accounting.common_logical must be 60.'
    Assert-True ($manifest.accounting.common_physical_copies -eq 420) 'Manifest accounting.common_physical_copies must be 420.'
    Assert-True ($manifest.accounting.unique_logical -eq 7) 'Manifest accounting.unique_logical must be 7.'
    Assert-True ($manifest.accounting.total_logical -eq 67) 'Manifest accounting.total_logical must be 67.'
    Assert-True ($rows.Count -eq 67) "Capability row count is $($rows.Count), expected 67."
    Assert-True ($common.Count -eq 60) "Common capability count is $($common.Count), expected 60."
    Assert-True ($unique.Count -eq 7) "Unique capability count is $($unique.Count), expected 7."
    Assert-True ((@($rows.id | Sort-Object -Unique)).Count -eq 67) 'Capability IDs are not unique.'
    Assert-True ((@($rows.name | Sort-Object -Unique)).Count -eq 67) 'Capability names are not unique.'
    Assert-True ((@($rows.test_id | Sort-Object -Unique)).Count -eq 67) 'Capability test IDs are not unique.'
    $expectedCapabilityIds = @(1..67 | ForEach-Object { 'C{0:D3}' -f $_ })
    $expectedTestIds = @(1..67 | ForEach-Object { 'CAP-{0:D3}' -f $_ })
    Assert-True (-not (Compare-Object (@($rows.id) | Sort-Object) ($expectedCapabilityIds | Sort-Object))) 'Capability IDs must be exactly C001 through C067.'
    Assert-True (-not (Compare-Object (@($rows.test_id) | Sort-Object) ($expectedTestIds | Sort-Object))) 'Capability test IDs must be exactly CAP-001 through CAP-067.'
    Assert-True (-not @($rows | Where-Object { $_.class -notin @('NATIVE','ADAPTED','UNAVAILABLE') })) 'Unknown capability class found.'
    Assert-True (-not @($rows | Where-Object { [string]::IsNullOrWhiteSpace($_.route) -or [string]::IsNullOrWhiteSpace($_.note) -or $_.status -ne 'verified' })) 'A capability lacks route, note, or verified status.'
    Assert-True (-not (Compare-Object ($common.name | Sort-Object) ($expectedCommon | Sort-Object))) 'Common capability names differ from the sanitized source inventory.'
    Assert-True (-not (Compare-Object ($unique.name | Sort-Object) ($expectedUnique | Sort-Object))) 'Unique capability names differ from the sanitized source inventory.'
    foreach ($row in $common) {
        Assert-True (-not (Compare-Object (@($row.source_profiles) | Sort-Object) ($expectedProfiles | Sort-Object))) "Common profile coverage mismatch: $($row.name)"
    }
    $expectedUniqueMapping = [ordered]@{
        'orchestrator-bot' = 'smorchestrator'
        'finday-social-production' = 'smorchestrator'
        'social-content-calendar-workbooks' = 'smorchestrator'
        'social-content-quality-gates' = 'smorchestrator'
        'finday-social-plan-artifact-validation' = 'smplanner'
        'rencana-konten-iklan' = 'smplanner'
        'finday-native-raster-production' = 'smproducer'
    }
    foreach ($entry in $expectedUniqueMapping.GetEnumerator()) {
        $row = @($unique | Where-Object name -eq $entry.Key)
        Assert-True ($row.Count -eq 1) "Unique capability mapping row count mismatch: $($entry.Key)"
        if ($row.Count -eq 1) {
            Assert-True ((@($row[0].source_profiles).Count -eq 1) -and ($row[0].source_profiles[0] -eq $entry.Value)) "Unique capability source mapping mismatch: $($entry.Key)"
        }
    }
}

if (-not [string]::IsNullOrWhiteSpace($SourceRoot)) {
    Assert-True (Test-Path -LiteralPath $SourceRoot -PathType Container) "Source root does not exist: $SourceRoot"
    if (Test-Path -LiteralPath $SourceRoot -PathType Container) {
        $sourceProfiles = @(Get-ChildItem -LiteralPath $SourceRoot -Directory | Select-Object -ExpandProperty Name | Sort-Object)
        Assert-True (-not (Compare-Object $sourceProfiles ($expectedProfiles | Sort-Object))) 'Source profile directory names differ from the seven-profile contract.'

        $profileSkillNames = @{}
        foreach ($profile in $expectedProfiles) {
            $skillRoot = Join-Path (Join-Path $SourceRoot $profile) 'skills'
            Assert-True (Test-Path -LiteralPath $skillRoot -PathType Container) "Missing source skill root: $profile"
            $names = @()
            if (Test-Path -LiteralPath $skillRoot -PathType Container) {
                foreach ($skillFile in Get-ChildItem -LiteralPath $skillRoot -Filter 'SKILL.md' -File -Recurse) {
                    $raw = Get-Content -LiteralPath $skillFile.FullName -Raw
                    $match = [regex]::Match($raw, '(?m)^name:\s*["'']?([^"''\r\n]+)')
                    if ($match.Success) { $names += $match.Groups[1].Value.Trim() }
                    else { $failures.Add("Missing source skill name: $($skillFile.FullName)") }
                }
            }
            $profileSkillNames[$profile] = @($names | Sort-Object -Unique)
        }

        $union = @($profileSkillNames.Values | ForEach-Object { $_ } | Sort-Object -Unique)
        $commonFromSource = @($profileSkillNames[$expectedProfiles[0]] | Where-Object {
            $candidate = $_
            -not @($expectedProfiles | Where-Object { $profileSkillNames[$_] -notcontains $candidate })
        } | Sort-Object -Unique)

        Assert-True ($union.Count -eq 67) "Source logical union is $($union.Count), expected 67."
        Assert-True ($commonFromSource.Count -eq 60) "Source common set is $($commonFromSource.Count), expected 60."
        Assert-True (($commonFromSource.Count * $expectedProfiles.Count) -eq 420) 'Source common physical-copy accounting is not 420.'
        if ($null -ne $manifest) {
            Assert-True (-not (Compare-Object $union (@($manifest.capabilities.name) | Sort-Object -Unique))) 'Manifest names differ from the live sanitized source skill union.'
        }

        $expectedDeltas = @{ smanalyst=0; smorchestrator=4; smplanner=2; smproducer=1; smpublisher=0; smreviewer=0; smstrategist=0 }
        foreach ($profile in $expectedProfiles) {
            $delta = @($profileSkillNames[$profile] | Where-Object { $commonFromSource -notcontains $_ }).Count
            Assert-True ($delta -eq $expectedDeltas[$profile]) "Source unique delta for $profile is $delta, expected $($expectedDeltas[$profile])."
        }
    }
}

$roleSlugs = @('sm-orchestrator','strategist','planner','producer','reviewer','publisher','analyst')
foreach ($slug in $roleSlugs) {
    [void](Read-Text ".hermes\social\roles\$slug.md")
    $memory = Read-Text ".hermes\social\memory\$slug.md"
    [void](Read-Text ".hermes\social\evolution\$slug.md")
    $skillName = if ($slug -eq 'sm-orchestrator') { 'hermes-sm-orchestrator' } else { "hermes-sm-$slug" }
    $skill = Read-Text ".agents\skills\$skillName\SKILL.md"
    Assert-True ($memory -match '(?i)file-backed|file backed') "Role memory does not disclose file-backed semantics: $slug"
    Assert-True ($skill -match '(?ms)^---\s*\r?\nname:\s*' + [regex]::Escape($skillName) + '\s*\r?\ndescription:\s*\S.+?\r?\n---') "Invalid specialist skill frontmatter: $slug"
}

foreach ($slug in @('strategist','reviewer','publisher','analyst')) {
    $memory = Read-Text ".hermes\social\memory\$slug.md"
    Assert-True ($memory -match '(?is)no authored durable\s+memory') "Missing explicit empty source-memory marker: $slug"
}

foreach ($name in $expectedUnique) {
    $skill = Read-Text ".agents\skills\$name\SKILL.md"
    Assert-True ($skill -match '(?ms)^---\s*\r?\nname:\s*' + [regex]::Escape($name) + '\s*\r?\ndescription:\s*\S.+?\r?\n---') "Invalid adapted skill frontmatter: $name"
}
[void](Read-Text '.agents\skills\hermes-capability-router\SKILL.md')

$policy = Read-Text '.hermes\social\PROTOCOL.md'
foreach ($required in @('HERMES-MSG v1','PUBLISH_STATUS_UNKNOWN','gpt-5.6-luna','reasoning effort `high`','role non-authorities')) {
    Assert-True ($policy -match [regex]::Escape($required)) "Social protocol is missing: $required"
}

$runtimeParity = Read-Text '.hermes\social\RUNTIME_PARITY.md'
foreach ($required in @('Profile avatars','HERMES_HOME','Cron execution store','Self-improvement','External Finday canonical package')) {
    Assert-True ($runtimeParity -match [regex]::Escape($required)) "Runtime parity table is missing: $required"
}

$forbiddenTracked = @(
    '.env', 'auth.lock', 'state.db', 'projects.db', 'executions.db',
    'state.db-wal', 'state.db-shm', 'ROSTER.md', 'REGISTRY.md'
)
$tracked = @(& git -C $projectRoot ls-files)
foreach ($file in $tracked) {
    $leaf = Split-Path $file -Leaf
    Assert-True ($leaf -notin $forbiddenTracked) "Forbidden runtime/private file is tracked: $file"
}
Assert-True (-not @($tracked | Where-Object { $_ -match '(?i)(^|/)(logs?|cache|sessions?|runtime)(/|$)' })) 'A runtime directory is tracked.'

$candidatePaths = @(& git -C $projectRoot ls-files --cached --others --exclude-standard)
Assert-True ($LASTEXITCODE -eq 0) 'Could not enumerate Git-candidate authored files.'
$textExtensions = @('.md','.json','.ps1','.psm1','.py','.js','.mjs','.cjs','.ts','.tsx','.jsx','.yaml','.yml','.toml','.txt','.csv','.gitignore')
foreach ($relativePath in $candidatePaths) {
    $absolutePath = Join-Path $projectRoot $relativePath
    if (-not (Test-Path -LiteralPath $absolutePath -PathType Leaf)) { continue }
    $file = Get-Item -LiteralPath $absolutePath
    if (($file.Length -ge 2MB) -or (($file.Extension.ToLowerInvariant() -notin $textExtensions) -and ($file.Name -ne '.gitignore'))) { continue }
    $text = Get-Content -LiteralPath $absolutePath -Raw -ErrorAction SilentlyContinue
    if ($null -ne $text) {
        Assert-True ($text -notmatch '(?i)C:\\Users\\MEKARI\\AppData\\Local\\hermes\\profiles') "Machine-specific Hermes source path leaked: $relativePath"
        Assert-True ($text -notmatch '(?i)01[a-z0-9-]{20,}') "Native task ID leaked into a Git-candidate authored file: $relativePath"
    }
}

if ($RequireLiveRoster) {
    $rosterPath = Join-Path $projectRoot '.hermes\social\ROSTER.md'
    Assert-True (Test-Path -LiteralPath $rosterPath -PathType Leaf) 'Live social roster is missing.'
    if (Test-Path -LiteralPath $rosterPath -PathType Leaf) {
        $roster = Get-Content -LiteralPath $rosterPath -Raw
        $coreRoster = ($roster -split '(?m)^## Surge tasks\s*$')[0]
        $expectedRoster = [ordered]@{
            'SM Orchestrator' = 'Hermes SM · Orchestrator'
            'Strategist' = 'Hermes SM · Strategist'
            'Planner' = 'Hermes SM · Planner'
            'Producer' = 'Hermes SM · Producer'
            'Reviewer' = 'Hermes SM · Reviewer'
            'Publisher' = 'Hermes SM · Publisher'
            'Analyst' = 'Hermes SM · Analyst'
        }
        $ids = [System.Collections.Generic.List[string]]::new()
        foreach ($entry in $expectedRoster.GetEnumerator()) {
            $pattern = '(?m)^\| ' + [regex]::Escape($entry.Key) + ' \| `' + [regex]::Escape($entry.Value) + '` \| `(01[a-z0-9-]{20,})` \| `gpt-5\.6-luna` \| `high` \| read-only \| ready \|$'
            $matches = [regex]::Matches($coreRoster, $pattern)
            Assert-True ($matches.Count -eq 1) "Live roster row mismatch for $($entry.Key)."
            if ($matches.Count -eq 1) { $ids.Add($matches[0].Groups[1].Value) }
        }
        Assert-True ($ids.Count -eq 7) "Live roster task ID count is $($ids.Count), expected 7."
        Assert-True (($ids | Sort-Object -Unique).Count -eq 7) 'Live roster task IDs are not unique.'
        & git -C $projectRoot check-ignore --quiet '.hermes/social/ROSTER.md'
        Assert-True ($LASTEXITCODE -eq 0) 'Live social roster is not git-ignored.'
    }
}

if ($RequireCleanTrackedTree) {
    $status = @(& git -C $projectRoot status --short)
    Assert-True ($status.Count -eq 0) 'Tracked working tree is not clean.'
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Hermes social validation passed.'
Write-Output 'Profiles: 7; logical capabilities: 67 (60 common + 7 unique); physical common copies accounted: 420.'
Write-Output 'Runtime/private source state excluded; live task IDs remain ignored.'
