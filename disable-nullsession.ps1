$path = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
$key = "RestrictNullSessAccess".ToLower()
$type = "DWORD"
$value = "1"
$Action = "Restrict Null Access"

$reg = Get-ItemProperty -Path  $path -Name $key -ErrorAction SilentlyContinue

if(!($reg)) {
    write-host "Key does not exist... Writing to Registry" -ForegroundColor "Yellow"
    New-ItemProperty -Path $path -Name $key -PropertyType $type -Value $value
    write-host "Key added to Registry" -ForegroundColor "Yellow"
}
else {
    Write-Host "Registry value exists... Setting value to $value" -ForegroundColor Yellow
    Set-ItemProperty -Path $path -name $key -Value $value
    write-host "Value set to $value, $action" -ForegroundColor Yellow

}