//A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.
//
//Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.
//
//Input Format
//
//The first line contains two space-separated integers describing the respective values of m (the number of words in the magazine) and n (the number of words in the ransom note).
//The second line contains m space-separated strings denoting the words present in the magazine.
//The third line contains n space-separated strings denoting the words present in the ransom note.
//
//Constraints
// * 1 <= m,n <= 30000
// * 1 <= length of any word <= 5
//
//Each word consists of English alphabetic letters (i.e.,  to  and  to ).
//The words in the note and magazine are case-sensitive.
//Output Format
//
//Print Yes if he can use the magazine to create an untraceable replica of his ransom note; otherwise, print No.
//
//Sample Input
//
//6 4
//give me one grand today night
//give one grand today
//Sample Output
//
//Yes
//Explanation
//
//All four words needed to write an untraceable replica of the ransom note are present in the magazine, so we print Yes as our answer.

import Foundation

// Creates dictionaries consisting of words keyed to the number of times they occur
func wordCount(string:String) -> [String:Int] {
    
    // Initiate empty dictionary
    var hashTable: [String:Int] = [:]
    
    // Go through the string, separating the components at spaces and iterating their count every time it increases
    for each in string.components(separatedBy: " ") {
        hashTable[each] = (hashTable[each] ?? 0) + 1
    }
    
    // Return the dictionary
    return hashTable
}


// Determines if we can create the second input with the words contained in the first input.
func makeRansomNote(magazine:String, note:String) -> Bool {
    
    // Get our word count dictionaries on both arguments.
    let magWordCount = wordCount(string: magazine)
    let noteWordCount = wordCount(string: note)
    
    // For each word in the second input, we check to see if it occurs more times than it does in the first
    for each in noteWordCount.keys {
        
        // If the count is greater in the second input, we return false.
        if (noteWordCount[each] ?? 0) > (magWordCount[each] ?? 0) {
            return false
        }
    }
    
    // If the count of all words is not greater in the second input, we return true
    return true
}


// Takes in our inputs, passes them to the makeRansomNote function, uses Bool to print yes or no answer.
func checkIfCan(magazine: String, ransom: String) {
    if makeRansomNote(magazine: magazine, note: ransom) == false {
        print("No")
    } else {
        print("Yes")
    }
}

var wordCounts = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var magWords = readLine()!
var ransomWords = readLine()!
