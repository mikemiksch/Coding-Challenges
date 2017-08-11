//My friend John and I are members of the "Fat to Fit Club (FFC)". John is worried because each month a list with the weights of members is published and each month he is the last on the list which means he is the heaviest.
//
//I am the one who establishes the list so I told him: "Don't worry any more, I will modify the order of the list". It was decided to attribute a "weight" to numbers. The weight of a number will be from now on the sum of its digits.
//
//For example 99 will have "weight" 18, 100 will have "weight" 1 so in the list 100 will come before 99. Given a string with the weights of FFC members in normal order can you give this string ordered by "weights" of these numbers?
//
//Example:
//
//"56 65 74 100 99 68 86 180 90" ordered by numbers weights becomes: "100 180 90 56 65 74 68 86 99"
//
//When two numbers have the same "weight", let us class them as if they were strings and not numbers: 100 is before 180 because its "weight" (1) is less than the one of 180 (9) and 180 is before 90 since, having the same "weight" (9) it comes before as a string.
//
//All numbers in the list are positive numbers and the list can be empty.

import Foundation

func orderWeight(_ s: String) -> String {
    
    // We're going to create an array of tuples to store the weight, and the sum of the individual digits.
    var weightedWeights = [(String, Int)]()
    
    // We read our string into an array.
    let sArray = Array(s.components(separatedBy: " "))
    
    // For each number in the array, we calculate the sum of its digits
    for num in sArray {
        
        // We do this by chaining a map method that turns each character of the number into a string, then a number, then a reduce function to add them together.
        let sum = Array(num.characters.map { Int(String($0))! }).reduce(0,+)
        
        // We append the number and it's sum to our tuple array.
        weightedWeights.append((num, sum))
    }
    
    // Our sort method compares the sum of $0 and $1, and if they are not the same, sorts them based on the sum. If they are the same, it sorts them based on the weight as a string.
    // Then we map only the weights and join them with a blank space.
    return weightedWeights.sorted { $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0}.map {$0.0}.joined(separator: " ")
}
