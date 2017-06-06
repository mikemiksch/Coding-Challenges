//Alice is taking a cryptography class and finding anagrams to be very useful. We consider two strings to be anagrams of each other if the first string's letters can be rearranged to form the second string. In other words, both strings must contain the same exact letters in the same exact frequency For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.
//
//Alice decides on an encryption scheme involving two large strings where encryption is dependent on the minimum number of character deletions required to make the two strings anagrams. Can you help her find this number?
//
//Given two strings, a and b, that may or may not be of the same length, determine the minimum number of character deletions required to make a and b anagrams. Any characters can be deleted from either of the strings.

//The first line contains a single string, a.
//The second line contains a single string, b.
//
//Constraints
//* 1 <= |a|,|b| <= 10^4
//* It is guaranteed that a and b consist of lowercase English alphabetic letters (i.e., a through z).
//
//Output Format
//
//Print a single integer denoting the number of characters you must delete to make the two strings anagrams of each other.
//
//Sample Input
//
//cde
//abc

//Sample Output
//
//4
//Explanation
//
//We delete the following characters from our two strings to turn them into anagrams of each other:
//
//Remove d and e from cde to get c.
//Remove a and b from abc to get c.
//We must delete  characters to make both strings anagrams, so we print  on a new line.

import Foundation

func makeAnagram(string1: String, string2: String) -> Int {
    // Concatenate inputs to get character count from later.
    let combinedStrings = string1 + string2
    
    // Create variable to store our deleted character count
    var counter = 0
 
    // Create mutable copy of string2
    var secondString = string2
    
    // Search to see if each letter of string1 exists in our mutable copy of string2
    for index in string1.characters.indices {
        
        // If it does, increment the counter by 2 (reflecting removing the character from both strings) and remove it from the mutable copy
        if let secondStringIndex = secondString.characters.index(of: string1[index]) {
            counter += 2
            secondString.remove(at: secondStringIndex)
        }
    }
    
    // Return the character count of our concatenated string - counter value.
    return combinedStrings.characters.count - counter
}

// Read for inputs to pass into function
let a = readLine()!
let b = readLine()!

print(makeAnagram(string1: a, string2: b))
