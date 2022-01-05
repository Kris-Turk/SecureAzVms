$scriptURI = 'https://raw.githubusercontent.com/Kris-Turk/SecureAzVms/main/disable-windowsAutoPlay.ps1'
$runCommandName = 'disable-windowsAutoPlay'



$vms = Get-AzVM | Select-Object ResourceGroupName,Name,Location

ForEach ($vm in $vms) {
    Set-AzVMRunCommand -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -RunCommandName $runCommandName -Location $vm.Location -SourceScriptURI $scriptURI
}


