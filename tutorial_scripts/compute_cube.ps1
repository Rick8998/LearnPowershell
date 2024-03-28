#create a PowerShell script that accepts an input from the user, calculates the cube of that number, and returns the result

$number = Read-Host "Insert a number"

$number = [int]$number

$cubed_num = $number * $number * $number

Write-Host "$number^3 = $cubed_num"