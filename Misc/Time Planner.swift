//Time Planner
//
//Implement a function meetingPlanner that given the availability, slotsA and slotsB, of two people and a meeting duration dur, returns the earliest time slot that works for both of them and is of duration dur. If there is no common time slot that satisfies the duration requirement, return null.
//
//Time is given in a Unix format called Epoch, which is a nonnegative integer holding the number of seconds that have elapsed since 00:00:00 UTC, Thursday, 1 January 1970.
//
//Each person’s availability is represented by an array of pairs. Each pair is an epoch array of size two. The first epoch in a pair represents the start time of a slot. The second epoch is the end time of that slot. The input variable dur is a positive integer that represents the duration of a meeting in seconds. The output is also a pair represented by an epoch array of size two.
//
//In your implementation assume that the time slots in a person’s availability are disjointed, i.e, time slots in a person’s availability don’t overlap. Further assume that the slots are sorted by slots’ start time.
//
//Implement an efficient solution and analyze its time and space complexities.
//
//Examples:
//
//input:  slotsA = [[10, 50], [60, 120], [140, 210]]
//slotsB = [[0, 15], [60, 70]]
//dur = 8
//output: [60, 68]
//
//input:  slotsA = [[10, 50], [60, 120], [140, 210]]
//slotsB = [[0, 15], [60, 70]]
//dur = 12
//output: null # since there is no common slot whose duration is 12
//Constraints:
//
//[time limit] 5000ms
//
//[input] array.array.integer slotsA
//
//1 ≤ slotsA.length ≤ 100
//slotsA[i].length = 2
//[input] array.array.integer slotsB
//
//1 ≤ slotsB.length ≤ 100
//slotsB[i].length = 2
//[input] integer
//
//[output] array.integer

import Foundation


// Taking in two dimension arrays for availability and a duration time, we return an optional array of integers with the first available meeting time.
func meetingPlanner(availabilityA: [[Int]], availabilityB: [[Int]], duration: Int) -> [Int]? {
    
    // Create a variable to store our result and set its initial value as nil
    var result : [Int]? = nil
    
    // Create a pair of variables to track our index in the arrays as they are traversed
    var ia = 0
    var ib = 0
    
    // Both arrays are traversed at once: While our index is less than both the number of elements in both availability A and B...
    while ia < availabilityA.count && ib < availabilityB.count {
        
        // ...set our start time to the larger value between what is at index 0 at indicies ia and ib in our availability arrays
        let startTime = max(availabilityA[ia][0], availabilityB[ib][0])
        
        // Likewise, we set our end time to the smaller value between what is at index 1
        let endTime = min(availabilityA[ia][1], availabilityB[ib][1])
        
        
        // If our start time + our duration is less than or equal to our end time, we set our results equal to those values.
        if startTime + duration <= endTime {
            result = [startTime, startTime + duration]
        }
        
        // If the end time of availability A is less than that of B, we increment ia by 1 and compare against B again.
        if availabilityA[ia][1] < availabilityB[ib][1] {
            ia += 1
            
        // If the end time of availability B is less than that of A, we increment ib by 1 and compare to A again
        } else {
            ib += 1
        }
    }
    
    // Result is returned.
    return result
}
