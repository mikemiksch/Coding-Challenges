//Given an array of integers, find and print the maximum number of integers you can select from the array such that the absolute difference between any two of the chosen integers is <= 1.
//
//Input Format
//
//The first line contains a single integer, n, denoting the size of the array.
//The second line contains n space-separated integers describing the respective values of ao, a1, ..., an-1.
//
//Constraints
//
// * 2 <= n <= 100
// * 0 <= ai < 100
// * The answer will be >= 2
//
//Output Format
//
//A single integer denoting the maximum number of integers you can choose from the array such that the absolute difference between any two of the chosen integers is <= 1.
//
//Sample Input 0
//
// 6
// 4 6 5 3 3 1
//
//Sample Output 0
//
// 3
//
//Explanation 0
//
//We choose the following multiset of integers from the array: [4, 3, 3]. Each pair in the multiset has an absolute difference <= 1 (i.e., |4 - 3| = 1  and |3 - 3| = 0), so we print the number of chosen integers, 3, as our answer.
//
//Sample Input 1
//
// 6
// 1 2 2 3 1 2
//
//Sample Output 1
//
// 5
//
//Explanation 1
//
//We choose the following multiset of integers from the array: [1,2,2,1,2]. Each pair in the multiset has an absolute difference <=1 (i.e., |1 - 2| = 1, |1 - 1| = 0, and |2 - 2| = 0), so we print the number of chosen integers, 5, as our answer.

import Foundation

func pickingNumbers(input: [Int]) -> Int {
    
    // Create a variable to store our answer to be returned.
    var answer = 0
    
    // We're going to go through our our input and count the occurance of each digit, so we create a dictionary to store those counts.
    var counts = [Int : Int]()
    
    // We iterate through each element. If the element does not exist, it creates one with a default value of 0 and adds 1 to it. If it does exist, it adds 1 to the existing count
    for each in input {
        counts[each] = (counts[each] ?? 0) + 1
    }
    
    print(counts)
    // Now we loop through our dictionary to see if the value of each key meets our criteria
    for (key, value) in counts {
        
        // Since we're only looking for absolute differences of <= 1, we only need to look at the number 1 below the number we are currently evaluating.
        // If there's no count for that number (i.e. our input has a 7, but no 6), we just default to 0
        let minusCount = counts[key - 1] ?? 0
        
        // We set our score equal to the count of the occurences of the current element, plus those from the number 1 below
        let score = value + minusCount
        
        // If our score is larger than our current value for the answer, we replace it. This way we ensure that we're returning the largest number of integers we can use to create differences of <= 1
        if score > answer {
            answer = score
        }

    }
    return answer
}
