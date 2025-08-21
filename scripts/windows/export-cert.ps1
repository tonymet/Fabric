# Export signing certificate into base64 encoded contents
$cert= Get-ChildItem -Path Cert:\CurrentUser\My | where-object  {$_.Subject -like "*fabric*"}
if ($cert -eq $null) {
    Write-Error "Signing certificate 'fabric-ca-cert' not found in LocalMachine\My store."
    exit 1
}

[System.Convert]::ToBase64String($cert.RawData)
