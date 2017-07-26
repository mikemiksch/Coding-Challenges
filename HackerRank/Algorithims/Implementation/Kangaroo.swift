//There are two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity). The first kangaroo starts at location x1 and moves at a rate of v1 meters per jump. The second kangaroo starts at location x2 and moves at a rate of v2 meters per jump. Given the starting locations and movement rates for each kangaroo, can you determine if they'll ever land at the same location at the same time?
//
//Input Format
//
//A single line of four space-separated integers denoting the respective values of x1, v1, x2, and v2.
//
//Constraints
//
// * 0 <= x1 < x2 <= 10000
// * 1 <= v1 < 10000
// * 1 <= v2 < 10000
//
//Output Format
//
//Print YES if they can land on the same location at the same time; otherwise, print NO.
//
//Note: The two kangaroos must land at the same location after making the same number of jumps.
//
//Sample Input 0
//
// 0 3 4 2
//
//Sample Output 0
//
// YES
//
//Explanation 0
//
//The two kangaroos jump through the following sequence of locations:
// 1. 0 -> 3 -> 6 -> 9 -> 12
// 2. 4 -> 6 -> 8 -> 10 -> 12
//
//Thus, the kangaroos meet after 4 jumps and we print YES.
//
//Sample Input 1
//
// 0 2 5 3
//
//Sample Output 1
//
// NO
//
//Explanation 1
//
//The second kangaroo has a starting location that is ahead (further to the right) of the first kangaroo's starting location (i.e., x2 > x1). Because the second kangaroo moves at a faster rate (meaning v2 > v1 ) and is already ahead of the first kangaroo, the first kangaroo will never be able to catch up. Thus, we print NO.

import Foundation

func kangaroos(start1: Int, distance1: Int, start2: Int, distance2: Int) {
    
    // Instantiate our starting positions
    var kangaroo1Position = start1
    var kangaroo2Position = start2
    
    // Create a boolean to determine whether our while loop continues or not
    var stopLoop = false
    
    // As long as the boolean is false...
    while stopLoop == false {
        
        // If the positions are equal, print "YES" and stop the loop
        if kangaroo1Position == kangaroo2Position {
            print("YES")
            stopLoop = true
        }
        
        // If one position is ahead of the other and its distance is greater than or equal to the other's, we know they will never meet and print "NO"
        if (kangaroo1Position > kangaroo2Position && distance1 >= distance2) || (kangaroo2Position > kangaroo1Position && distance2 >= distance1) {
            print("NO")
            stopLoop = true
        }
        
        //If neither of the above conditions are satisfied, we increment the position by each kangaroo's distance.
        kangaroo1Position += distance1
        kangaroo2Position += distance2
    }
}


// Line reading extracting our x and v values from the input.
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let x1 = input[0]
let v1 = input[1]
let x2 = input[2]
let v2 = input[2]

