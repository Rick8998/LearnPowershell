# create a PowerShell script that parses a specific directory and prints the total number of files contained in it and the total number of lines of text present in all text files.

$dir = "tutorial_scripts\files_for_tutorials"

$file_number = 0

$line_number = 0

$files = Get-ChildItem -Path $dir -File

foreach($file in $files){
    $file_number++
    if($file.Extension -eq ".txt"){
        $lines = Get-Content -Path $file.Fullname
        $line_number += $lines.Count
    }
}

Write-Host "Total number of files: $file_number"
Write-Host "Total number of lines of text: $line_number"