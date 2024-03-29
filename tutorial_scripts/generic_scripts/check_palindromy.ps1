$string = Read-Host "Insert a string"

$formattedString = $string -replace "\s", ""
$formattedString = $formattedString.ToLower()

$invertedString = -join ($formattedString[-1..-($formattedString.Length)])

if ($formattedString -eq $invertedString) {
    Write-Host "The string is palindromic"
}else {
    Write-Host "The string is NOT palindromic"
}