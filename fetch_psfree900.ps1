$url = "https://raw.githubusercontent.com/ciss84/PSFree900/main/index.html"
$output = "PSFree900_index.html"
try {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing
    $response.Content | Out-File -FilePath $output -Encoding UTF8
    Write-Host "Successfully downloaded to $output"
    Write-Host "File size: $((Get-Item $output).Length) bytes"
} catch {
    Write-Host "Error: $_"
}
