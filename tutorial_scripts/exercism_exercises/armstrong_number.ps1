<#
An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

For example:

9 is an Armstrong number, because 9 = 9^1 = 9
10 is not an Armstrong number, because 10 != 1^2 + 0^2 = 1
153 is an Armstrong number, because: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
154 is not an Armstrong number, because: 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190

Write some code to determine whether a number is an Armstrong number.
#>

$value_to_check = Read-Host "Insert value to check"

$value_to_string = $value_to_check.ToString().ToCharArray()
$value_length = $value_to_string.Length
$sum_exp = 0

foreach($elem in $value_to_string){
    $exp = [System.Math]::Pow([System.Int32]::Parse($elem), $value_length)
    $sum_exp += $exp
}

if($sum_exp -eq $value_to_check){
    Write-Host $value_to_check "is an armstrong number"
} else {
    Write-Host $value_to_check "is NOT an armstrong number"
}