//Consider two sets of positive integers, A = {a0, a1, ..., an-1} and B = {b0, b1, ..., bn-1}. We say that a positive integer, x, is between sets A and B if the following conditions are satisfied:
//
// 1. All elements in A are factors of x.
// 2. x is a factor of all elements in B.
//
//In other words, some x is between A and B if that value of x satisfies x mod ai = 0 for every ai in A and also satisfies bi mod x = 0 for every bi in B. For example, if  A = {2, 6} and B = {12}, then our possible x values are 6 and 12.
//
//Given A and B, find and print the number of integers (i.e., possible x's) that are between the two sets.
//
//Input Format
//
//The first line contains two space-separated integers describing the respective values of n (the number of elements in set A) and m (the number of elements in set B).
//The second line contains n distinct space-separated integers describing a0, a1, ..., an-1.
//The third line contains m distinct space-separated integers describing b0, b1, ..., bm-1.
//
//Constraints
//
// * 1 <= n, m <= 10
// * 1 <= ai <= 100
// * 1 <= bi <= 100
//
//Output Format
//
//Print the number of integers that are considered to be between A and B.
//
//Sample Input
//
// 2 3
// 2 4
// 16 32 96
//
//Sample Output
//
// 3
//
//Explanation
//
//There are three x values between A = {2,4} and B = {16,32,96}:
//
// * x = 4:
//   * All the elements in A evenly divide x = 4.
//   * x = 4 evenly divides all the elements in B.
//
// * x = 8:
//   * All the elements in A evenly divide x = 8.
//   * x = 8 evenly divides all the elements in B.
//
// * x = 16:
//   * All the elements in A evenly divide x = 16.
//   * x = 16 evenly divides all the elements in B.
//
//Thus, we print 3 as our answer.

import Foundation

func betweenTwoSets(setA: [Int], setB: [Int]) -> Int {
    // Save our array counts as variables rather than calculating it every time.
    let aCount = setA.count
    let bCount = setB.count
    
    // Variable to count integers that are between the sets
    var xCount = 0
    
    // Unwrapping optional values since one or both arrays could potentially be empty
    if let setAMin = setA.min(), let setBMin = setB.min(), let setAMax = setA.max(), let setBMax = setB.max() {
        
        // Determine the lower and upper bounds
        let lowerBound = min(setAMin, setBMin)
        let upperBound = max(setAMax, setBMax)
        
        // Iterate over each number in our range
        for i in lowerBound...upperBound {
            
            // Filter the arrays and count the number of elements
            let aFilterCount = setA.filter { i % $0 == 0 }.count
            let bFilterCount = setB.filter { $0 % i == 0 }.count

            // If the number of elements in our filtered arrays match our source, we increment the counter by one
            if aFilterCount == aCount && bFilterCount == bCount {
                xCount += 1
            }
        }
    }
    return xCount
}

// Get our inputs
let firstLine = readLine()!
let setA = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })
let setB = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })

