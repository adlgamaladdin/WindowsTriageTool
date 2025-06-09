# collect_logins.ps1

$OutputDir = "output"

# Creates our output folder if it doesn't already exist
if (-not (Test-Path $OutputDir)){
    New-Item -ItemType Directory -Path $OutputDir
}

# Now we need to collect our recent events and filter by logins and output them to our output directory as a csv file

Get-WinEvent -FilterHashtable @{LogName='Security'; Id=@(4624,4625)} -MaxEvents 50 |
    Select-Object Id, TimeCreated, Message | Sort-Object TimeCreated -Descending |
    Export-Csv -Path "output/logins.csv" -NoTypeInformation
# Confirm that we succedeed

Write-Host "Completed exporting logins"
