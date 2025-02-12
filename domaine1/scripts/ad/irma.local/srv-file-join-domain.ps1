Install-WindowsFeature AD-Domain-Services,RSAT-AD-AdminCenter,RSAT-ADDS-Tools
Import-Module ADDSDeployment

Set-NetIPInterface -InterfaceAlias "Ethernet 2" -InterfaceMetric 10
Set-NetIPInterface -InterfaceAlias "Ethernet" -InterfaceMetric 50

Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses ("10.10.1.2")

$Domain = "irma.local"
$User = "Administrator@irma.local"
$Password = "Azertyuiop68."
$Cred = New-Object System.Management.Automation.PSCredential ($User, (ConvertTo-SecureString $Password -AsPlainText -Force))

Add-Computer -DomainName $Domain  -Credential $Cred  -Force
Restart-Computer
