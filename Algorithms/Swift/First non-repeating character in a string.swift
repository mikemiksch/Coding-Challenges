//Given a string s, find the first non-repeating character in it. For example, if the input string is “GeeksforGeeks”, then output should be ‘f’ and if input string is “GeeksQuiz”, then output should be ‘G’.

import foundation

// Function takes in a string, and returns a string
func nonRepeated(s: String) -> String {
    
    // Instantiate an array of characters
    var characterArray = [Character]()
    
    // Instantiate a dictionary of characters keyed to an integer representing the number of occurances
    var counts: [Character: Int] = [:]
    
    //Instantiate a string that will be our returned answer
    var firstNonRepeated = String()

    // For each Character in the array, iterates that character's count in the dictionary by 1, starting from a default of 0
    for each in s.characters {
        characterArray.append(each)
    }
    for each in characterArray {
        counts[each] = (counts[each] ?? 0) + 1
    }
    
    // Creates a new array by filtering the characterArray of those with counts equal to 1, starting at index 0
    let nonRepeatedArray = characterArray.filter({counts[$0] == 1})

    // If the new array is not empty (meaning all characters are repeated), return the first object.
    if nonRepeatedArray.isEmpty == false {
        firstNonRepeated = String(nonRepeatedArray.first!)
    }
    return firstNonRepeated
}

