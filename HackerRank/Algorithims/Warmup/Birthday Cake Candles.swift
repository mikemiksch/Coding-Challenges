//Colleen is turning n years old! Therefore, she has n candles of various heights on her cake, and candle i has height "height". Because the taller candles tower over the shorter ones, Colleen can only blow out the tallest candles.
//
//Given the height for each individual candle, find and print the number of candles she can successfully blow out.
//
//Input Format
//
//The first line contains a single integer, n, denoting the number of candles on the cake.
//The second line contains n space-separated integers, where each integer i describes the height of candle i.
//
//Constraints
//
// * 1 <= n <= 10^5
// * 1 <= height <= 10^7
//
//Output Format
//
// Print the number of candles Colleen blows out on a new line.
//
//Sample Input 0
//
// 4
// 3 2 1 3
//
//Sample Output 0
//
// 2
//
//Explanation 0
//
//We have one candle of height 1, one candle of height 2, and two candles of height 3. Colleen only blows out the tallest candles, meaning the candles where height = 3. Because there are 2 such candles, we print 2 on a new line.


import Foundation

// This looks simple, but times out. For every element in the input array, it goes through the array to return the maximum value, giving us a time complexity of O(n^2)
//func birthdayCakeCandles(_ input: [Int]) {
//    print(Array(input.filter { $0 == input.max() }).count)
//}


// By setting the maximum value outside the filter function, we only iterate through the array once to find the maximum size, then again to compare each element against it, giving a time complexity of O(n + n) and only slightly more space complexity. Not bad.
//func birthdayCakeCandles(_ input: [Int]) {
//    var max = input.max()
//    print(Array(input.filter { $0 == max }).count)
//}



// This gets the time complexity down to O(n) at the expense of increasing the space complexity again.
func birthdayCakeCandles( _ input: [Int]) {
    var count = 0
    var max = 0
    for i in input {
        if i > max {
            max = i
            count = 1
        } else if max == i {
            count += 1
        }
    }
    print(count)
}

let n = readLine()!
let arr = Array(readLine()!.components(separatedBy: " ").map { Int($0)! })
birthdayCakeCandles(arr)
