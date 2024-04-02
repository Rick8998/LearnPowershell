<#
Your task is to convert a number into its corresponding raindrop sounds.

If a given number:

is divisible by 3, add "Pling" to the result.
is divisible by 5, add "Plang" to the result.
is divisible by 7, add "Plong" to the result.
is not divisible by 3, 5, or 7, the result should be the number as a string.
#>

$value = Read-Host "Insert a value"
$sound = ""
if($value % 3 -eq 0){
    $sound = $sound + "Pling"
}
if($value % 5 -eq 0){
    $sound = $sound + "Plang"
}
if($value % 7 -eq 0){
    $sound = $sound + "Plong"
}
#if ($sound.Length -eq 0) 
if(($value % 3 -ne 0) -and ($value % 5 -ne 0) -and ($value % 7 -ne 0)){
    $sound = $sound + [Convert]::ToString($value, 10)
}

Write-Host $sound