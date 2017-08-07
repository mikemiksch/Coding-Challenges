//The Utopian Tree goes through 2 cycles of growth every year. Each spring, it doubles in height. Each summer, its height increases by 1 meter.
//
//Laura plants a Utopian Tree sapling with a height of 1 meter at the onset of spring. How tall will her tree be after N growth cycles?
//
//Input Format
//
//The first line contains an integer, T, the number of test cases.
//T subsequent lines each contain an integer, N, denoting the number of cycles for that test case.
//
//Constraints
//
// * 1 <= T <= 10
// * 0 <= N <= 60
//
//Output Format
//
//For each test case, print the height of the Utopian Tree after N cycles. Each height must be printed on a new line.
//
//Sample Input
//
// 3
// 0
// 1
// 4
//
//Sample Output
//
// 1
// 2
// 7
//
//Explanation
//
//There are 3 test cases.
//
//In the first case (N = 0), the initial height (H = 1) of the tree remains unchanged.
//
//In the second case (N = 1), the tree doubles in height and is 2 meters tall after the spring cycle.
//
//In the third case (N = 4), the tree doubles its height in spring (H = 2), then grows a meter in summer (H = 3), then doubles after the next spring (H = 6), and grows another meter after summer (H = 7). Thus, at the end of 4 cycles, its height is 7 meters.

import Foundation

// This is pretty easy to brute force, at the very least
func utopianTree(seasons: Int) -> Int {
    
    // As stated in our problem, we start with a height of 1
    var height = 1
    
    // If the seasons are more than zero...
    if seasons > 0 {
        
        // We iterate over the seasons
        for i in 1...seasons {
            
            // If they're odd, it's a "spring" season and the current height doubles
            if i % 2 == 1 {
                height = height * 2
                
            // If they're even, it's a "summer" season and the current height increases by 1
            } else if i % 2 == 0 {
                height += 1
            }
        }
    }
    
    // Return our height
    return height
}

// This can be done as an O(1) operation though. It could be a bitwise operation if we were feeling adventurous, but we're not feeling that adventurous. Thankfully, the math for this kind of thing is pretty well understood and easy to look up.
func utopianTreeO1(n: Int) -> Int {
    if n % 2 == 0 {
        
        // Swift doesn't like to perform pow() and return it as an integer without casting it as an NSDecimalNumber and converting that result, so we've got a bit of an extra step compared to some other solutions in other languages.
        // If even, our result is going to be equal to (2^(n/2)+1) - 1
        let result = NSDecimalNumber(decimal: pow(2, (n/2)+1))
        return Int(result) - 1
    } else {
        
        // If it's an odd number, our result is (2^((n+1)/2)+1) - 2
        
        // Sadly, while I can readily look up the equations here, I'm at a loss to explain why they are what they are. : ( 
        let result = NSDecimalNumber(decimal: pow(2, (((n+1)/2)+1)))
        return Int(result) - 2
    }
}
