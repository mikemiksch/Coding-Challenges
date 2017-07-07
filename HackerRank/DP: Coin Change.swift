//Given a number of dollars, n, and a list of dollar values for m distinct coins, C = {c0, c1, c2,...,cm-1}, find and print the number of different ways you can make change for n dollars if each coin is available in an infinite quantity.
//
//Hints:
//
// * You can solve this problem recursively, but you must optimize your solution to eliminate overlapping subproblems using Dynamic Programming if you wish to pass all test cases. More specifically, think of ways to store the checked solutions and use the stored values to avoid repeatedly calculating the same values.
//
// * Think about the degenerate cases:
//      * How many ways can you make change for 0 dollars?
//      * How many ways can you make change for less than 0 dollars if you have no coins?
// * If you are having trouble defining the storage for your precomputed values, then think about it in terms of the base case (n = 0).
//
//Input Format
//
//The first line contain two space-separated integers describing the respective values of n and m.
//The second line contains m space-separated integers describing the respective values of c0, c1,..., cm-1, where each integer denotes the dollar value of a distinct coin available in an infinite quantity.
//
//Constraints
//
// * 1 <= ci <= 50
// * 1 <= n <= 250
// * 1 <= m <= 50
// * The list of coins contains  distinct integers where each integer denotes the dollar value of a coin available in an infinite quantity.
//
//Output Format
//
//Print a single integer denoting the number of ways we can make change for n dollars using an infinite supply of our m types of coins.
//
//Sample Input 0
//
// 4 3
// 1 2 3
//
//Sample Output 0
//
// 4
//
//Explanation 0
//For n = 4 and C = {1,2,3} there are four solutions:
//
// 1. {1,1,1,1}
// 2. {1,1,2}
// 3. {2,2}
// 4. {1,3}
//
//Thus, we print 4 on a new line.
//
//Sample Input 1
//
// 10 4
// 2 5 3 6
//
//Sample Output 1
//
//5
//
//Explanation 1
//For n = 10 and C = {2,5,3,6} there are five solutions:
//
// 1. {2,2,2,2,2}
// 2. {2,2,3,3}
// 3. {2,2,6}
// 4. {2,3,5}
// 5. {5,5}
//
//Thus, we print 5 on a new line.

import Foundation

// There were a bunch of solutions on HackerRank that were considerably less complicated than this, but I was unsuccessful in translating them to Swift (I wasn't able to tackle this on my own, sadly). I'll attempt to break down what's happening here, but it may be overly complicated...

func makeChange(_ n: Int, _ coins: [Int]) -> Int {
    
    // The big difference between this and more conventional solutions I've seen is that we're utilizing a 2D array. We have an aray equal to coins.count + 1, and each element is an array of length n + 1, all elements in that set to 0
    var solution = Array(repeatElement(Array(repeatElement(0, count: n + 1)), count: coins.count + 1))
    
    // Loop through all our first level arrays and set their index 0 equal to 1
    for i in 0...coins.count {
        solution[i][0] = 1
    }
    
    // For each number between 1 and the length of our coins array...
    for i in 1...coins.count {
        
        // Loop through the array elements for each number between 1 and our n value.
        for j in 1...n {
            
            // If the value at index i - 1 of the coins array is less than the current value of j...
            if coins[i - 1] <= j {
                
                // The value at matrix cooridnates i, j is equal to the sum of the values at i - 1, j, and i, j - coins[i - 1].
                solution[i][j] = solution[i - 1][j] + solution[i][j - coins[i - 1]]
                
            // Otherwise it's equal to the value of solution[i - 1][j]
            } else {
                solution[i][j] = solution[i - 1][j]
            }
        }
    }
    
    // The value at solution coordinates equal to the length of our coins array and number of dollars
    return solution[coins.count][n]
}

// This is a solution that works, but I will freely admit that I don't fully understand what is happening, as the introduction to another dimension to the array relative to previous uses of recursion complicates things greatly for me.

// Standard read input stuff
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]
let coins = Array(readLine()!.components(separatedBy: " ").map { Int ($0)! })
print(makeChange(n, coins))

