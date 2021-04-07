param (
    [Parameter(Mandatory=$true)][string]$FilePath
)

$data = Import-Csv $FilePath

Write-Host ''
Write-Host 'Options:'

$records = @($data)
$rowId = 0

foreach ($row in $records) {
    $rowId++
    $title = $row.Title
    Write-Host $rowId': '$title
}

$in = Read-host 'Select an option'
try {
    $listItem = $records[$in-1]

    if ($listItem.ArgumentList) {
        Start-Process -FilePath $listItem.FilePath -ArgumentList $listItem.ArgumentList
    }
    else {
        Start-Process -FilePath $listItem.FilePath
    }
}
catch {
    Write-Host Bad input. Exiting...
    throw
}
