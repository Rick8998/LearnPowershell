# create a PowerShell script that parses a specific directory and identifies the five largest files within it, showing the file name and its size in megabytes

$dir = "tutorial_scripts\files_for_tutorials\bigger_files_script"

$files = Get-ChildItem -Path $dir -File | Sort-Object Length -Descending

$topFiles = $files | Select-Object -First 5

Write-Host "Top 5 bigger files"
foreach($file in $topFiles){
    $sizeInMB = [math]::Round($file.Length / 1Kb, 2)
    Write-Host "$($file.Name) - Dim: $($sizeInMB) Kb"
}