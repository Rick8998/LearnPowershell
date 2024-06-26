<#
Your task is to convert a number between 1 and 31 to a sequence of actions in the secret handshake.

The sequence of actions is chosen by looking at the rightmost five digits of the number once it's been converted to binary. Start at the right-most digit and move left.

The actions for each number place are:

00001 = wink
00010 = double blink
00100 = close your eyes
01000 = jump
10000 = Reverse the order of the operations in the secret handshake.
Let's use the number 9 as an example:

9 in binary is 1001.
The digit that is farthest to the right is 1, so the first action is wink.
Going left, the next digit is 0, so there is no double-blink.
Going left again, the next digit is 0, so you leave your eyes open.
Going left again, the next digit is 1, so you jump.

That was the last digit, so the final code is:
wink, jump

Given the number 26, which is 11010 in binary, we get the following actions:

double blink
jump
reverse actions

The secret handshake for 26 is therefore:
jump, double blink
#>


$value = Read-Host "Insert a value"

$binary_value = ([Convert]::ToString($value, 2))
$binary_value = $binary_value[-5..-1]
$binary_value_reverted = $binary_value[-1..-($binary_value.Length)]

$output = @()
for($i=0; $i -le $binary_value_reverted.Length; $i++){

    if($binary_value_reverted[$i]-eq "1" -and ($i -eq 0)){
        $output += "[wink]"
    } elseif($binary_value_reverted[$i]-eq "1" -and ($i -eq 1)){
        $output += "[double blink]"
    } elseif($binary_value_reverted[$i]-eq "1" -and ($i -eq 2)){
        $output += "[close your eyes]"
    } elseif($binary_value_reverted[$i]-eq "1" -and ($i -eq 3)){
        $output += "[jump]"
    } elseif($binary_value_reverted[$i]-eq "1" -and ($i -eq 4)){
        $output= $output[-1..-($output.Length)]
    }
}

Write-Host $output