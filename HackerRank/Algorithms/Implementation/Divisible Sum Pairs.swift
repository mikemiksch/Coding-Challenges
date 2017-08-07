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
// * 1 <= ai <= 100
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

// This solution works with the constraints given, but is not optimal. An O(N) solution is possible.

func optimalDivisibleSumPairs(divisor: Int, input: [Int]) -> Int {
    
    // Again, we have a counter
    var count = 0
    
    // The idea behind this is that you can separate the elements into buckets depending on the mod value and count the matches. i.e. mod 3 == 0 will pair with other mod 3 == 0 elements, mod 3 == 1 will pair with mod 3 == 2 elements.
    
    // So here we make our array of the possible outcomes of % k
    var complements = Array(repeating: 0, count: divisor)
    
    // Now we just need to iterate through the array the one time.
    for i in input {
        
        // We calculate the remainder by modding i against our k value
        let remainder = (i % divisor)
        
        // Use that to calculate the complement
        let complement = (divisor - remainder) % divisor
        
        // i can be paired a number of values equal to the count of the remainder in our complements array.
        count += complements[remainder]
        
        // We then increment our complement value by 1
        complements[complement] += 1
    }
    
    return count
}




