//We define a magic square to be an n x n matrix of distinct positive integers from 1 to n^2 where the sum of any row, column, or diagonal (of length n) is always equal to the same number (i.e., the magic constant).
//
//Consider a 3 x 3 matrix, s, of integers in the inclusive range [1,9]. We can convert any digit, a, to any other digit, b, in the range [1,9] at cost [a-b].
//
//Given s, convert it into a magic square at minimal cost by changing zero or more of its digits. Then print this cost on a new line.
//
//Note: The resulting magic square must contain distinct integers in the inclusive range [1,9].
//
//Input Format
//
//There are 3 lines of input. Each line describes a row of the matrix in the form of 3 space-separated integers denoting the respective first, second, and third elements of that row.
//
//Constraints
//
// * All integers in  are in the inclusive range [1,9].
//
//Output Format
//
// Print an integer denoting the minimum cost of turning matrix s into a magic square.
//
//Sample Input 0
//
// 4 9 2
// 3 5 7
// 8 1 5
//
//Sample Output 0
//
// 1
//
//Explanation 0
//
//Matrix s initially looks like this:
//
// 4 9 2
// 3 5 7
// 8 1 5
//
//Observe that it's not yet magic, because not all rows, columns, and center diagonals sum to the same number.
//
//If we change the bottom right value, s[2][2], from 5 to 6 at a cost of |6 - 5| = 1, s becomes a magic square at the minimum possible cost. Thus, we print the cost, 1, on a new line.
//
//Sample Input 1
//
// 4 8 2
// 4 5 7
// 6 1 6
//
//Sample Output 1
//
// 4
//
//Explanation 1
//
// Considering 0 - based indexing if we make s[0][1]->[9] at a cost of: |3 - 4| = 1, s[1][0]->3 at a cost of:|3 - 4| = 1 and s[2][0]->8 at a cost of: |8 - 6| = 2|, then net cost will be (1 + 1 + 2 = 4 ).

import Foundation

func formMagicSquare(s: [[Int]]) -> Int {
    
    // Within these parameters, the maximum it could ever cost to make a magic square is 45, so we set that as our default value to compare against.
    var minCost = 45
    
    // Since we know that the magic square will always be 3 x 3, we can save ourselves some heartache by looking up a table of valid magic 3 x 3 squares to check against rather than having to calculate every possibility ourselves.
    let validSquares = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]],
        ]
    
    // For each of our magic squares in our valid square list...
    for i in 0..<8 {
        
        // We create a variable to store the cost.
        var cost = 0
        
        // We iterate through each of the arrays in the row.
        for j in 0..<3 {
            
            // We iterate through each of the values in the row.
            for k in 0..<3 {
                
                // Our cost is set to the absolute value of the element of row j, column k of our input square minus the value of the corresponding location in square i from our prevalidated squares.
                cost += abs(s[j][k] - validSquares[i][j][k])
            }
        }
        
        // If the minCost is greater than our calculated cost (and it should be to start, since we're starting at the maximum possible cost as the minimum), we reassign its value to the calculated cost.
        if minCost > cost {
            minCost = cost
        }
    }
    
    return minCost
}
