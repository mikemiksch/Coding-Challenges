//A flock of n birds is flying across the continent. Each bird has a type, and the different types are designated by the ID numbers 1, 2, 3, 4, and 5.
//
//Given an array of n integers where each integer describes the type of a bird in the flock, find and print the type number of the most common bird. If two or more types of birds are equally common, choose the type with the smallest ID number.
//
//Input Format
//
//The first line contains an integer denoting n (the number of birds).
//The second line contains n space-separated integers describing the respective type numbers of each bird in the flock.
//
//Constraints
//
// * 5 <= n <= 2 x 10^5
// * It is guaranteed that each type is 1, 2, 3, 4, or 5.
//
//Output Format
//
//Print the type number of the most common bird; if two or more types of birds are equally common, choose the type with the smallest ID number.
//
//Sample Input 0
//
// 6
// 1 4 4 4 5 3
//
//Sample Output 0
//
// 4
//
//Explanation 0
//
//The different types of birds occur in the following frequencies:
//
// * Type 1: 1 bird
// * Type 2: 0 birds
// * Type 3: 1 bird
// * Type 4: 3 birds
// * Type 5: 1 bird
//The type number that occurs at the highest frequency is type 4, so we print 4 as our answer.

import Foundation

func migratoryBirds(birdCount: [Int]) -> Int {
    
    // Since we are guaranteed that the type is going to be between 1 and 5, we can create an array with six spots (we won't be using index 0 in this)
    var counts = Array(repeating: 0, count: 6)
    
    // Super simple, for each element in the input, we increment the corresponding index in our counts array by one.
    for i in birdCount {
        counts[i] += 1
    }
    
    // We return the index of the maximum value in our counts array. It will always return the lesser index in the event of more than one element of equal value.
    return counts.index(of: counts.max()!)!
}

var n = readLine()!.components(separatedBy: " ").map { Int($0)! }
var birdCount = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })

