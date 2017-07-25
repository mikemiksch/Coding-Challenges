//Given a square matrix of size N x N, calculate the absolute difference between the sums of its diagonals.
//
//Input Format
//
//The first line contains a single integer, N. The next N lines denote the matrix's rows, with each line containing space-separated integers describing the columns.
//
//Constraints
//
// * -100 <= Elements in the matrix <= 100
//
//Output Format
//
//Print the absolute difference between the two sums of the matrix's diagonals as a single integer.
//
//Sample Input
//
// 3
// 11 2 4
// 4 5 6
// 10 8 -12
//
//Sample Output
//
// 15
//
//Explanation
//
//The primary diagonal is:
//
// 11
//    5
//     -12
// Sum across the primary diagonal: 11 + 5 - 12 = 4
//
//The secondary diagonal is:
//
// 4
//   5
//     10
//Sum across the secondary diagonal: 4 + 5 + 10 = 19
//Difference: |4 - 19| = 15
//
//Note: |x| is absolute value function

import Foundation

// read the integer n
let n = Int(readLine()!)!

// declare 2d array
var arr: [[Int]] = []

// read array row-by-row
for _ in 0..<n {
    arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}


func diagonalDistance(_ input: [[Int]]) -> Int {
    // Create variables to store our running totals of both the primary and secondary diagonals
    var primary = Int()
    var secondary = Int()
    
    // Create variables to track our position in navigating the 2D array
    var primaryMarker = 0
    var secondaryMarker = input.count - 1
    
    // For each row in our array, add the values at the indices of our markers to the running totals
    for i in 0..<input.count {
        primary += input[i][primaryMarker]
        secondary += input[i][secondaryMarker]
        primaryMarker += 1
        secondaryMarker -= 1
    }
    
    // Return the absolute value of primary - secondary
    return abs(primary - secondary)
}

print(diagonalDistance(arr))
