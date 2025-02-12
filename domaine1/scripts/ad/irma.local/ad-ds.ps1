$safeModeAdminstratorPassword = ConvertTo-SecureString 'Azertyuiop68.' -AsPlainText -Force
Install-WindowsFeature AD-Domain-Services,RSAT-AD-AdminCenter,RSAT-ADDS-Tools

Import-Module ADDSDeployment

Install-ADDSforest  -CreateDNSDelegation:$false -DatabasePath "C:\Windows\NTDS" -DOmainMode "Win2012" -DOmainName "irma.local" -DOmainNetbiosName "IRMA" -ForestMode "Win2012" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -SafeModeAdministratorPassword $safeModeAdminstratorPassword -Force:$true