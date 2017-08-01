//Gary is an avid hiker. He tracks his hikes meticulously, paying close attention to small details like topography. During his last hike, he took exactly n steps. For every step he took, he noted if it was an uphill or a downhill step. Gary's hikes start and end at sea level. We define the following terms:
//
// * A mountain is a non-empty sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
//
// * A valley is a non-empty sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
//
//Given Gary's sequence of up and down steps during his last hike, find and print the number of valleys he walked through.
//
//Input Format
//
//The first line contains an integer, n, denoting the number of steps in Gary's hike.
//The second line contains a single string of n characters. Each character is E{U,D} (where U indicates a step up and D indicates a step down), and the ith character in the string describes Gary's ith step during the hike.
//
//Constraints
//
// * 2 <= N <= 10^6
//
//Output Format
//
//Print a single integer denoting the number of valleys Gary walked through during his hike.
//
//Sample Input
//
// 8
// UDDDUDUU
//
//Sample Output
//
// 1
//
//Explanation
//
// If we represent _ as sea level, a step up as /, and a step down as \, Gary's hike can be drawn as:
//
//_/\      _
//   \    /
//    \/\/
//
//It's clear that there is only one valley there, so we print  on a new line.

import Foundation

func countingValleys(input: String) -> Int {
    
    // Create variables to keep track of our valleys and the current elevation.
    var valleys = 0
    var elevation = 0
    
    // We separate our input string into characters and evaluate each one.
    for c in input.characters {
        
        // If c is a U, we increase our elevation by one.
        if c == "U" {
            elevation += 1
            
            // If incrementing the elevation by one results in zero, that means we've come out of a valley, so we increment our valley count by one.
            if elevation == 0 {
                valleys += 1
            }
            
        // Since the only other possible character with these constraints is that it will be D, our logic can just decrease our elevation by 1 if it's not a U.
        } else {
            elevation -= 1
        }
        
    }
    return valleys
}
