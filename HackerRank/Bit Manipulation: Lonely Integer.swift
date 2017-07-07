//Consider an array of n integers, A = [a0, a1,...,an-1], where all but one of the integers occur in pairs. In other words, every element in A occurs exactly twice except for one unique element.
//
//Given A, find and print the unique element.
//
//Input Format
//
//The first line contains a single integer, n, denoting the number of integers in the array.
//The second line contains n space-separated integers describing the respective values in A.
//
//Constraints
//
// * 1 <= n <= 100
// * It is guaranteed that n is an odd number.
// * 0 <= ai <= 100, where 0 <= i < n.
//
//Output Format
//
//Print the unique number that occurs only once in  on a new line.
//
//Sample Input 0
//
// 1
// 1
//
//Sample Output 0
//
// 1
//
//Explanation 0
//The array only contains a single 1, so we print 1 as our answer.
//
//Sample Input 1
//
// 3
// 1 1 2
//
//Sample Output 1
//
// 2
//
//Explanation 1
//We have two 1's and one 2. We print 2, because that's the only unique element in the array.
//
//Sample Input 2
//
// 5
// 0 0 1 2 1
//
//Sample Output 2
//
// 2
//
//Explanation 2
//We have two 0's, two 1's, and one 2. We print 2, because that's the only unique element in the array.

import Foundation

// Bit manipulation is not a strong suit of mine, but here we go:
func returnUnique(_ arr: [Int]) -> Int {
    
    // Create a variable to store our result
    var unique = Int()
    
    // For each element in our array, perform an xor operation against our Unique variable
    // 1. Any number xor'd with itself will give zero
    // 2. Any number xor'd with zero will give the number
    // 3. Our constraints tell us that there are is an odd number of elements in our array, and they will all have a paired number apart from one.
    // So if we xor all the numbers in the array together, then any which are the same will cancel out and give 0s as the result of the xors, which leaves the unique number xor'ing against 0 and returns the unique number as the answer
    for i in arr {
        unique ^= i
    }
    return unique
}

let n = readLine()!
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(returnUnique(input))
