//Backwards Read Primes are primes that when read backwards in base 10 (from right to left) are a different prime. (This rules out primes which are palindromes.)
//
//Examples:
//13 17 31 37 71 73 are Backwards Read Primes
//13 is such because it's prime and read from right to left writes 31 which is prime too. Same for the others.
//
//Task
//
//Find all Backwards Read Primes between two positive given numbers (both inclusive), the second one being greater than the first one. The resulting array or the resulting string will be ordered following the natural order of the prime numbers.
//
//Example
//
//backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97] backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967]
//
//backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97]
//backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967]

func backwardsPrime(start: Int, stop: Int) -> [Int] {
    
    // Create array to store results
    var primesArray = [Int]()
    
    // Loop through each value between your start and stop values
    for each in start...stop {
        
        // Convert the number into a string
        let stringifiedNumber = String(each)
        
        // Reverse the string
        let reversedString = String(stringifiedNumber.characters.reversed())
        
        // Unwrap the string back into an int
        if let reversedInt = Int(reversedString) {
            
            // Evaluate if the original number is a prime number
            if each > 1 && !(2..<each).contains { each % $0 == 0 } {
                
                // Evaluate if the reversed number is not the same as the original, and is also a prime
                if reversedInt != each && reversedInt > 1 && !(2..<reversedInt).contains { reversedInt % $0 == 0 } {
                    
                    // Append numbers that meet the criteria
                    primesArray.append(each)
                }
            }
        }
    }
    
    // Return our answering array.
    return primesArray
}
