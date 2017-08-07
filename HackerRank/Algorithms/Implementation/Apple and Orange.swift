//Sam's house has an apple tree and an orange tree that yield an abundance of fruit. In the diagram below, the red region denotes his house, where s is the start point and t is the end point. The apple tree is to the left of his house, and the orange tree is to its right. You can assume the trees are located on a single point, where the apple tree is at point a and the orange tree is at point b.
//
//     (   )                                                   (    )
//    ( O   )                                                 (   0  )
//   (       )                                               (        )
//  (      O  )                                             (          )
// (           )                                           (   0      0 )
//      | |                                                      | |
//      | |                                                      | |
//      | |         O               O           0                | |           0
//       a --------->       <-------------------->                b
//             d            s                    t
//
//When a fruit falls from its tree, it lands d units of distance from its tree of origin along the x-axis. A negative value of d means the fruit fell d units to the tree's left, and a positive value of d means it falls d units to the tree's right.
//
//Given the value of d for m apples and n oranges, can you determine how many apples and oranges will fall on Sam's house (i.e., in the inclusive range [s,t] )? Print the number of apples that fall on Sam's house as your first line of output, then print the number of oranges that fall on Sam's house as your second line of output.
//
//Input Format
//
// The first line contains two space-separated integers denoting the respective values of s and t.
//
// The second line contains two space-separated integers denoting the respective values of a and b.
//
// The third line contains two space-separated integers denoting the respective values of m and n.
//
// The fourth line contains m space-separated integers denoting the respective distances that each apple falls from point a.
//
// The fifth line contains n space-separated integers denoting the respective distances that each orange falls from point b.
//
//Constraints
//
// * 1 <= s, t, a, b, m, n <= 10^5
//
// * -10^5 <= d <= 10^5
//
// * a < s < t <b
//
//Output Format
//
//Print two lines of output:
//
// 1. On the first line, print the number of apples that fall on Sam's house.
// 2. On the second line, print the number of oranges that fall on Sam's house.
//
//Sample Input 0
//
// 7 11
// 5 15
// 3 2
// -2 2 1
// 5 -6
//
//Sample Output 0
//
// 1
// 1
//
//Explanation 0
//
// The first apple falls at position 5 - 2 = 3.
// The second apple falls at position 5 + 2 = 7.
// The third apple falls at position 5 + 1 = 6.
// The first orange falls at position 15 + 5 = 20.
// The second orange falls at position 15 - 6 = 9.
// Only one fruit (the second apple) falls within the region between 7 and 11, so we print  1 as our first line of output.
// Only the second orange falls within the region between 7 and 11, so we print 1 as our second line of output.

import Foundation

func applesAndOranges(a: Int, b: Int, s: Int, t: Int, apples: [Int], oranges: [Int]) {
    
    // Going to create variables to keep a running tally of apples and oranges landing on Sam's roof
    var applesOnRoof = 0
    var orangesOnRoof = 0
    
    // We're going to traverse our two arrays at the same time, so we create a couple variables to track the index number
    var iA = 0
    var iO = 0
    
    // While both index numbers are less than the counts of both arrays...
    while iA < apples.count && iO < oranges.count {
        
        // If the resulting of adding the distance the apple fell from the tree to the position of the tree is within the boundaries of Sam's room, we increment our applesOnRoof counter by one
        if s...t ~= apples[iA] + a {
            applesOnRoof += 1
        }
        
        // Same thing with the oranges
        if s...t ~= oranges[iO] + b {
            orangesOnRoof += 1
        }
        
        // Regardless of the result, we increment our index by 1
        iA += 1
        iO += 1
    }
    
    // If we have more apples than oranges, it keeps going when the conditions of the above while statement are no longer applicable.
    while iA < apples.count {
        if s...t ~= apples[iA] + a {
            applesOnRoof += 1
        }
        iA += 1
    }
    
    
    // Same thing if we have more oranges than apples.
    while iO < oranges.count {
        if s...t ~= oranges[iO] + b {
            orangesOnRoof += 1
        }
        iO += 1
    }
    
    // Print our totals on separate lines.
    print(applesOnRoof)
    print(orangesOnRoof)
}


// Standard line reading stuff. Of note, we don't actually need the values of m and n in this implementation.
let stValues = readLine()!.components(separatedBy: " ").map { Int($0)! }
let s = stValues[0]
let t = stValues[1]
let abValues = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = abValues[0]
let b = abValues[1]
let mnValues = readLine()!.components(separatedBy: " ").map { Int($0)! }
let m = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })
let n = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })


