//Description:
//
//Your task is to write function toLeetSpeak that converts a regular english sentence to Leetspeak.
//
//More about LeetSpeak You can read at wiki -> https://en.wikipedia.org/wiki/Leet
//
//Consider only uppercase letters (no lowercase letters, no numbers) and spaces.
//
//For example:
//
//toLeetSpeak("LEET") returns "1337"
//In this kata we use a simple LeetSpeak dialect. Use this alphabet:
//
//{
//    A : '@',
//    B : '8',
//    C : '(',
//    D : 'D',
//    E : '3',
//    F : 'F',
//    G : '6',
//    H : '#',
//    I : '!',
//    J : 'J',
//    K : 'K',
//    L : '1',
//    M : 'M',
//    N : 'N',
//    O : '0',
//    P : 'P',
//    Q : 'Q',
//    R : 'R',
//    S : '$',
//    T : '7',
//    U : 'U',
//    V : 'V',
//    W : 'W',
//    X : 'X',
//    Y : 'Y',
//    Z : '2'
//}

import Foundation

let translationDictionary : [Character : Character] =
    [
        "A" : "@",
        "B" : "8",
        "C" : "(",
        "D" : "D",
        "E" : "3",
        "F" : "F",
        "G" : "6",
        "H" : "#",
        "I" : "!",
        "J" : "J",
        "K" : "K",
        "L" : "1",
        "M" : "M",
        "N" : "N",
        "O" : "0",
        "P" : "P",
        "Q" : "Q",
        "R" : "R",
        "S" : "$",
        "T" : "7",
        "U" : "U",
        "V" : "V",
        "W" : "W",
        "X" : "X",
        "Y" : "Y",
        "Z" : "2"
]

// This solution works...

func toLeetSpeak(_ s : String) -> String {
    // Create a string to store our result
    var result = String()
    
    // For each character in our input...
    for each in s.characters {
        
        // ...see if that character exists in our dictionary as a key.
        if let substitute = translationDictionary[each] {
            
            // If it does, replace it with the key's value in the dictionary and append it to our result string.
            result += String(substitute)
        
        // Otherwise it stays as is and is appended to the result. This would handle spaces, lower cases, etc. Not actually necessary with the constraints of this challenge.
        } else {
            result += String(each)
        }
    }
    
    // Return our result string
    return result
}

// But this solution is even better!

func betterToLeetSpeak(_ s : String) -> String {
    // This is combining everything into a single line, but let's break it down:
    return String(s.characters.flatMap{ translationDictionary[$0] })
    
    // 1. s.characters turns our input into a character list
    // 2. We can call a flatMap method on our character list to flatten it and perform the same transformation on each element of our list
    // 3. So we're converting our list of characters into a list of characters swapped out for the value at the matching key in our dictionary
    // 4. We wrap it all up in a String and return it
    
}
