//Lily has a chocolate bar consisting of a row of n squares where each square has an integer written on it. She wants to share it with Ron for his birthday, which falls on month m and day d. Lily wants to give Ron a piece of chocolate only if it contains m consecutive squares whose integers sum to d.
//
//Given m, d, and the sequence of integers written on each square of Lily's chocolate bar, how many different ways can Lily break off a piece of chocolate to give to Ron?
//
//For example, if m = 2, d = 3, and the chocolate bar contains n rows of squares with the integers [1,2,1,3,2] written on them from left to right, the following diagram shows two ways to break off a piece:
//
//  1 + 2 = 3
//   |--|
//  [1][2][1][3][2]
//      |--|
//     2 + 1 = 3
//
//Input Format
//
//The first line contains an integer denoting n (the number of squares in the chocolate bar).
//The second line contains n space-separated integers describing the respective values of s0, s1, ..., sn-1 (the numbers written on each consecutive square of chocolate).
//The third line contains two space-separated integers describing the respective values of d (Ron's birth day) and m (Ron's birth month).
//
//Constraints
//
// * 1 <= n <= 100
// * 1 <= si <= 5, where (0 <= i <= n)
// * 1 <= d <= 31
// * 1 <= m <= 12
//
//Output Format
//
//Print an integer denoting the total number of ways that Lily can give a piece of chocolate to Ron.
//
//Sample Input 0
//
// 5
// 1 2 1 3 2
// 3 2
//
//Sample Output 0
//
// 2
//
//Explanation 0
//
//This sample is already explained in the problem statement.
//
//Sample Input 1
//
// 6
// 1 1 1 1 1 1
// 3 2
//
//Sample Output 1
//
// 0
//
//Explanation 1
//
//Lily only wants to give Ron  consecutive squares of chocolate whose integers sum to . There are no possible pieces satisfying these constraints:
//
// [1][1][1][1][1][1]
//
//Thus, we print 0 as our answer.
//
//Sample Input 2
//
// 1
// 4
// 4 1
//
//Sample Output 2
//
// 1
//
//Explanation 2
//
//Lily only wants to give Ron  square of chocolate with an integer value of . Because the only square of chocolate in the bar satisfies this constraint, we print  as our answer.

import Foundation

// Function takes in an array of integers as our "bar," as well as the m and d values
func birthdayChocolate(bar: [Int], m: Int, d: Int) -> Int {
    
    // Create a counter to return later
    var counter = 0
    
    // We're only interested in looking at the array in chunks of size m, so we'll have a variable to define the start of our chunk
    var startIdx = 0
    
    // Another variable to define the end of our chunk
    var endIdx = m - 1
    
    // While the index defining the end of the chunk is less than the count of the array, we run our loop
    while endIdx < bar.count {
        
        // We make our chunk by making an array out of an array slice between our start and end indexes from our bar
        let chunk = Array(bar[startIdx...endIdx])
        
        // Reduce our array to get its sum
        let chunkSum = chunk.reduce(0, +)
        
        // Compare our sum against our d value and increment the counter if they match
        if chunkSum == d {
            counter += 1
        }
        
        // Increment our start and end indexes to move our chunk selection along the bar.
        startIdx += 1
        endIdx += 1
    }
    
    // Return how many matches we got when we reach the end of the bar.
    return counter
}

// Reading our input. Once again, we don't need the n value for this solution, but we do need the array of numbers representing our choclate bar, as well as extracting the individual values for m and d. Despite the wording of the problem usually talking about "m" before "d," the input is actually "d" before "m". 
let n = readLine()!
let bar = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })
let mdValues = readLine()!.components(separatedBy: " " ).map { Int($0)! }
let d = mdValues[0]
let m = mdValues[1]

print(birthdayChocolate(bar: bar, m: m, d: d))
