//Consider a matrix with n rows and m columns, where each cell contains either a 0 or a 1 and any cell containing a 1 is called a filled cell. Two cells are said to be connected if they are adjacent to each other horizontally, vertically, or diagonally; in other words, cell [i][j] is connected to cells [i-1][j-1], [i-1][j], [i-1][j+1], [i][j-1], [i][j+1], [i+1][j-1], [i+1][j], and [i+1][j+1], provided that the location exists in the matrix for that [i][j].
//
//If one or more filled cells are also connected, they form a region. Note that each cell in a region is connected to at least one other cell in the region but is not necessarily directly connected to all the other cells in the region.
//
//Task
//Given an n*m matrix, find and print the number of cells in the largest region in the matrix. Note that there may be more than one region in the matrix.
//
//Input Format
//
//The first line contains an integer, n, denoting the number of rows in the matrix.
//The second line contains an integer, m, denoting the number of columns in the matrix.
//Each line i of the n subsequent lines contains m space-separated integers describing the respective values filling each row in the matrix.
//
//Constraints
//
// * 0 < n, m < 10
//
//Output Format
//
//Print the number of cells in the largest region in the given matrix.
//
//Sample Input
//
// 4
// 4
// 1 1 0 0
// 0 1 1 0
// 0 0 1 0
// 1 0 0 0
//
// Sample Output
//
// 5
//
//Explanation
//
//The diagram below depicts two regions of the matrix; for each region, the component cells forming the region are marked with an X:
//
//X X 0 0     1 1 0 0
//0 X X 0     0 1 1 0
//0 0 X 0     0 0 1 0
//1 0 0 0     X 0 0 0
//The first region has five cells and the second region has one cell. Because we want to print the number of cells in the largest region of the matrix, we print 5.




// Super similar solution to Island Count question in my Misc folder

import Foundation

// Take in a 2D array
func getLargestIslands(binaryMatrix: [[Int]]) {
    
    // Create a mutable copy of our input
    var binaryMatrix = binaryMatrix
    
    // Create a variable to store our largest count
    var maxCount = 0
    
    // For each element in our matrix...
    for i in 0..<binaryMatrix.count {
        
        // ...iterate over each element in that array
        for j in 0..<binaryMatrix[0].count {
            
            // If the value at matrix coordinates i, j is equal to 1, run our helper function.
            if binaryMatrix[i][j] == 1 {
                markIsland(&binaryMatrix, i, j, &maxCount)
            }
        }
    }
    
    // Print the largest sized island count
    print(maxCount)
}


// Slight difference from the island count solution; In this helper function, we're also passing in the maxCount variable from getLargestIsland where this function is invoked.
func markIsland(_ matrix: inout [[Int]], _ i: Int, _ j: Int, _ maxCount: inout Int) {
    
    // Create a counter to store how many 1's the island consists of.
    var counter = 0
    
    // Create a queue of tuples to store our coordinate pairs.
    var queue = [(Int, Int)]()
    
    // Add our starting coordinates to the queue
    queue.append((i, j))
    
    // While the queue has elements in it...
    while queue.count > 0 {
        
        // Create a copy of the element at index 0
        let item = queue[0]
        
        // Remove that element from the queue
        queue.removeFirst()
        
        // Set X and Y coordinates based on i and j values to make things more readable.
        let x = item.0
        let y = item.1
        
        // If the value at matrix coordinates x,y is equal to 1, change it to -1 and increment our counter by 1
        if matrix[x][y] == 1 {
            matrix[x][y] = -1
            counter += 1
            
            // Call our helper function on the 8 surrounding matrix elements to see if they can be added to the queue
            pushIfValid(&queue, x: x, y: y - 1, matrix: &matrix)
            pushIfValid(&queue, x: x, y: y + 1, matrix: &matrix)
            pushIfValid(&queue, x: x + 1, y: y, matrix: &matrix)
            pushIfValid(&queue, x: x + 1, y: y - 1, matrix: &matrix)
            pushIfValid(&queue, x: x + 1, y: y + 1, matrix: &matrix)
            pushIfValid(&queue, x: x - 1, y: y, matrix: &matrix)
            pushIfValid(&queue, x: x - 1, y: y - 1, matrix: &matrix)
            pushIfValid(&queue, x: x - 1, y: y + 1, matrix: &matrix)
        }
    }
    
    // Set maxCount in our getLargestIsland function to whichever is larger between its current value and the value of markIsland's counter
    maxCount = max(maxCount, counter)
}


// Function to determine if a pair of coordinates describe a valid position in our matrix and pushes it to our queue in markIsland
func pushIfValid(_ queue: inout [(Int, Int)], x: Int, y: Int, matrix: inout [[Int]]) {
    
    // Set columns as the number of elements in the outer array (x plane)
    let columns = matrix.count
    
    // Set rows as the number of elements in the inner array (y plane)
    let rows = matrix[0].count
    
    // If our coordinates are between 0 and < our number of elements in their respective plane, the coordinates are valid and are subsequently appended to the queue
    if x < columns && x >= 0 && y < rows && y >= 0 {
        queue.append((x,y))
    }
}


// Read our stdin stuff
var input = [[Int]]()
let n = Int(readLine()!)!
let m = readLine()!
for _ in 1...n {
    let row = Array(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    input.append(row)
}

getLargestIslands(binaryMatrix: input)
