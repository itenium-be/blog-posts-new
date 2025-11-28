$mdFiles = Get-ChildItem -Path . -Filter "*.md" -Recurse

foreach ($file in $mdFiles) {
    $content = Get-Content -Path $file.FullName -Raw

    Write-Host "Missing <!--block1--> files"
    if ($content -notmatch '<!--block1-->') {
        Write-Host $file.FullName
    }

    Write-Host ""
    Write-Host "Missing <!--more--> files"
    if ($content -notmatch '<!--more-->') {
        Write-Host $file.FullName
    }
}
