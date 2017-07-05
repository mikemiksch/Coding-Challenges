//A prime is a natural number greater than 1 that has no positive divisors other than 1 and itself. Given p integers, determine the primality of each integer and print whether it is Prime or Not prime on a new line.
//
//Note: If possible, try to come up with an O(sqrt n) primality algorithm, or see what sort of optimizations you can come up with for an O(n) algorithm. Be sure to check out the Editorial after submitting your code!
//
//Input Format
//
//The first line contains an integer, p, denoting the number of integers to check for primality.
//    Each of the p subsequent lines contains an integer, n, you must test for primality.
//        
// Constraints
//
// * 1 <= p <= 30
// * 1 <= n <= 2 x 10^2
//        
//Output Format
//
//For each integer, print whether n is Prime or Not prime on a new line.
//
//Sample Input
//
// 3
// 12
// 5
// 7
//
//Sample Output
//
// Not prime
// Prime
// Prime
//
//Explanation
//
//We check the following p = 3 integers for primality:
//
//is divisible by numbers other than  and itself (i.e.: , , ), so we print Not prime on a new line.
//is only divisible  and itself, so we print Prime on a new line.
//is only divisible  and itself, so we print Prime on a new line.

import Foundation

// This solution is "Good" per the editorial on HackerRank, returning a solution after 23170 checks.

//func isPrime(_ n: Int) -> Bool {
//    
//    // Create a variable to store our result to be returned
//    var result : Bool
//    
//    // We only run this is the n passed through is greater than 3
//    if n > 3 {
//        
//        // We set the top range as the square root of our number
//        let topRange = Int(sqrt(Double(n)))
//        
//        // Our result is a Boolean evaluating whether or not any number between 2 and our topRange has a remainder of 0 when divided against n
//        result = !(2...topRange).contains { n % $0 == 0 }
//        
//    // If n is equal to two, it's prime.
//    } else if n == 2 {
//        result = true
//        
//    // All other instances (basically just "1") are not prime.
//    } else {
//        result = false
//    }
//    return result
//}



// This solution is "Best" per the editorial on HackerRank, returning a solution after 11584 checks, half as much. This is accomplished by only comparing n to odd numbers in the range, since any even number greater than 2 is divisible by 2 and therefore not prime.

func isPrime(_ n: Int) -> Bool {
    
    // We create our vairable and set our topRange as before
    var result = Bool()
    let topRange = Int(sqrt(Double(n)))
    
    // We set 2 as equal to true again
    if n == 2 {
        result = true
        
    // We set 1 as equal to false again, but we also include an "or" operand to handle a bitwise evaluation. If ANDing an integer by 1 results in 0, the number is even and we know it's not prime and don't evaluate it any further
    } else if n == 1 || (n & 1) == 0 {
        result = false
    } else {
    
        // We use the stride function to handle a for loop where we aren't simply incrementing by 1. By starting at 3 and incrementing by 2, we only evaluate odd numbers and skip half the range.
        for i in stride(from: 3, to: topRange, by: 2) {
            if n % i == 0 {
                result = false
            } else {
                result = true
            }
        }
    }
    return result
}


// Here we scan for input and print the results as required
let p = Int(readLine()!)!
for _ in 1...p {
    let n = Int(readLine()!)!
    if isPrime(n) == true {
        print("Prime")
    } else {
        print("Not prime")
    }
}
