//A left rotation operation on an array of size n shifts each of the array's elements 1 unit to the left. For example, if 2 left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [3, 4, 5, 1, 2].
//
//Given an array of n  integers and a number, d, perform d left rotations on the array. Then print the updated array as a single line of space-separated integers.
//
//Input Format
//
//The first line contains two space-separated integers denoting the respective values of  (the number of integers) and  (the number of left rotations you must perform).
//The second line contains  space-separated integers describing the respective elements of the array's initial state.
//
//Constraints
//
//Output Format
//
//Print a single line of  space-separated integers denoting the final state of the array after performing  left rotations.
//
//Sample Input
//
//5 4
//1 2 3 4 5
//Sample Output
//
//5 1 2 3 4
//Explanation
//
//When we perform  left rotations, the array undergoes the following sequence of changes:
//
//Thus, we print the array's final state as a single line of space-separated values, which is 5 1 2 3 4.

import Foundation

// Function takes in an array of integers, and integer value to offset the rotation, and returns an array of integers.
func rotate(array: [Int], offset: Int) -> [Int] {
    
    // Store the maximum index number as a variable
    let maxIdx = array.count - 1
    
    // Instantiate a new array of integers to store results
    var shiftedArray = [Int]()
    
    // Set initial offset value equal to d
    var newOffset = offset
    
    // If d is greater than n, the offset is set to be the remainder of d/n
    if offset > array.count {
        newOffset = offset % array.count
    }
    
    // Starting at the index value equal to the newOffset value and ending at the last index value, append the number at that index in the input array to the output array
    for each in newOffset...maxIdx {
        shiftedArray.append(array[each])
    }
    
    // Go back to index 0 of the input array and proceed to the indexvalue of d-1 to append those numbers to the output array
    for each in 0...offset - 1 {
        shiftedArray.append(array[each])
    }
    
    // Returns our rotated array
    return shiftedArray
}

// This section prints the output as a string of space-separated integers after performing the rotations if the inputs are presented as given in the test conditions listed above.

// Force unwraps an optional line and maps objects separated by a space to a new array starting at index 0. This captures and stores our n and d values.
var input = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// The n value is not actually used in this solution. The d value is at index 1 of our input array.
var d = input[1]

// As above, this parses the second line of the input into the array to be rotated.
var parsedArray = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// Calls the rotate function, passes in our parsedArray and captured d value, then prints each value on a single line until it hits a " " (which does not exist in this particular array)
for each in rotate(array: parsedArray, offset: d) {
    print(each, terminator:" ")
}
