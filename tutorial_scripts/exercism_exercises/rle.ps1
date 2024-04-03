<#
Implement run-length encoding and decoding.

Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.

For example we can represent the original 53 characters with only 13.

"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.

"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"
For simplicity, you can assume that the unencoded string will only contain the letters A through Z (either lower or upper case) and whitespace. 
This way data to be encoded will never contain any numbers and numbers inside data to be decoded always represent the count for the following character.
#>

$string_to_encode = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
Write-Host "String:" $string_to_encode
Write-Host "Encoding..."
$string_to_ary = $string_to_encode.ToCharArray()

$encoded_string = ""

$count = 1

for($i = 1; $i -lt $string_to_ary.Length+1; $i++){
    $currentChar = $string_to_ary[$i]
    $previousChar = $string_to_ary[$i-1]

    if($currentChar -eq $previousChar){
        $count++
    } else {
        if($count -eq 1){
            $encoded_string += "$previousChar"
        }else{
            $encoded_string += "$count$previousChar"
            $count = 1
        }
    }    
}

Write-Host "Encoded string" $encoded_string
Write-Host " "
Write-Host "Decoding the encoded string..."

$output_string = ""
$currentNum
$index = 0
while ($index -lt $encoded_string.Length) {
    #$char = $encoded_string[$index]
    $count = ""

    while ($index -lt $encoded_string.Length -and [char]::IsDigit($encoded_string[$index])) {
        $count += $encoded_string[$index]
        $index++
    }
    $char = $encoded_string[$index]
    $count = [int]$count

    if($count -eq 0){
        $output_string += $char
    }else{
        for ($i = 0; $i -lt $count; $i++) {
            $output_string += $char
        }
    }
    
    $index++
}


Write-Host "Decoded string:" $output_string