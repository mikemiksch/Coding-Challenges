//Description:
//
//A bookseller has lots of books classified in 26 categories labeled A, B, ... Z. Each book has a code c of 3, 4, 5 or more capitals letters. The 1st letter of a code is the capital letter of the book category. In the bookseller's stocklist each code c is followed by a space and by a positive integer n (int n >= 0) which indicates the quantity of books of this code in stock.
//
//In a given stocklist all codes have the same length and all numbers have their own same length (can be different from the code length).
//
//For example an extract of one of the stocklists could be:
//
//L = {"ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"}.
//or
//
//L = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"].
//In this stocklist all codes have a length of five and all numbers have a length of two.
//
//You will be given a stocklist (e.g. : L) and a list of categories in capital letters e.g :
//
//M = {"A", "B", "C", "W"}
//or
//
//M = ["A", "B", "C", "W"]
//and your task is to find all the books of L with codes belonging to each category of M and to sum their quantity according to each category.
//
//For the lists L and M of example you have to return the string (in Haskell/Clojure a list of pairs):
//
//(A : 20) - (B : 114) - (C : 50) - (W : 0)
//where A, B, C, W are the categories, 20 is the sum of the unique book of category A, 114 the sum corresponding to "BKWRK" and "BTSQZ", 50 corresponding to "CDXEF" and 0 to category 'W' since there are no code beginning with W.
//
//If L or M are empty return string is "" (Clojure should return an empty array instead).


import Foundation

func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    
    // Create a string to hold our answer
    var output = String()
    
    // Check to make sure it's valid input before we even do anything
    if !listOfArt.isEmpty && !listOfCat.isEmpty {
        
        // Create a dictionary for our categories and tallies
        var tallies = [String : Int]()
        
        // Populate our dictionary with the values passed through the list of categories argument
        for each in listOfCat {
            tallies[each] = 0
        }
        
        
        // Kind of hacky way of doing this, could do it in a for loop I suppose.
        _ = listOfArt.map ({
            (value: String) -> () in
            
            // Separate our input into the categories and the quanitties
            let parse = value.components(separatedBy: " ")
            
            // Grab the first character of the ccode and turn it into a string
            let key = String(describing: parse[0].characters.first!)
            
            // Grab the quanitity and turn it into an integer
            let value = Int(parse[1])!
            
            // Unwrap the tally of each key and update it with new value
            if var tally = tallies[key] {
                tally += value
                tallies[key] = tally
            }
        })
        
        // For each element in our tallies, build our output string in the order of the categories listed
        for each in listOfCat {
            let last = listOfCat.last!
            if let total = tallies[each]  {
                if each != last {
                    output += "(\(each) : \(total)) - "
                } else {
                    output += "(\(each) : \(total))"
                }
            }
        }
    
    // If it's invalid, our input is an empty string as per the instructions
    } else {
        output = ""
    }
    
    // Return our output
    return output
}
