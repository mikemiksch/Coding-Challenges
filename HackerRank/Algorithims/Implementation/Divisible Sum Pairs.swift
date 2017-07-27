//You are given an array of n integers, a0, a1, ..., an-1, and a positive integer, k. Find and print the number of (i, j) pairs where i < j and ai + aj is divisible by k.
//
//Input Format
//
//The first line contains  space-separated integers,  and , respectively.
//The second line contains  space-separated integers describing the respective values of .
//
//Constraints
//
// * 2 <= n <= 100
// * 1 <= k <= 100
// * 1 <= ai <[ 100
//
//Output Format
//
//Print the number of (i, j) pairs where i < j and ai + aj is evenly divisible by k.
//
//Sample Input
//
// 6 3
// 1 3 2 6 1 2
//
//Sample Output
//
// 5
//
//Explanation
//
//Here are the  valid pairs:
//
// * (0, 2) -> a0 + a2 = 1 + 2 = 3
// * (0, 5) -> a0 + a5 = 1 + 2 = 3
// * (1, 3) -> a1 + a3 = 3 + 6 = 9
// * (2, 4) -> a2 + a4 = 2 + 1 = 3
// * (4, 5) -> a4 + a5 = 1 + 2 = 3
//

import Foundation

func divisibleSumPairs(divisor: Int, input: [Int]) -> Int {
    
    // Create a counter to keep track of how many matches we get
    var counter = 0
    
    // Create a pointer so we don't compare our current value to previous ones that it has already been compared against
    var pointer = 1
    
    // Store our last index as a variable instead of repeatdly writing count - 1
    let endIdx = input.count - 1
    
    // While our pointer is not a value outside our index range...
    while pointer <= endIdx {
        
        // For each element except the last one...
        for i in 0..<endIdx {
            
            // We compare it against each element in the range between our current pointer (starting one element ahead of the current one) and the final element.
            for j in pointer...endIdx {
                
                // If the sum of elements at positions i and j is evenly divisible by our divisor, we increment our counter by 1
                if (input[i] + input[j]) % divisor == 0 {
                    counter += 1
                }
            }
        // After an element is compared to all subsequent elements, we increment the pointer by 1
        pointer += 1
        }
    }
    
    // Return the value of our counter
    return counter
}

let nkValues = readLine()!.components(separatedBy: " ").map { Int($0)! }
let k = nkValues[1]
let input = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })


