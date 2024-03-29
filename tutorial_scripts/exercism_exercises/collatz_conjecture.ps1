<#
The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.
#>

$number = Read-Host "Insert a number "

Function collatzConjecture([int]$number) {
    if($number -lt 1){
        Throw "Error: Only number > 0"
    }
    
    $steps = 0
    while ($number -gt 1) {
        if($number % 2 -eq 0){
            $number = $number / 2
            $steps++
        } else{
            $number = 3*$number + 1
            $steps++
        }
    }
    return $steps
}

$finalSteps = collatzConjecture $number
Write-Host $finalSteps