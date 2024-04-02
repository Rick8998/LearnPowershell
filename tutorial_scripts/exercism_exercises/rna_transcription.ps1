<#
Your task is determine the RNA complement of a given DNA sequence.

Both DNA and RNA strands are a sequence of nucleotides.

The four nucleotides found in DNA are adenine (A), cytosine (C), guanine (G) and thymine (T).

The four nucleotides found in RNA are adenine (A), cytosine (C), guanine (G) and uracil (U).

Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:

G -> C
C -> G
T -> A
A -> U
#>

$sequence = Read-Host "Insert DNA sequence"
$sequence = $sequence.ToCharArray()

$isValidSequence = $sequence -match "[^ACGT]"
if ($isValidSequence) {
    Write-Host "Invalid DNA sequence. Insert only A, C, G or T."
} else {
    for($i = 0; $i -lt $sequence.Length; $i++){
        if($sequence[$i] -eq "G"){
            $sequence[$i] = "C"
        } elseif($sequence[$i] -eq "C"){
            $sequence[$i] = "G"
        } elseif($sequence[$i] -eq "T"){
            $sequence[$i] = "A"
        } elseif($sequence[$i] -eq "A"){
            $sequence[$i] = "U"
        }
    }
}

$sequence -join ""