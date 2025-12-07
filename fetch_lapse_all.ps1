# Download all Lapse exploit files and psphive-lapse-2 files

$files = @(
    @{url="https://raw.githubusercontent.com/ciss84/PSFree900/main/lapse.js"; output="lapse.js"},
    @{url="https://raw.githubusercontent.com/ciss84/PSFree900/main/psfree.js"; output="psfree.js"},
    @{url="https://raw.githubusercontent.com/ciss84/PSFree900/main/loader.js"; output="loader.js"},
    @{url="https://raw.githubusercontent.com/neo305/psphive-lapse-2/main/index.html"; output="psphive_index.html"}
)

foreach ($file in $files) {
    $url = $file.url
    $output = $file.output
    try {
        Write-Host "Downloading $output..."
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing
        $response.Content | Out-File -FilePath $output -Encoding UTF8
        $size = (Get-Item $output).Length
        Write-Host "Successfully downloaded $output ($size bytes)" -ForegroundColor Green
    } catch {
        Write-Host "Error downloading $output : $_" -ForegroundColor Red
    }
}

Write-Host "`nDownload complete!"
