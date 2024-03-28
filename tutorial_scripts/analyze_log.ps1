<#
Create a PowerShell script that analyzes a log file and generates a report containing the following information:

- Total number of rows in the log file.
- Number of rows that contain an error or warning.
- List of errors and warnings in the log file, along with the number of occurrences for each.
#>

$file = "tutorial_scripts\files_for_tutorials\log_files\log_sample.log"

$log_content = Get-Content $file

$total_lines = $log_content.Count

$error_count = 0
$warning_count = 0

$occurrences = @{}

foreach($line in $log_content){

    if($line.ToLower() -match "errore"){
        $error_count++
        $occurrences["Error"]++
    } elseif ($line.ToLower() -match "avviso") {
        $warning_count++
        $occurrences["Warning"]++
    }
}

Write-Host "Total number of lines in log file: $total_lines"
Write-Host "Total number of error lines: $error_count"
Write-Host "Total number of warning lines: $warning_count"
Write-Host "Errors and Warnings counters:"

foreach ($item in $occurrences.Keys) {
    Write-Host "- $item : $($occurrences[$item])"

}