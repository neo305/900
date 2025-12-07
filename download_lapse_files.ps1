# Download Lapse exploit files and psphive-lapse-2 index.html

$ErrorActionPreference = 'Continue'
$baseDir = "c:\Users\Laz\Documents\GitHub\900"

# PSFree900 files (Lapse exploit)
$psfreeFiles = @{
    "lapse.js" = "https://raw.githubusercontent.com/ciss84/PSFree900/main/lapse.js"
    "psfree.js" = "https://raw.githubusercontent.com/ciss84/PSFree900/main/psfree.js"
    "loader.js" = "https://raw.githubusercontent.com/ciss84/PSFree900/main/loader.js"
}

# psphive-lapse-2 files
$psphiveFiles = @{
    "psphive_index.html" = "https://raw.githubusercontent.com/neo305/psphive-lapse-2/main/index.html"
}

Write-Host "Downloading PSFree900 Lapse files..."
foreach ($file in $psfreeFiles.Keys) {
    try {
        $url = $psfreeFiles[$file]
        Write-Host "Downloading $file from $url"
        Invoke-WebRequest -Uri $url -OutFile "$baseDir\$file" -ErrorAction Stop
        Write-Host "✓ Successfully downloaded $file" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to download $file : $_" -ForegroundColor Red
    }
}

Write-Host "`nDownloading psphive-lapse-2 files..."
foreach ($file in $psphiveFiles.Keys) {
    try {
        $url = $psphiveFiles[$file]
        Write-Host "Downloading $file from $url"
        Invoke-WebRequest -Uri $url -OutFile "$baseDir\$file" -ErrorAction Stop
        Write-Host "✓ Successfully downloaded $file" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to download $file : $_" -ForegroundColor Red
    }
}

Write-Host "`nDownload complete. Checking files..."
Get-ChildItem -Path $baseDir -Filter "lapse.js","psfree.js","loader.js","psphive_index.html" -ErrorAction SilentlyContinue | 
    Select-Object Name, Length, LastWriteTime
