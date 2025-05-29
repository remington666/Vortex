$SysmonShare = "\\dc01\SYSVOL\irma.local\scripts\sysmon\Sysmon.exe"
$SysmonConfigShare = "\\dc01\SYSVOL\irma.local\scripts\sysmon\sysmonconfig.xml"


# Avant de poursuivre, on vérifie que le chemin vers l'exécutable est correct
if(Test-Path -Path $SysmonShare -PathType Leaf)
{
    # Chemin vers la clé de Registre de Sysmon (version 64 bits)
    $SysmonRegKey = "HKLM:\SYSTEM\CurrentControlSet\Services\Sysmon64"

    # Chemin vers le fichier exécutable de Sysmon64 via lecture du Registre
    $SysmonRegImagePath = (Get-ItemProperty -Path $SysmonRegKey -Name ImagePath -ErrorAction SilentlyContinue).ImagePath

    # Si $SysmonRegImagePath n'est pas nul, c'est que Sysmon est installé
    if ($SysmonRegImagePath)
    {
        Write-Output "Sysmon64 est déjà installé sur cette machine"

    }
    # Sinon, Sysmon doit être installé à partir de l'exécutable présent dans le partage
    else
    {
       Write-Output "Sysmon64 va être installé sur cette machine"
       & $SysmonShare -i -accepteula -c $SysmonConfigShare
    }
}