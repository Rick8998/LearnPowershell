<#
Your task is to implement a binary search algorithm.

A binary search algorithm finds an item in a list by repeatedly splitting it in half, only keeping the half which contains the item we're looking for. 
It allows us to quickly narrow down the possible locations of our item until we find it, or until we've eliminated all possible locations.

The algorithm looks like this:

- Find the middle element of a sorted list and compare it with the item we're looking for.
- If the middle element is our item, then we're done!
- If the middle element is greater than our item, we can eliminate that element and all the elements after it.
- If the middle element is less than our item, we can eliminate that element and all the elements before it.
- If every element of the list has been eliminated then the item is not in the list.
- Otherwise, repeat the process on the part of the list that has not been eliminated.
#>

Function sort_list($list){
    return $list | Sort-Object
}

Function binary_search($sorted_list, $searched_element){
    
    $list_half_index = [int](($sorted_list.length-1)/2)
    
    $first_half = $sorted_list[0..($list_half_index-1)]
    $second_half = $sorted_list[($list_half_index+1)..$sorted_list.Length]

    if($sorted_list[$list_half_index] -eq $searched_element){
        return 1
    } elseif(($sorted_list.Length -eq 1) -and (($sorted_list[$list_half_index] -gt $searched_element) -or ($sorted_list[$list_half_index] -lt $searched_element))) {
        return 0
    } elseif ($sorted_list[$list_half_index] -gt $searched_element) {
        binary_search $first_half  $searched_element
    } elseif ($sorted_list[$list_half_index] -lt $searched_element) {
        binary_search $second_half $searched_element
    } 
}

$list = @(23, 8, 16, 44, 66, 77, 4, 10, 1, 99, 165, 33, 444, 215, 77, 34, 56, 89, 100, 245, 38, 78, 92, 14, 70, 25, 301, 497, 203, 118, 2, 5, 75, 88, 90)

$search = 118

$sorted = sort_list($list)
Write-Host "List:" $sorted
Write-Host "Searched element: " $search
$is_found = binary_search $sorted $search
if($is_found -eq 1){
    Write-Host "Found! =)"
} else {
    Write-Host "Not Found =("
}