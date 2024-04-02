<#
Given students' names along with the grade that they are in, create a roster for the school.

In the end, you should be able to:

Add a student's name to the roster for a grade
"Add Jim to grade 2."
"OK."
Get a list of all students enrolled in a grade
"Which students are in grade 2?"
"We've only got Jim just now."
Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
"Who all is enrolled in school right now?"
"Let me think. We have Anna, Barb, and Charlie in grade 1, Alex, Peter, and Zoe in grade 2 and Jim in grade 5. So the answer is: Anna, Barb, Charlie, Alex, Peter, Zoe and Jim"
Note that all our students only have one name (It's a small town, what do you want?) and each student cannot be added more than once to a grade or the roster. 
In fact, when a test attempts to add the same student more than once, your implementation should indicate that this is incorrect.
#>

$students_and_grade = @{

}

function InsertStudentWithGrade {
    param (
        [string]$student,
        [int]$grade
    )
    if(-not $students_and_grade.ContainsKey($student)){
        $students_and_grade[$student] = $grade
    } else{
        Write-Host "Error! Student name already in the DB"
    }
    
}

function GetStudentsFromGrade {
    param (
        [int]$grade
    )
    $res = @()

    foreach($student in $students_and_grade.Keys){
        if($students_and_grade[$student] -eq $grade){
            $res += $student
        }
    }
    return $res
}

function ShowAllStudents {
    foreach($student_in_grade in $students_and_grade.Keys){
        Write-Host $student_in_grade "in grade" $students_and_grade[$student_in_grade]
    }
}


do {
    $choice = Read-Host "What do you want to do?
    [1 to enter a new student
    2 to see students enrolled in a specific year
    3 to see all students enrolled
    4 EXIT]
    Your choice -->"


    if($choice -eq 1){
        do {
            $student_name = Read-Host "insert student name"
            do {
                $grade_num = Read-Host "insert student grade"
            } while ($grade_num -lt 1 -or $grade_num -gt 5)
            InsertStudentWithGrade $student_name $grade_num
            
            $continue = Read-Host "Do you want to insert another student? [0 for NO, 1 for YES]"
        } while ($continue -ne 0)
        
        

    } elseif ($choice -eq 2) {

        $year = Read-Host "Insert the year"
        $students = GetStudentsFromGrade $year

        foreach($elem in $students){
            Write-Host $elem
        }

    } elseif ($choice -eq 3) {

        ShowAllStudents

    }
} while ($choice -ne 4)
