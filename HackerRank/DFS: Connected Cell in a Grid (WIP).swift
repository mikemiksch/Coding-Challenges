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


// WIP. Tried to adapt it from a Java solution, but it falls into an infinite recursion.

var twoDArray = [[Int]]()


let test = [[1,1,0,0], [0,1,1,0], [0,0,1,0], [1,0,0,0]]

func countCells(input: [[Int]], i: Int, j: Int) -> Int {
    var result = Int()
    
    if i < 0 || j < 0 || i >= input.count || j >= input[0].count {
        result = 0
    } else if input[i][j] == 0 {
        result = 0
    } else {
        var matrix = input
        var count = 1
        matrix[i][j] = 0
        count += countCells(input: input, i: i + 1, j: j)
        count += countCells(input: input, i: i - 1, j: j)
        count += countCells(input: input, i: i, j: j + 1)
        count += countCells(input: input, i: i, j: j - 1)
        count += countCells(input: input, i: i + 1, j: j + 1)
        count += countCells(input: input, i: i - 1, j: j - 1)
        count += countCells(input: input, i: i - 1, j: j + 1)
        count += countCells(input: input, i: i + 1, j: j - 1)
        result = count
    }
    return result
}

func findRegion(input: [[Int]]) {
    var squares = 0
    for i in 1...input.count {
        for j in 1...input[0].count {
            squares = max(squares, countCells(input: input, i: i, j: j))
        }
    }
    print(squares)
}
