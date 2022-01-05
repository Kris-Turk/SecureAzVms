

$vms = Get-AzVM | Select-Object ResourceGroupName,Name,Location

ForEach ($vm in $vms) {
    Set-AzVMRunCommand -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -RunCommandName "RenameGuestAccount" -Location $vm.Location -SourceScriptURI 'https://raw.githubusercontent.com/Kris-Turk/SecureAzVms/main/rename-guestaccount.ps1'
}

ForEach ($vm in $vms) {
    Set-AzVMRunCommand -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -RunCommandName "RequireSMBSigning" -Location $vm.Location -SourceScriptURI 'https://raw.githubusercontent.com/Kris-Turk/SecureAzVms/main/require-smbSigning.ps1'
}

