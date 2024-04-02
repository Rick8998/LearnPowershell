<#
if you want to build something using a Raspberry Pi, you'll probably use resistors. For this exercise, you need to know two things about them:

Each resistor has a resistance value.
Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values. Each band has a position and a numeric value.

The first 2 bands of a resistor have a simple encoding scheme: each color maps to a single number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.

In this exercise you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take color names as input and output a two digit number, even if the input is more than two colors!

The band colors are encoded as follows:

Black: 0
Brown: 1
Red: 2
Orange: 3
Yellow: 4
Green: 5
Blue: 6
Violet: 7
Grey: 8
White: 9

From the example above: brown-green should return 15 brown-green-violet should return 15 too, ignoring the third color.
#>

# simple hashtable with color names as keys and color codes as values
$colors = [ordered]@{
    black = 0
    brown = 1
    red = 2
    orange = 3
    yellow = 4
    green = 5
    blue = 6
    violet = 7
    grey = 8
    white = 9
}

Function get_color_code($color_name){
    return $colors[$color_name]
}

function get_duo_code ($first_color, $second_color) {
    $first_color_code = get_color_code($first_color)
    $second_color_code = get_color_code($second_color)
    $first_string_code = $first_color_code.ToString()
    $second_string_code = $second_color_code.ToString()
    return $first_string_code + $second_string_code
}

Function band_colors(){
    return $colors.Keys
}

$color_names = band_colors
Write-Host "`n########### COLOR NAMES & CODES ###########"
foreach($color in $color_names){
    $color_code = get_color_code($color)
    Write-Host $color "->" $color_code
}
Write-Host "############################################`n"
$first_color = Read-Host "Insert first color name"
$second_color = Read-Host "Insert second color name"
$color_code = get_duo_code $first_color $second_color
Write-Host "Your color code is : $color_code"