<# Create a PowerShell script that parses a specific directory and generates a report containing the following information for each file:
- File name
- File extension
- Size of the file in kilobytes (KB)
- Date and time the file was last modified 

In addition, the report should include the total number of files in the directory and the total size of all files in the directory in megabytes (MB).
#>

$dir = "tutorial_scripts\files_for_tutorials\bigger_files_script"

$files = Get-ChildItem -Path $dir -File

$fileNum = 0
$totalDim = 0

$report = "Files report in $dir : `n`n"

foreach($file in $files){
    $fileNum++
    $totalDim += $file.Length /1Kb

    $report += "Name: $($file.Name)`n"
    $report += "Type: $($file.Extension)`n"
    $report += "Dim (Kb): $($file.Length / 1Kb)`n"
    $report += "Lats modified: $($file.LastWriteTime)`n`n"
}

$report += "Total files number: $fileNum`n"
$report += "Total size (Kb): $totalDim`n"

Write-Host $report