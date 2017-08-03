//Lily likes to play games with integers and their reversals. For some integer x, we define reversed(x) to be the reversal of all digits in x. For example, reversed(321) = 123, reversed(21) = 12, and reversed(120) = 21.
//
//Logan wants to go to the movies with Lily on some day x satisfying i <= x <= j, but he knows she only goes to the movies on days she considers to be beautiful. Lily considers a day to be beautiful if the absolute value of the difference between x and  reversed(x) is evenly divisible by k.
//
//Given i, j, and k, count and print the number of beautiful days when Logan and Lily can go to the movies.
//
//Input Format
//
//A single line of three space-separated integers describing the respective values of i, j, and k.
//
//Constraints
//
// * 1 <= i <= j <= 2 x 10^6
// * 1 <= k <= 2 x 10^9
//
//Output Format
//
//Print the number of beautiful days in the inclusive range between i and j.
//
//Sample Input
//
// 20 23 6
//
//Sample Output
//
// 2
//
//Explanation
//
//Logan wants to go to the movies on days 20, 21, 22, and 23. We perform the following calculations to determine which days are beautiful:
//
// * Day 20 is beautiful because the following evaluates to a whole number: |20 - 02|/6 = 3
// * Day 21 is not beautiful because the following doesn't evaluate to a whole number: |21  - 12|/6 = 1.5
// * Day 22 is beautiful because the following evaluates to a whole number: |22 - 22|/6 = 0
// * Day 23 is not beautiful because the following doesn't evaluate to a whole number: |23 - 32|/6 = 1.5
//
//Only two days, 20 and 22, in this interval are beautiful. Thus, we print 2 as our answer.

import Foundation

// My first thought is to to convert the number to characters and swap them, but that's a time intensive process that involves converting the number into a string, into characters, reversing them, back into a string, back into a number.

// It works and its fewer lines of code, but it's not efficient and times out the test cases on the website.
func beautifulDays(firstDate: Int, lastDate: Int, k: Int) -> Int {
    var validDates = 0
    for date in firstDate...lastDate {
        if let reverseDate = Int(String(String(date).characters.reversed())) {
            if abs(date - reverseDate) % k == 0 { validDates += 1 }
        }

    }
    return validDates
}

// We can use math to reverse the digits faster than changing a number's type back and forth.
func beautifulDaysWithMath(firstDate: Int, lastDate: Int, k: Int) -> Int {
    
    // We've got a counter for our valid dates.
    var validDates = 0
    
    // We're going to run each date in our range from first date to last date
    for date in firstDate...lastDate {
        
        // Initially, our reversed date = 0
        var reversedDate = 0
        
        // Creating a copy of the date we're evaluating so we can mutate it
        var dateToReverse = date
        
        // So while our mutable copy is not zero..
        while dateToReverse != 0 {
            
            // We loop through the following calculations. In practice, the loop would look like this:
            
            // dateToReverse = 21
            // reversedDate = 0 * 10 + 21 % 10 = 1
            // dateToReverse = 21 / 10 = 2
            // reversedDate = 1 * 10 + 2 % 10 = 12
            // dateToReverse = 2 / 10 = 0
            
            // Obviously this is taking advantage of how Swift handles the division of integers resulting in partial numbers, since 2/10 doesn't equal 0 in actuality.
            reversedDate = reversedDate * 10 + dateToReverse % 10
            dateToReverse = dateToReverse / 10
        }
        
        // If the absolute difference between our date and reversed date is evenly divisible by k, we increment our valid dates by 1.
        if abs(date - reversedDate) % k == 0 { validDates += 1 }
    }
    return validDates
}
