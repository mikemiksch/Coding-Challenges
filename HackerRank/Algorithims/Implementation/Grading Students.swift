//HackerLand University has the following grading policy:
//
// * Every student receives a grade in the inclusive range from 0 to 100.
// * Any grade less than 40 is a failing grade.
//
//Sam is a professor at the university and likes to round each student's grade according to these rules:
//
// * If the difference between the grade and the next multiple of 5 is less than 3, round  up to the next multiple of 5.
//
// * If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
//
//For example, grade = 84  will be rounded to 85, but grade = 29 will not be rounded because the rounding would result in a number that is less than 40.
//
//Given the initial value of grade for each of Sam's n students, write code to automate the rounding process. For each grade, round it according to the rules above and print the result on a new line.
//
//Input Format
//
//The first line contains a single integer denoting n (the number of students).
//Each line i of the n subsequent lines contains a single integer, grade, denoting student i's grade.
//
//Constraints
//
// * 1 <= n <= 60
// * 0 <= gradei <= 100
//
//Output Format
//
//For each grade of the n grades, print the rounded grade on a new line.
//
//Sample Input 0
//
// 4
// 73
// 67
// 38
// 33
//
//Sample Output 0
//
// 75
// 67
// 40
// 33
//
//Explanation 0
//
// 1. Student 1 received a 73, and the next multiple of 5 from 73 is 75. Since 75 - 73 < 3, the student's grade is rounded to 75.
//
// 2. Student 2 received a 67, and the next multiple of 5 from 67 is 70. Since 70 - 67 = 3, the grade will not be modified and the student's final grade is 67.
//
// 3. Student 3 received a 38, and the next multiple of 5 from 38 is 40. Since 40 - 38 < 3, the student's grade will be rounded to 40.
//
// 4. Student 4 received a grade below 38, so the grade will not be modified and the student's final grade is 33.


import Foundation

func gradingStudents(_ score: Int) -> Int {
    
    // Separate our digits since we are primarily concerned with the value of the second one
    var digits = String(score).characters.flatMap{Int(String($0))}
    
    // Since we're only rounding scores 38 and above, we don't need to evaluate anything less than that. Likewise, if the score is already 100, there's nothing to evaluate
    if score < 38 || score == 100 {
        return score
    } else {
        
        // We use range and news operators to see if our last digit is 8 or 9 rather than 
        // digits[1] == 8 || digits[1] == 9 or something of that nature.
        if 8...9 ~= digits[1] {
            
            // If the second digit is 8 or 9, the next multiple of 5 will end in 0
            digits[1] = 0
            
            // If the first digit of the number is 9, we need to change it to 10
            if digits[0] == 9 {
                digits[0] = 10
                
            // Otherwise we just add one to the value.
            } else {
                digits[0] = digits[0] + 1
            }
        // Again, use range and news operators to see if the last digit is either 3 or 4
        } else if 3...4 ~= digits[1] {
            
            // If it is, the next multiple of 5 ends with five
            digits[1] = 5
        }
        
        // For dealing with larger functions, we'd probably want to run a reduce method to concatenate the array of digits into an integer, but this is less work for two digits.
        return Int("\(digits[0])\(digits[1])")!
    }
}


// Typical line-reading stuff
let n = Int(readLine()!)
for _ in 0..<n {
    let score = Int(readLine()!)
    print(gradingStudents(score))
}
