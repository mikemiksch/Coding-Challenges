//Given an array of integers, calculate which fraction of its elements are positive, which fraction of its elements are negative, and which fraction of its elements are zeroes, respectively. Print the decimal value of each fraction on a new line.
//
//Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of up to 10^-4 are acceptable.
//
//Input Format
//
//The first line contains an integer, N, denoting the size of the array.
//The second line contains N space-separated integers describing an array of numbers (a0, a1, a2,...,an-1).
//
//Output Format
//
//You must print the following  lines:
//
//1. A decimal representing of the fraction of positive numbers in the array compared to its size.
//2. A decimal representing of the fraction of negative numbers in the array compared to its size.
//3. A decimal representing of the fraction of zeroes in the array compared to its size.
//Sample Input
//
// 6
// -4 3 -9 0 4 1
//
//Sample Output
//
// 0.500000
// 0.333333
// 0.166667
//
//Explanation
//
//There are 3 positive numbers, 2 negative numbers, and 1 zero in the array.
//The respective fractions of positive numbers, negative numbers and zeroes are 3/6 = 0.5000000, 2/6 = 0.333333,  and 1/6 = 0.166667, respectively.

import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }


func plusMinus(_ input: [Int]) {
    
    // Given an array, filter it down to values equal to zero...
    let zeroes = Float(input.filter { $0 == 0 }.count)
    
    // ...values greater than zero...
    let positives = Float(input.filter { $0 > 0 }.count)
    
    // ...and number less than zero, and convert the count of each to a floating point value.
    let negatives = Float(input.filter { $0 < 0 }.count)
    
    // Convert the total length of the array to a floating point value
    let total = Float(input.count)
    
    // Print the fraction of each of positives, negatives, and zeroes on a separate line
    print(positives/total)
    print(negatives/total)
    print(zeroes/total)
}

plusMinus(arr)
