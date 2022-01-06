$path = "HKLM:\Software\Microsoft\Windows Nt\CurrentVersion\Winlogon"
$key = "CachedLogonsCount"
$type = "String"
$value = 0

$reg = Get-ItemProperty -Path  $path -Name $key -ErrorAction SilentlyContinue

if(!($reg)) {
    write-host "Key does not exist... Writing to Registry" -ForegroundColor "Yellow"
    New-ItemProperty -Path $path -Name $key -PropertyType $type -Value $value
    write-host "Key added to Registry" -ForegroundColor "Yellow"
} else {
    Write-Host "Registry value exists... Setting value to 0" -ForegroundColor Yellow
    Set-ItemProperty -Path $path -name $key -Value $value
    write-host "Value set to 0, Cached logon disabled" -ForegroundColor Yellow

}



$path = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
$key = "RestrictNullSessAccess"
$type = "DWORD"
$value = "1"
$Action = "Restrict Null Access"

$reg = Get-ItemProperty -Path  $path -Name $key -ErrorAction SilentlyContinue

if(!($reg)) {
    write-host "Key does not exist... Writing to Registry" -ForegroundColor "Yellow"
    New-ItemProperty -Path $path -Name $key -PropertyType $type -Value $value
    write-host "Key added to Registry" -ForegroundColor "Yellow"
} else {
    Write-Host "Registry value exists... Setting value to $value" -ForegroundColor Yellow
    Set-ItemProperty -Path $path -name $key -Value $value
    write-host "Value set to $value, $action" -ForegroundColor Yellow

}

$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$key = "NoDriveTypeAutoRun"
$type = "DWORD"
$value = "0xFF"
$Action = "Disable Explorer Autoplay"

$reg = Get-ItemProperty -Path  $path -Name $key -ErrorAction SilentlyContinue

if(!($reg)) {
    write-host "Key does not exist... Writing to Registry" -ForegroundColor "Yellow"
    New-ItemProperty -Path $path -Name $key -PropertyType $type -Value $value
    write-host "Key added to Registry" -ForegroundColor "Yellow"
} else {
    Write-Host "Registry value exists... Setting value to $value" -ForegroundColor Yellow
    Set-ItemProperty -Path $path -name $key -Value $value
    write-host "Value set to $value, $action" -ForegroundColor Yellow

}

if (!(Get-LocalUser guest -ErrorAction SilentlyContinue)) {
    write-host "Guest Account Already renamed" -ForegroundColor Yellow
} else {
    Rename-LocalUser guest -NewName azure_guest
    Write-Host "Guest Account has been renamed azure_guest" -ForegroundColor Yellow
}


$smbconfig = Get-SmbServerConfiguration

if(!($smbconfig.RequireSecuritySignature)) {
    write-host "Updating SMB Server Configuration" -ForegroundColor "Yellow"\
    Set-SmbServerConfiguration -RequireSecuritySignature $true -Confirm:$False
    write-host "SMB Signing set to Required" -ForegroundColor "Yellow"
} else {
    write-host "SMB Server Confgiuration already requires signing" -ForegroundColor "Yellow"
}





