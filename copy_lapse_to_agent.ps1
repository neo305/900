# Copy Lapse exploit files to "other Agent" location
# This script will copy the Lapse-related files once they are downloaded

$sourceDir = "c:\Users\Laz\Documents\GitHub\900"
$targetDir = "c:\Users\Laz\Documents\GitHub\900\agent_backup"

# Create target directory if it doesn't exist
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Write-Host "Created directory: $targetDir" -ForegroundColor Green
}

# Files to copy (Lapse exploit files)
$filesToCopy = @(
    "lapse.js",
    "psfree.js", 
    "loader.js",
    "psphive_index.html",
    "index.html"  # Current index.html
)

Write-Host "Copying Lapse files to agent backup..."
foreach ($file in $filesToCopy) {
    $sourcePath = Join-Path $sourceDir $file
    $targetPath = Join-Path $targetDir $file
    
    if (Test-Path $sourcePath) {
        try {
            Copy-Item -Path $sourcePath -Destination $targetPath -Force
            $size = (Get-Item $targetPath).Length
            Write-Host "✓ Copied $file ($size bytes)" -ForegroundColor Green
        } catch {
            Write-Host "✗ Failed to copy $file : $_" -ForegroundColor Red
        }
    } else {
        Write-Host "⚠ File not found: $file" -ForegroundColor Yellow
    }
}

Write-Host "`nCopy operation complete!"
Write-Host "Target directory: $targetDir"
