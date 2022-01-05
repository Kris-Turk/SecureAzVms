$path = "HKLM:\Software\Microsoft\Windows Nt\CurrentVersion\Winlogon"
$key = "CachedLogonsCount"
$type = "String"
$value = 0

$reg = Get-ItemProperty -Path  $path -Name $key -ErrorAction SilentlyContinue

if(!($reg)) {
    write-host "Key does not exist... Writing to Registry" -ForegroundColor "Yellow"
    New-ItemProperty -Path $path -Name $key -PropertyType $type -Value $value
    write-host "Key added to Registry" -ForegroundColor "Yellow"
}
else {
    Write-Host "Registry value exists... Setting value to 0" -ForegroundColor Yellow
    Set-ItemProperty -Path $path -name $key -Value $value
    write-host "Value set to 0, Cached logon disabled" -ForegroundColor Yellow

}



