//The Fibonacci sequence begins with fibonacci(0) = 0 and fibonacci(1) = 1 as its respective first and second terms. After these first two elements, each subsequent element is equal to the sum of the previous two elements.
//
//Here is the basic information you need to calculate fibonnaci(n):
//
//  * fibonacci(0) = 0
//  * fibonacci(1) = 1
//  * fibonacci(n) = fibonacci(n - 1) + fibonacci(n - 2)
//
//Task
//Given n, complete the fibonacci function so it returns fibonacci(n).
//
//Input Format
//
//Locked stub code in the editor reads a single integer denoting the value of n and passes it to the fibonacci function.
//
//Constraints
//
//  * 0 < n < 40
//
//Output Format
//
//Locked stub code in the editor prints the value of fibonacci(n) returned by the fibonacci function.
//
//Sample Input
//
// 3
//
//Sample Output
//
// 2
//
//Explanation
//
//Consider the Fibonacci sequence:
//
// fibonacci(0) = 0
// fibonacci(1) = 1
// fibonacci(2) = (0 + 1) = 1
// fibonacci(3) = (1 + 1) = 2
// fibonacci(4) = (1 + 2) = 3
// fibonacci(5) = (2 + 3) = 5
// fibonacci(6) = (3 + 5) = 8
//...
//
//We want to know the value of fibonacci(3). If we look at the sequence above, fibonacci(3) evaluates to 2. Thus, we print 2 as our answer.


import Foundation

// Very simple recursion function
func fibonacci (n: Int) -> Int {
    
    // Create a variable to store our result to be returned
    var result = Int()
    
    // If n == 0, we set the result to 0
    if n == 0 {
        result = 0
        
    // If n == 1, we set the result to 1. These are our seed numbers.
    } else if n == 1 {
        result = 1
        
    // If n != 1 or 0, result is equal to the sum of running the function on n-1 and n-2, which will go through recursion until it hits 1 and 0, at which point it hits our seed numbers and goes no further.
    } else {
        result = fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }
    return result
}


// read the integer n
let n = Int(readLine()!)!

// print the nth fibonacci number
print(fibonacci(n: n))


