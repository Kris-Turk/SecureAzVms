if (!(Get-LocalUser guest -ErrorAction SilentlyContinue)) {
    write-host "Guest Account Already renamed" -ForegroundColor Yellow
} else {
    Rename-LocalUser guest -NewName azure_guest
    Write-Host "Guest Account has been renamed azure_guest" -ForegroundColor Yellow
}





