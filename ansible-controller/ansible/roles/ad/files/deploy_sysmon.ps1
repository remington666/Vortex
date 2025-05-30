$GPOName = "Deploy_Sysmon_Task"
$OU = "DC=irma,DC=local"  # OU cible ou domaine
$XmlSourcePath = "\\dc01\SYSVOL\irma.local\scripts\sysmon\taskScheduled.xml"  # Fichier XML local
$GpoSysvolRelPath = "Machine\Preferences\ScheduledTasks\ScheduledTasks.xml"

# Créer la GPO si elle n'existe pas
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
}

# Lier la GPO à la cible
New-GPLink -Name $GPOName -Target $OU -Enforced:$false | Out-Null
Write-Host "🔗 GPO '$GPOName' liée à '$OU'"

# Copier le fichier XML dans le SYSVOL correspondant
$GPO = Get-GPO -Name $GPOName
$GPOGuid = $GPO.Id.Guid
$Domain = (Get-ADDomain).DNSRoot
$SysvolPath = "\\$Domain\SYSVOL\$Domain\Policies\{{$GPOGuid}}\$GpoSysvolRelPath"

# Créer les dossiers s'ils n'existent pas
$targetDir = Split-Path $SysvolPath
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

# Copier le fichier XML
Copy-Item -Path $XmlSourcePath -Destination $SysvolPath -Force
Write-Host "📄 Tâche planifiée XML copiée dans la GPO"

Write-Host "✅ Déploiement terminé. La tâche planifiée sera appliquée aux machines ciblées."
