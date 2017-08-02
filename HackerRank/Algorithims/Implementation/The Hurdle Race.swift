//Dan is playing a video game in which his character competes in a hurdle race by jumping over n hurdles with heights h0, h1, ..., hn-1. He can initially jump a maximum height of k units, but he has an unlimited supply of magic beverages that help him jump higher! Each time Dan drinks a magic beverage, the maximum height he can jump during the race increases by 1 unit.
//
//Given n, k, and the heights of all the hurdles, find and print the minimum number of magic beverages Dan must drink to complete the race.
//
//Input Format
//
//The first line contains two space-separated integers describing the respective values of n (the number of hurdles) and k (the maximum height he can jump without consuming any beverages).
//
//The second line contains n space-separated integers describing the respective values of h0, h1, ..., hn-1.
//
//Constraints
//
// * 1 <= n, k <= 100
// * 1 <= hi <= 100
//
//Output Format
//
//Print an integer denoting the minimum number of magic beverages Dan must drink to complete the hurdle race.
//
//Sample Input 0
//
// 5 4
// 1 6 3 5 2
//
//Sample Output 0
//
// 2
//
//Explanation 0
//
//Dan's character can jump a maximum of k = 4 units, but the tallest hurdle has a height of h1 = 6:

//
//    |
//    |     |
//    |     |
//    |  |  |
//    |  |  |  |
// |  |  |  |  |
// 1  6  3  5  2
//
//To be able to jump all the hurdles, Dan must drink 6 - 4 = 2 magic beverages.
//
//Sample Input 1
//
// 5 7
// 2 5 4 5 2
//
//Sample Output 1
//
// 0
//
//Explanation 1
//
//Dan's character can jump a maximum of k = 7 units, which is enough to cross all the hurdles:
//
//    |     |
//    |  |  |
//    |  |  |
// |  |  |  |  |
// |  |  |  |  |
// 2  5  4  5  2
//
//Because he can already jump all the hurdles, Dan needs to drink 0 magic beverages.

import Foundation


// No, really, this was the problem presented on HackerRank. You'd expect to see something like this in a tutorial for neophytes, or something.
//
// The way this problem is worded (and how the test cases were set up) where each magic drink increases the height he can jump for the duration of the race, we really only care about the difference between the highest hurdle and the k value compared to 0 and returning the higher number.
func theHurdleRace(hurdles: [Int], k: Int) -> Int {
    return max(hurdles.max()! - k, 0)
}


