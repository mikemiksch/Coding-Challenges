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

import Foundation

// Create a helper function to determine if a number is prime
func isPrime(_ n: Int) ->Bool{
    
    // Only concerned with numbers above 3 since we know 1 and 2 are prime
    if n > 3{
        
        // Set our top range to the square root of the number (Converted to a double) being evaluated
        let topRange = Int(sqrt(Double(n)))
        
        // Evaluate our range of two to topRange to see if it contains any numbers n can be divided by
        return !(2...topRange).contains { n % $0 == 0 }
      
    } else if n > 0 {
      return true
    
    } else {
        return false
    }
}


func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {
    
    // Create an array to store our answer
    var backwardPrimes = [Int]()
    
    // For loop cycles through a range set by our start and stop values
    for number in (start...stop){
        
        // If our number is prime and larger than 10 (because numbers less than 10 don't need to be reversed)
        if isPrime(number) && number > 10{
            
            // Convert the number to a string and reverse the characters
            let string: String = String(String(number).characters.reversed())
            
            // Convert the reversed characters back into a number
            let reversedNumber: Int = Int(string)!
            
            // If our reversed number is not equal to the original number and is prime, append to our answer array
            if reversedNumber != number && isPrime(reversedNumber){
                backwardPrimes.append(number)
            }
        }
    }
    
    // Return our answer array.
    return backwardPrimes
}
