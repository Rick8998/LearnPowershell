# create a PowerShell script that reads a text file, counts how many times each word appears in the text, and prints out the words with the number of occurrences

$file = "tutorial_scripts\files_for_tutorials\count_occurences.txt"

$file_content = Get-Content $file -Raw

$standardized_file_content = $file_content -replace '[^\w\s]', '' -split '\s+' | ForEach-Object { $_.ToLower() }

$count_word_occurrences = $standardized_file_content | Group-Object |Sort-Object Count -Descending

foreach ($word in $count_word_occurrences){
    Write-Host "$($word.Name) : $($word.Count)"
}