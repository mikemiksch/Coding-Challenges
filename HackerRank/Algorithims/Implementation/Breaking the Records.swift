//Maria plays n games of college basketball in a season. Because she wants to go pro, she tracks her points scored per game sequentially in an array defined as score = [s0, s1, ..., sn-1]. After each game i, she checks to see if score si breaks her record for most or least points scored so far during that season.
//
//Given Maria's array of scores for a season of n games, find and print the number of times she breaks her record for most and least points scored during the season.
//
//Note: Assume her records for most and least points at the start of the season are the number of points scored during the first game of the season.
//
//Input Format
//
//The first line contains an integer denoting n (the number of games).
//The second line contains n space-separated integers describing the respective values of s0, s1, ..., sn-1.
//
//Constraints
//
// * 1 <= n <= 1000
// * 0 <= si <= 10^8
//
//Output Format
//
//Print two space-seperated integers describing the respective numbers of times her best (highest) score increased and her worst (lowest) score decreased.
//
//Sample Input 0
//
// 9
// 10 5 20 20 4 5 2 25 1
//
//Sample Output 0
//
// 2 4
//
//Explanation 0
//
//The diagram below depicts the number of times Maria broke her best and worst records throughout the season:
//
//          Game [01][01][02][03][04][05][06][07][08]
//         Score [10][05][20][20][04][05][02][25][01]
// Highest Score [10][10][20][20][20][20][20][25][25]
//  Lowest Score [10][05][05][05][04][04][02][02][01]
//
//She broke her best record twice (after games 2 and 7) and her worst record four times (after games 1, 4, 6, and 8), so we print 2 4 as our answer. Note that she did not break her record for best score during game , as her score during that game was not strictly greater than her best record at the time.
//
//Sample Input 1
//
// 10
// 3 4 21 36 10 28 35 5 24 42
//
//Sample Output 1
//
// 4 0
//
//Explanation 1
//
//The diagram below depicts the number of times Maria broke her best and worst records throughout the season:
//
//          Game [01][01][02][03][04][05][06][07][08][09]
//         Score [03][04][21][36][10][28][35][05][24][42]
// Highest Score [03][04][21][36][36][36][36][36][36][42]
//  Lowest Score [03][03][03][03][03][03][03][03][03][03]
//
//She broke her best record four times (after games 1, 2, 3, and 9) and her worst record zero times (no score during the season was lower than the one she earned during her first game), so we print 4 0 as our answer.

import Foundation

// Again, this is so simplistic that it hardly bears commenting on.
func breakingTheRecords(_ input: [Int]) {
    
    // Intantiate counters to keep track of each time the high and low record are broken
    var highBreak = 0
    var lowBreak = 0
    
    // The initial values of high and low record is equal to the score of the first game since there's nothing yet to comapre it to.
    var currHigh = input[0]
    var currLow = input[0]
    
    // For each element in our array of scores...
    for i in input {
        
        // ...if the score is larger than the current high score, it replaces the score and increments our counter by one.
        if i > currHigh {
            currHigh = i
            highBreak += 1
        }
        
        // And if it's lower, we set it to the new low score and increment that counter by one.
        if i < currLow {
            currLow = i
            lowBreak += 1
        }
    }
    
    // Print out the results on a single line
    print("\(highBreak) \(lowBreak)")
}


// The first line of the input isn't needed in this implementation, but we capture it as "n" and move onto reading our next line of input as an array of integers.
let n = readLine()!
let input = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })
