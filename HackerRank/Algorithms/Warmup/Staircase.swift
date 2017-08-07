//Consider a staircase of size n = 4:
//
//    #
//   ##
//  ###
// ####
//Observe that its base and height are both equal to n, and the image is drawn using # symbols and spaces. The last line is not preceded by any spaces.
//
//Write a program that prints a staircase of size n.
//
//Input Format
//
//A single integer, n, denoting the size of the staircase.
//
//Output Format
//
//Print a staircase of size n using # symbols and spaces.
//
//Note: The last line must have 0 spaces in it.
//
//Sample Input
//
//6
//
//Sample Output
//
//      #
//     ##
//    ###
//   ####
//  #####
// ######
//Explanation
//
//The staircase is right-aligned, composed of # symbols and spaces, and has a height and width of n = 6.

import Foundation


// read the integer n
let n = Int(readLine()!)!

func staircase(_ n: Int) {
    
    // Create a counter with an initial value set to our argument of n
    var counter = n
    
    // Create a counter for the number of hash symbols to print starting at 1
    var hashSign = 1
    
    // Loop through the following logic n times
    for _ in 1...n {
        
        // Create a string that will be our result
        var spaceString = ""
        
        // For each number between 1 and below our current counter value, append an empty space to our string
        for _ in 1..<counter {
            spaceString += " "
        }
        
        // For each number between 1 and the current hash sign value, append a # to our string
        for _ in 1...hashSign {
            spaceString += "#"
        }
        
        // Print the resulting string
        print("\(spaceString)")
        
        // Decrement our counter and increment our hashSign by 1
        counter -= 1
        hashSign += 1
    }
}
