if (!(Get-LocalUser guest)) {
    write-host "Guest Account Already renamed" -ForegroundColor Yellow
}
else {
    Rename-LocalUser guest -NewName azure_guest
    Write-Host- "Guest user has been renamed azure_guest"
}

