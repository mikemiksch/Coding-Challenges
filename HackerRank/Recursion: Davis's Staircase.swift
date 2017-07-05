//Davis has s staircases in his house and he likes to climb each staircase 1, 2, or 3 steps at a time. Being a very precocious child, he wonders how many ways there are to reach the top of the staircase.
//
//Given the respective heights for each of the s staircases in his house, find and print the number of ways he can climb each staircase on a new line.
//
//Input Format
//
//The first line contains a single integer, s, denoting the number of staircases in his house.
//Each line i of the s subsequent lines contains a single integer, n, denoting the height of staircase i.
//
//Constraints
//
// * 1 <= s <= 5
// * 1 <= n <= 36
//
//Subtasks
//
// * 1 <= n <= 20 for 50% of the maximum score
//
//for  of the maximum score.
//Output Format
//
//For each staircase, print the number of ways Davis can climb it in a new line.
//
//Sample Input
//
// 3
// 1
// 3
// 7
//
//Sample Output
//
// 1
// 4
// 44
//
//Explanation
//
//Let's calculate the number of ways of climbing the first two of the Davis' s = 3 staircases:
//
// 1. The first staircase only has n = 1 step, so there is only one way for him to climb it (i.e., by jumping 1 step). Thus, we print 1 on a new line.
//
//2. The second staircase has n = 3 steps and he can climb it in any of the four following ways:
//
// * 1 -> 1 -> 1
// * 1 -> 2
// * 2 -> 1
// * 3
//
//Thus, we print 4 on a new line.


//// This code passed all the test cases on HackerRank, but has a pretty critical flaw in that it can't handle an instance of a staircase having 4 steps.


//func countSteps(_ n: Int) -> Int {
//    var result = Int()
//    var array = [1, 2, 4]
//    
//    // We have logic to handle values less than 4...
//    if n < 4 {
//        result = array[n - 1]
//    } else {
//        
//        // ...but our for loop starts at 5. Starting at 4 gives the wrong results.
//        for i in 5...n {
//            array[(i + 1) % 3] = array[0] + array[1] + array[2]
//        }
//        result = array[0] + array[1] + array[2]
//    }
//    return result
//}


// This is a similar concept, though it's handling variables outside of an array in this implementationg. But hey, it will return the number of stairs for 4 steps!
func countSteps(_ n: Int) -> Int {
    
    // Create a variable to store our result, and handle inputs of 0-2
    var result = Int()
    if n == 0 {
        result = 0
    } else if n == 1 {
        result = 1
    } else if n == 2 {
        result = 2
    
    // If n > 2, we put in our seed numbers in variables f1 - f3
    } else {
        var f1 = 1
        var f2 = 2
        var f3 = 4
        
        // We create the value we're going to our results equal to
        var f = Int()
        
        // We start at 3 (since 0-2 is already handled in our if statement above) and count loops until n - 1
        for _ in  3..<n {
            
            // f is assigned to the sum of all three f values
            f = f1 + f2 + f3
            
            // f1 becomes f2, f2 becomes f3, f3 becomes f for each iteration of the loop
            f1 = f2
            f2 = f3
            f3 = f
        }
        
        // Our result is the value of f once our for loop is completed.
        result = f
    }
    return result
}


// Standard read input stuff.
let s = Int(readLine()!)!
for _ in 1...s {
    let n = Int(readLine()!)
    print(counSteps(n)!)!
}
