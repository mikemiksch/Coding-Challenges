//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
//Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
//
//Note: If the number is a multiple of both 3 and 5, only count it once.

import Foundation

func solution(_ num: Int) -> Int {
    
    // Start our sum at 0
    var sum = 0
    
    // For each number from 0 to under the number passed in as an argument...
    for i in 0..<num {
        
        // We evaluate if it's a multiple of 3 or 5. This catches numbers that are both, too.
        if i % 3 == 0 || i % 5 == 0 {
            
            // Increment our sum by the number that passes our criteria
            sum += i
        }
    }
    
    // Return our sum
    return sum
}
