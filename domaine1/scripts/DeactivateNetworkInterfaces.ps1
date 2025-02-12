Get-NetIPInterface | Where-Object { $_.Dhcp -eq "Enabled" -and $_.AddressFamily -eq "IPv4" } | ForEach-Object {
    $adapter = Get-NetAdapter -Name $_.InterfaceAlias
    Disable-NetAdapter -Name $adapter.Name -Confirm:$false
}
