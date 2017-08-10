//Sudoku is a number-placement puzzle. The objective is to fill a 9 × 9 grid with numbers in such a way that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.
//
//Implement an algorithm that will check whether the given grid of numbers represents a valid Sudoku puzzle according to the layout rules described above. Note that the puzzle represented by grid does not have to be solvable.
//
//Example
//
//For
//
//grid = [
//['.', '.', '.', '1', '4', '.', '.', '2', '.'],
//['.', '.', '6', '.', '.', '.', '.', '.', '.'],
//['.', '.', '.', '.', '.', '.', '.', '.', '.'],
//['.', '.', '1', '.', '.', '.', '.', '.', '.'],
//['.', '6', '7', '.', '.', '.', '.', '.', '9'],
//['.', '.', '.', '.', '.', '.', '8', '1', '.'],
//['.', '3', '.', '.', '.', '.', '.', '.', '6'],
//['.', '.', '.', '.', '.', '7', '.', '.', '.'],
//['.', '.', '.', '5', '.', '.', '.', '7', '.']
//]
//the output should be
//sudoku2(grid) = true;
//
//For
//
//grid = [
//['.', '.', '.', '.', '2', '.', '.', '9', '.'],
//['.', '.', '.', '.', '6', '.', '.', '.', '.'],
//['7', '1', '.', '.', '7', '5', '.', '.', '.'],
//['.', '7', '.', '.', '.', '.', '.', '.', '.'],
//['.', '.', '.', '.', '8', '3', '.', '.', '.'],
//['.', '.', '8', '.', '.', '7', '.', '6', '.'],
//['.', '.', '.', '.', '.', '2', '.', '.', '.'],
//['.', '1', '.', '2', '.', '.', '.', '.', '.'],
//['.', '2', '.', '.', '3', '.', '.', '.', '.']
//]
//the output should be
//sudoku2(grid) = false.
//
//The given grid is not correct because there are two 1s in the second column. Each column, each row, and each 3 × 3 subgrid can only contain the numbers 1 through 9 one time.
//
//Input/Output
//
//[time limit] 20000ms (swift)
//[input] array.array.char grid
//
//A 9 × 9 array of characters, in which each character is either a digit from '1' to '9' or a period '.'.
//
//[output] boolean
//

import Foundation

func sudoku2(grid: [[Character]]) -> Bool {
    
    // Iterate for each row in the array
    for i in 0..<9 {
        
        // Create variable sets to check against rows, columns, and squares
        var rows = NSMutableSet()
        var columns = NSMutableSet()
        var square = NSMutableSet()
        
        // Iterate for each element in the row
        for j in 0..<9 {
            
            // If the element at row i/col j is not a "." and it already exists in our rows set, return false
            if grid[i][j] != Character(".") && rows.contains(grid[i][j]) {
                return false
                
            // Otherwise, we add it to our rows set
            } else {
                rows.add(grid[i][j])
            }
            
            // Same thing for columns, but we reverse our j and i values so we're looking at row j/col i
            if grid[j][i] != Character(".") && columns.contains(grid[j][i]) {                 return false
                
            } else {
                columns.add(grid[j][i])
            }
            
            // Create variables for our row and column index for verifying the square is valid

            let rowIndex = 3 * (i/3)
            let colIndex = 3 * (i%3)
            if grid[rowIndex + j/3][colIndex + j%3] != Character(".") && square.contains(grid[rowIndex + j/3][colIndex + j%3]) {
                return false
            } else {
                square.add(grid[rowIndex + j/3][colIndex + j%3])
            }
        }
    }
    return true
}



