# collect_connections.ps1

$OutputDir = "output"

# Creates our output folder if it doesn't already exist
if (-not (Test-Path $OutputDir)){
    New-Item -ItemType Directory -Path $OutputDir
}

# Now we need to collect our net work connections and output them to our output directory as a csv file

Get-NetTCPConnection | Select-Object LocalAddress, RemoteAddress, State, OwningProcess | Sort-Object State -Descending | Export-Csv -Path "$OutputDir/connections.csv" -NoTypeInformation

# Confirm that we succedeed

Write-Host "Completed exporting connections"