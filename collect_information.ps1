# collect_information.ps1

$OutputDir = "output"

# Creates our output folder if it doesn't already exist
if (-not (Test-Path $OutputDir)){
    New-Item -ItemType Directory -Path $OutputDir
}

# Now we need to collect our system information output them to our output directory as a csv file
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem

$systemProfile = [PSCustomObject]@{
    Hostname          = $env:COMPUTERNAME
    OS_Name           = $osInfo.Caption
    OS_Version        = $osInfo.Version
    CurrentUser       = [Environment]::UserName
    Uptime_Days       = ($osInfo.LocalDateTime - [datetime]$osInfo.LastBootUpTime).Days
    SystemBootTime    = $osInfo.LastBootUpTime
    TimeZone          = (Get-TimeZone).DisplayName
}

# Export to CSV
$systemProfile | Export-Csv -Path "output/system_profile.csv" -NoTypeInformation


# Confirm that we succedeed

Write-Host "Completed exporting connections"
