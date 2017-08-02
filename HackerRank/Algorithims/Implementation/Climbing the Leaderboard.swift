//Alice is playing an arcade game and wants to climb to the top of the leaderboard. Can you help her track her ranking as she beats each level? The game uses Dense Ranking, so its leaderboard works like this:
//
// * The player with the highest score is ranked number 1 on the leaderboard.
// * Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.
//
//For example, four players have the scores 100, 90, 90, and 80. Those players will have ranks 1, 2, 2, and 3, respectively.
//
//When Alice starts playing, there are already n people on the leaderboard. The score of each player i is denoted by s. Alice plays for m levels, and we denote her total score after passing each level j as alicej. After completing each level, Alice wants to know her current rank.
//
//You are given an array, scores, of monotonically decreasing leaderboard scores, and another array, alice, of Alice's cumulative scores for each level of the game. You must print m integers. The jth integer should indicate the current rank of alice after passing the jth level.
//
//Input Format
//
//The first line contains an integer, n, denoting the number of players already on the leaderboard.
//The next line contains n space-separated integers describing the respective values of scores0, scores1, ..., scoresn-1.
//The next line contains an integer, m, denoting the number of levels Alice beats.
//The last line contains m space-separated integers describing the respective values of alice0, alice1, ..., alicem-1.
//
//Constraints
//
// * 1 <= n <= 2 x 10^5
// * 1 <= m <= 2 x 10^5
// * 0 <= scoresi <= 10^9 for 0 <= i < n
// * 0 <= alicej <= 10^9 for 0 <= j < m
// * The exisiting leaderboard, scores, is in descending order.
// * Alice's scores are cumulative, so alice is in ascending order
//
//Subtask
//
//For 60% of the maximum score:
//
// * 1 <= n <= 200
// * 1 <= m <= 200
//
//Output Format
//
//Print m integers. The jth integer should indicate the rank of alice after passing the  jth level.
//
//Sample Input 0
//
// 7
// 100 100 50 40 40 20 10
// 4
// 5 25 50 120
//
//Sample Output 0
//
// 6
// 4
// 2
// 1
//
//Explanation 0
//
//Alice starts playing with 7 players already on the leaderboard, which looks like this:
//
// Rank     Name     Score
// 1        Emma     100
// 1        David    100
// 2        Caroline 50
// 3        Ritka    40
// 3        Tom      40
// 4        Heraldo  20
// 5        Riley    10
//
//After Alice finishes level 0, her score is 5 and her ranking is 6:
//
// Rank     Name     Score
// 1        Emma     100
// 1        David    100
// 2        Caroline 50
// 3        Ritka    40
// 3        Tom      40
// 4        Heraldo  20
// 5        Riley    10
// 6        Alice    5
//
//After Alice finishes level 1, her score is 25 and her ranking is 4:
//
// Rank     Name     Score
// 1        Emma     100
// 1        David    100
// 2        Caroline 50
// 3        Ritka    40
// 3        Tom      40
// 4        Alice    25
// 5        Heraldo  20
// 6        Riley    10
//
//After Alice finishes level 2, her score is 50 and her ranking is tied with Caroline at 2:
//
// Rank     Name     Score
// 1        Emma     100
// 1        David    100
// 2        Caroline 50
// 2        Alice    50
// 3        Ritka    40
// 3        Tom      40
// 4        Heraldo  20
// 5        Riley    10
//
//After Alice finishes level 3, her score is 120 and her ranking is 1:
//
// Rank     Name     Score
// 1        Alice    120
// 2        Emma     100
// 2        David    100
// 3        Caroline 50
// 4        Ritka    40
// 4        Tom      40
// 5        Heraldo  20
// 6        Riley    10
//

import Foundation

func climbingTheLeaderboard(leaderboard: [Int], scores: [Int]){
    
    // We create a set from the values of the leaderboard so that we only have unique values
    let uniques = Set<Int>(leaderboard)
    
    // We sort the uniques, reverse it into decending order, and convert it into an array
    var sortedBoard = Array(uniques.sorted().reversed())
    
    // We store our initial position as being equal to the count of our sorted values
    var position = sortedBoard.count
    
    // For each score in our array of scores...
    for score in scores {
        
        // While our position is greater than zero and our score is greater than or equal to the score in the next position, we decrement our position by 1
        while position > 0 && score >= sortedBoard[position - 1] {
            position -= 1
        }
        
        // When our while loop is no longer true, we return our position + 1
        print(position + 1)
    }
}

