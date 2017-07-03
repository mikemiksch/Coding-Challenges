//Island Count
//
//Given a 2D array binaryMatrix of 0s and 1s, implement a function getNumberOfIslands that returns the number of islands of 1s in binaryMatrix.
//
//An island is defined as a group of adjacent values that are all 1s. A cell in binaryMatrix is considered adjacent to another cell if they are next to each either on the same row or column. Note that two values of 1 are not part of the same island if they’re sharing only a mutual “corner” (i.e. they are diagonally neighbors).
//
//Explain and code the most efficient solution possible and analyze its time and space complexities.
//
//Example:
//
//input:  binaryMatrix = [ [0,    1,    0,    1,    0],
//[0,    0,    1,    1,    1],
//[1,    0,    0,    1,    0],
//[0,    1,    1,    0,    0],
//[1,    0,    1,    0,    1] ]
//
//output: 6 # since this is the number of islands in binaryMatrix.
//# See all 6 islands color-coded below.
//alt
//
//Constraints:
//
//[time limit] 5000ms
//
//[input] array.array.int binaryMatrix
//
//1 ≤ binaryMatrix.length ≤ 100
//1 ≤ binaryMatrix[i].length ≤ 100
//[output] integer

import Foundation


// We're working with a two dimensional array [[]] and need to return an integer
func getNumberOfIslands(binaryMatrix: [[Int]]) -> Int {
    
    // First, let's create a mutable copy of our input array
    var binaryMatrix = binaryMatrix
    
    // We also need a variable to store our counts of islands
    var islandCount = 0
    
    // For each array in our array...
    for i in 0..<binaryMatrix.count {
        
        // ...we traverse that array and check to see if the element is equal to 1
        for j in 0..<binaryMatrix[0].count {
            if binaryMatrix[i][j] == 1 {
                
                // If it is, we pass our matrix, i, and j values into our helper function and increment the island count by 1
                markIsland(&binaryMatrix, i, j)
                islandCount += 1
            }
        }
    }
    
    // Then at they very end, we return our count
    return islandCount
}

// We need a function that will mark squares that we've already checked so they're not counted more than once. We need our matrix, and an i and j value
func markIsland(_ matrix: inout [[Int]], _ i: Int, _ j: Int) {
    
    // We create a queue that stores the i/j values as tuples and start off by appending our starting coordinates to it.
    var queue = [(Int, Int)]()
    queue.append((i, j))
    
    // While the queue count is greater than zero, we create a variable out of what's at index 0 and the nremove it from the queue
    while queue.count > 0 {
        let item = queue[0]
        queue.removeFirst()
        
        // We convert our i and j values into x and y for the sake of readibility
        let x = item.0
        let y = item.1
        
        // If the value of the matrix at our coordinates is equal to 1 we change it to -1
        if matrix[x][y] == 1 {
            matrix[x][y] = -1
            
            // We run our helper function to check if the coordinates immediately above, below, left, and right are valid coordinates and append them to our queue if they are
            pushIfValid(&queue, x: x, y: y - 1, matrix: &matrix)
            pushIfValid(&queue, x: x, y: y + 1, matrix: &matrix)
            pushIfValid(&queue, x: x + 1, y: y, matrix: &matrix)
            pushIfValid(&queue, x: x - 1, y: y, matrix: &matrix)
        }
    }
}


// This function evaluates whether a given coordinate set in a matrix is valid, and if so pushes it to our queue
func pushIfValid(_ queue: inout [(Int, Int)], x: Int, y: Int, matrix: inout [[Int]]) {
    
    // Our column count is equal to the number of elements in our matrix (x plane)
    let columns = matrix.count
    
    // Our row count is equal to the number of elements in the first array in our matrix (y plane)
    let rows = matrix[0].count

    // If our coordinates are greater than or equal to zero and less than the count of their respective plane, the coordinates are valid and pushed to our queue
    if x < columns && x >= 0 && y < rows && y >= 0 {
        queue.append((x,y))
    }
}

