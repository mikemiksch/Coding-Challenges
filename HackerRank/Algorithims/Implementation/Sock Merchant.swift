//John's clothing store has a pile of n loose socks where each sock i is labeled with an integer, c, denoting its color. He wants to sell as many socks as possible, but his customers will only buy them in matching pairs. Two socks,i and j, are a single matching pair if they have the same color (ci = cj).
//
//Given n and the color of each sock, how many pairs of socks can John sell?
//
//Input Format
//
//The first line contains an integer, n, denoting the number of socks.
//The second line contains n space-separated integers describing the respective values of c0, c1, c2, ..., cn-1.
//
//Constraints
//
// * 1 <= n <= 100
// * 1 <= ci <= 100
//
//Output Format
//
//Print the total number of matching pairs of socks that John can sell.
//
//Sample Input
//
// 9
// 10 20 20 10 10 30 50 10 20
//
//Sample Output
//
// 3
//
//Explanation
//
// 10 10 50 20 20
//  |  |     |
// 10 10 30 20
//As you can see from the figure above, we can match three pairs of socks. Thus, we print 3 on a new line.

import Foundation

// We can do this in O(n) space and time complexity.

func sockMerchant(socks: [Int]) -> Int {
    
    // Create a counter to... count...
    var counter = 0
    
    // Create an array to store our socks and compare against for matches.
    var pairs = [Int]()
    
    // Loop through our input array
    for i in 0..<socks.count {
        
        // If our pairs array contains a matching integer, we remove it and increment our counter by one.
        if pairs.contains(socks[i]) {
            pairs.remove(at: pairs.index(of: socks[i])!)
            counter += 1
        } else {
            
            // If our array doesn't contain the integer, we add it for comparison against the subsequent elements from the input array.
            pairs.append(socks[i])
        }
    }
    return counter
}

