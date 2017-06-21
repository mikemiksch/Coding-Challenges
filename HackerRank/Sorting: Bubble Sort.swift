//Consider the following version of Bubble Sort:
//    
//    for (int i = 0; i < n; i++) {
//        // Track number of elements swapped during a single array traversal
//        int numberOfSwaps = 0;
//        
//        for (int j = 0; j < n - 1; j++) {
//            // Swap adjacent elements if they are in decreasing order
//            if (a[j] > a[j + 1]) {
//                swap(a[j], a[j + 1]);
//                numberOfSwaps++;
//            }
//        }
//        
//        // If no elements were swapped during a traversal, array is sorted
//        if (numberOfSwaps == 0) {
//            break;
//        }
//}
//
//Task
//Given an n-element array, A = a0,a1,...,a-1, of distinct elements, sort array A in ascending order using the Bubble Sort algorithm above. Once sorted, print the following three lines:
//
//Array is sorted in numSwaps swaps., where numSwaps is the number of swaps that took place.
//First Element: firstElement, where firstElement is the first element in the sorted array.
//Last Element: lastElement, where lastElement is the last element in the sorted array.
//
//Hint: To complete this challenge, you must add a variable that keeps a running tally of all swaps that occur during execution.
//
//Input Format
//
//The first line contains an integer, n, denoting the number of elements in array A.
//The second line contains n space-separated integers describing the respective values of a0,a1,...,an-1.
//
//Constraints
//
// * 2 <= n <= 600
// * 1 <= ai <= 2 x 10^6, viE[0, n-10
//
//Output Format
//
//You must print the following three lines of output:
//
//Array is sorted in numSwaps swaps., where numSwaps is the number of swaps that took place.
//First Element: firstElement, where firstElement is the first element in the sorted array.
//Last Element: lastElement, where lastElement is the last element in the sorted array.
//
//Sample Input 0
//
//3
//1 2 3
//
//Sample Output 0
//
//Array is sorted in 0 swaps.
//First Element: 1
//Last Element: 3
//
//Explanation 0
//The array is already sorted, so 0 swaps take place and we print the necessary three lines of output shown above.
//
//Sample Input 1
//
//3
//3 2 1
//
//Sample Output 1
//
//Array is sorted in 3 swaps.
//First Element: 1
//Last Element: 3
//
//Explanation 1
//The array is not sorted, and its initial values are: {3,2,1}. The following 3 swaps take place:
//
// 1. {3,2,1} -> {2,3,1}
// 2. {2,3,1} -> {2,1,3}
// 3. {2,1,3} -> {1,2,3}
//
//At this point the array is sorted and we print the necessary three lines of output shown above.

import Foundation

// Oh hey, they provided the readLine code for a change...

// read the integer n
let n = Int(readLine()!)!

// read the array
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// This is an odd challenge. 90% of the code is given to you in the outset, and the solution it wants is horribly inefficient for actually sorting anything, but it is what it is.

// We have a function we pass our array into as an argument.
func bubbleSort(array: [Int]) {
    
    // Create a mutable copy of our argument
    var mutatingArray = array
    
    // Store the maximum index number in the "n" variable
    let n = mutatingArray.count - 1
    
    // Instantiate our count
    var swapCount = 0
    
    // A for loop that cycles through the indices of our array
    for i in 0..<mutatingArray.count {
        
        // For each value in the array, we're going to traverse the array to compare it against all other values.
        for j in 0..<n {
            
            // If our value is greater than the next value, it becomes the next value and the count increases by one
            if mutatingArray[j] > mutatingArray[j + 1] {
                swap(&mutatingArray[j], &mutatingArray[j + 1])
                swapCount += 1
            }
        }
    }
    
    // Print out our answers
    print("Array is sorted in \(swapCount) swaps.")
    print("First Element: \(mutatingArray.first!)")
    print("Last Element: \(mutatingArray.last!)")
}


// Call our function
bubbleSort(array: arr)

