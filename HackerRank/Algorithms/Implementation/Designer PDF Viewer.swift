//When you select a contiguous block of text in a PDF viewer, the selection is highlighted with a blue rectangle. In a new kind of PDF viewer, the selection of each word is independent of the other words; this means that each rectangular selection area forms independently around each highlighted word. For example:
//
// Highlighted Text:
// [abc] [def] [ghi]
//
//In this type of PDF viewer, the width of the rectangular selection area is equal to the number of letters in the word times the width of a letter, and the height is the maximum height of any letter in the word.
//
//Consider a word consisting of lowercase English alphabetic letters, where each letter is  1mm wide. Given the height of each letter in millimeters (mm), find the total area that will be highlighted by blue rectangle in mm^2 when the given word is selected in our new PDF viewer.
//
//Input Format
//
//The first line contains 26 space-separated integers describing the respective heights of each consecutive lowercase English letter (i.e., ha, hb, hc, ..., hy, hyz).
//The second line contains a single word, consisting of lowercase English alphabetic letters.
//
//Constraints
//
// * 1<= h? <= 7, where ? is an English lowercase letter.
// * Word contains no more than 10 letters.
//
//Output Format
//
//Print a single integer denoting the area of highlighted rectangle when the given word is selected. The unit of measurement for this is square millimeters (mm^2), but you must only print the integer.
//
//Sample Input 0
//
// 1 3 1 3 1 4 1 3 2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
// abc
//
//Sample Output 0
//
// 9
//
//Explanation 0
//
//We are highlighting the word abc:
//
// 1. The tallest letter in abc is b, and hb = 3. The selection area for this word is 3 * 1mm * 3mm = 9mm^2.
//Note: Recall that the width of each character is 1mm.
//
//Sample Input 1
//
// 1 3 1 3 1 4 1 3 2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 7
// zaba
//
//Sample Output 1
//
// 28
//
//Explanation 1
//
//We are highlighting the word zaba:
//
//The tallest letter in zaba is z and hz is y. The selection area for this word is 4 * 1mm * 7mm = 28mm^2.

import Foundation


// Doing this with out-of-the-box Swift is a bit cumbersome, but here's one possible solution.
func designerPDFViewer(heights: [Int], word: String) -> Int {
    
    // Create a dictionary that stores the height value for a given character
    var letterHeights = [Character : Int]()
    
    // Create an array where the heights of the input String will be appended
    var wordHeights = [Int]()
    
    // For each character in our string of all lowercase letters, we set the value of the corresponding key in our dictionary to the value at that index in our input heights
    for (index, char) in "abcdefghijklmnopqrstuvwxyz".characters.enumerated() {
        letterHeights[char] = heights[index]
    }
    
    // For each character in our word, we append their corresponding height to our array
    for c in word.characters {
        
        // Force unwrapping will get us through the test cases since it's guaranteed that there will be a value to unwrap.
        wordHeights.append(letterHeights[c]!)
    }
    
    // Take the largest value from our wordHeights array and multiply it by its count
    return wordHeights.max()! * wordHeights.count
}


// If we want to create an extension for the Character type so that we can easily get its ASCII code value, we can do something similar to solutions to the challenge done in other languages.

// Credit to avdyushin for this extension (https://gist.github.com/avdyushin/2c1cda4905082a7bcda8)

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

// So with that extension in place, we can now read the height of the characters of our input word right from the input.

func designerPDFViewerWithASCII(heights: [Int], word: String) -> Int {
    
    // We have our max height set to 0 to start with.
    var maxHeight = 0
    
    // Our asciiValue extension returns the letter's corresponding ascii number. Knowing that we are limited to lowercase letters and that lowercase "a" is represented as 97, we can now produce an index value to lookup in our heights array.
    for char in word.characters {
        
        // If the height at the character's index value is greater than our maxHeight, maxHeight becomes that value
        if heights[char.asciiValue - 97] > maxHeight {
            maxHeight = heights[char.asciiValue - 97]
        }
    }
    
    // As before, return maxHeight * the length of our word.
    return maxHeight * word.characters.count
}







