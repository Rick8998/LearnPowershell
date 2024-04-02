<#
Take a nested list and return a single flattened list with all values except nil/null.

The challenge is to write a function that accepts an arbitrarily-deep nested list-like structure and returns a flattened structure without any nil/null values.

For example:

input: [1,[2,3,null,4],[null],5]

output: [1,2,3,4,5]
#>

Function flatten_array{
    [CmdletBinding()]
    param (
        [Parameter()]
        [object[]] $array
    )

    $flatten_ary_with_null = @($array | ForEach-Object {$_})
    $newArray = @()
    foreach ($currentItem in $flatten_ary_with_null) {
        if($null -ne $currentItem){
            $newArray = $newArray + $currentItem
        }
    }
    return $newArray
}

$ary = @(1, $null, 2, 3, $null, $null, 8, @(5, $null, 9), @($null), 10)
$flattened_ary = flatten_array $ary
foreach ($elem in $flattened_ary) {
    Write-Host $elem
}