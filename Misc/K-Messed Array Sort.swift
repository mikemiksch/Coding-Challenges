//K-Messed Array Sort
//
//Given an array of integers arr where each element is at most k places away from its sorted position, code an efficient function sortKMessedArray that sorts arr. For instance, for an input array of size 10 and k = 2, an element belonging to index 6 in the sorted array will be located at either index 4, 5, 6, 7 or 8 in the input array.
//
//Analyze the time and space complexities of your solution.
//
//Example:
//
//input:  arr = [1, 4, 5, 2, 3, 7, 8, 6, 10, 9], k = 2
//
//output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//
//Constraints:
//
// * [time limit] 5000ms
//
// * [input] array.integer arr
//
//      * 1 ≤ arr.length ≤ 100
//
// * [input] integer k
//
//      * 1 ≤ k ≤ 20
//
// * [output] array.integer

import Foundation

// Swift doesn't have a built-in heap data structure, so we have to define one ourselves to do what we need it to do for this challenge.
class MinHeap {
    
    // Our heap stores its values as an array
    var array = [Int]()
    
    // popFirst() is weirdly tempermental, so we work around it by sorting the heap's array, saving the first value in a variable, removing it from the array, and returning the saved variable.
    func extractMin() -> Int {
        array = array.sorted()
        let first = array[0]
        array.remove(at: 0)
        return first
    }
    
    // Inserting into our heap is just a matter of appending it to the heap's array.
    func insert(_ n: Int) {
        array.append(n)
    }
}

func sortKMessedArray(arr: [Int], k: Int) -> [Int] {
    
    // Set n equal to the length of our array
    let n = arr.count
    
    // Create a mutable copy of the array to return as our result
    var result = arr
    
    // Create a heap using our MinHeap class
    var heap = MinHeap()
    
    // Set the heap's initial array equal to an array made from the array slice of all elements between index 0 and index equal to the value of k
    heap.array = Array(arr[0...k])
    
    // Starting at index k + 1 (The first element beyond our initial heap), loop while i is less than the count of the array
    for i in (k + 1)..<n {
        
        // The value of the element at the index equal to i - k+1 is set to the minimum value of our heap. The minimum value of our heap is removed, and the element at index i is inserted.
        result[i-(k+1)] = heap.extractMin()
        heap.insert(result[i])
    }
    
    // For each of the remaining values in our heap, we extract the minimum value and set them to the last k + 1 spaces in the array.a
    for i in 0...k {
        result[n-k-1 + i] = heap.extractMin()
    }
    return result
}


let input = [1, 4, 5, 2, 3, 7, 8, 6, 10, 9]

sortKMessedArray(arr: input, k: 2)
