# collect_processes.ps1

$OutputDir = "output"

# Creates our output folder if it doesn't already exist
if (-not (Test-Path $OutputDir)){
    New-Item -ItemType Directory -Path $OutputDir
}

# Now we need to collect our processes and output them to our output directory as a csv file

Get-Process | Select-Object Name, Id, CPU, StartTime | Sort-Object CPU -Descending | Export-Csv -Path "$OutputDir/process.csv" -NoTypeInformation

# Confirm that we succedeed

Write-Host "Completed exporting processes"