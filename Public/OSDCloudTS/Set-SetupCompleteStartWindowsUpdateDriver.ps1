function Set-SetupCompleteStartWindowsUpdateDriver {

    $ScriptsPath = "C:\Windows\Setup\scripts"
    if (!(Test-Path -Path $ScriptsPath)){New-Item -Path $ScriptsPath} 

    $RunScript = @(@{ Script = "SetupComplete"; BatFile = 'SetupComplete.cmd'; ps1file = 'SetupComplete.ps1';Type = 'Setup'; Path = "$ScriptsPath"})
    $PSFilePath = "$($RunScript.Path)\$($RunScript.ps1File)"

    if (Test-Path -Path $PSFilePath){
        Add-Content -Path $PSFilePath "Write-Output 'Running Windows Update Drivers Function'"
        Add-Content -Path $PSFilePath "Start-WindowsUpdateDriver"
    }
    else {
    Write-Output "$PSFilePath - Not Found"
    }
}