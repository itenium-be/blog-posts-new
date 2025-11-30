# Script to deepen all markdown headers by one level
# Transforms # -> ##, ## -> ###, etc.
# Preserves code blocks (content between ``` delimiters)

param(
    [Parameter(Mandatory=$false)]
    [string]$Path = ".",

    [Parameter(Mandatory=$false)]
    [switch]$WhatIf
)

function Update-MarkdownHeaders {
    param(
        [string]$FilePath,
        [switch]$WhatIf
    )

    $content = Get-Content $FilePath -Raw
    $lines = Get-Content $FilePath
    $newLines = @()
    $inCodeBlock = $false

    foreach ($line in $lines) {
        # Check if we're entering/exiting a code block
        if ($line -match '^```') {
            $inCodeBlock = -not $inCodeBlock
            $newLines += $line
            continue
        }

        # If we're in a code block, don't modify the line
        if ($inCodeBlock) {
            $newLines += $line
            continue
        }

        # If it's a header line (starts with #), add one more #
        if ($line -match '^(#+)\s') {
            $newLine = $line -replace '^(#+)\s', '$1# '
            $newLines += $newLine
        } else {
            $newLines += $line
        }
    }

    if ($WhatIf) {
        Write-Host "Would update: $FilePath" -ForegroundColor Yellow
    } else {
        $newLines | Set-Content $FilePath -Encoding UTF8
        Write-Host "Updated: $FilePath" -ForegroundColor Green
    }
}

# Find all markdown files
$mdFiles = Get-ChildItem -Path $Path -Filter "*.md" -Recurse

Write-Host "Found $($mdFiles.Count) markdown files" -ForegroundColor Cyan
Write-Host ""

if ($WhatIf) {
    Write-Host "=== DRY RUN MODE ===" -ForegroundColor Yellow
    Write-Host ""
}

foreach ($file in $mdFiles) {
    Update-MarkdownHeaders -FilePath $file.FullName -WhatIf:$WhatIf
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Cyan
