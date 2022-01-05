$smbconfig = Get-SmbServerConfiguration

if(!($smbconfig.RequireSecuritySignature)) {
    write-host "Updating SMB Server Configuration" -ForegroundColor "Yellow"\
    Set-SmbServerConfiguration -RequireSecuritySignature $true -Confirm:$False
    write-host "SMB Signing set to Required" -ForegroundColor "Yellow"
}
else {
    write-host "SMB Server Confgiuration already requires signing" -ForegroundColor "Yellow"
}