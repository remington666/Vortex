# Chemin vers le fichier à modifier
$fichier = "C:\Program Files (x86)\ossec-agent\ossec.conf"

# Lire tout le contenu du fichier
$contenu = Get-Content -Path $fichier

# Trouver l'index de la ligne contenant </client_buffer>
$index = ($contenu | Select-String "</client_buffer>").LineNumber

# Vérification que la ligne a bien été trouvée
if ($index) {
    # Séparer le contenu avant et après cette ligne
    $avant = $contenu[0..($index - 1)]
    $apres = $contenu[$index..($contenu.Length - 1)]

    # Bloc à insérer
    $bloc = @"
  <localfile>
    <location>Microsoft-Windows-Windows Defender/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>
  <localfile>
    <location>Microsoft-Windows-Sysmon/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>
  <localfile>
    <location>Microsoft-Windows-Powershell/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Journaux de sécurité et authentification -->
  <localfile>
    <location>Microsoft-Windows-LSA/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-NTLM/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Activité PowerShell & WMI -->
  <localfile>
    <location>Microsoft-Windows-WMI-Activity/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Activité des tâches planifiées -->
  <localfile>
    <location>Microsoft-Windows-TaskScheduler/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Réseau -->
  <localfile>
    <location>Microsoft-Windows-NetworkProfile/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-VPN-Client/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-Wired-AutoConfig/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-WLAN-AutoConfig/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Journaux SMB -->
  <localfile>
    <location>Microsoft-Windows-SMBClient/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-SMBClient/Security</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-SMBServer/Audit</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-SMBServer/Security</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Journaux système & pilotes -->
  <localfile>
    <location>Microsoft-Windows-Kernel-PnP/Configuration</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-DriverFrameworks-UserMode/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-CodeIntegrity/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-DeviceGuard/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- IIS & impression -->
  <localfile>
    <location>Microsoft-IIS-Configuration/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-PrintService/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Windows Update & Firewall -->
  <localfile>
    <location>Microsoft-Windows-WindowsUpdateClient/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-Windows Firewall With Advanced Security/Firewall</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <!-- Autres utiles -->
  <localfile>
    <location>Microsoft-Windows-CAPI2/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-Application-Experience/Program-Inventory</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-Bits-Client/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

  <localfile>
    <location>Microsoft-Windows-Win32k/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>
"@ 

    # Fusionner le tout
    $nouveauContenu = $avant + $bloc + $apres

    # Réécrire le fichier
    $nouveauContenu | Set-Content -Path $fichier -Encoding UTF8

    Write-Host "Bloc ajouté avec succès après </client_buffer>."
} else {
    Write-Host "La ligne </client_buffer> n'a pas été trouvée."
}
