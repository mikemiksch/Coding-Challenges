//Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 12-hour clock.
//
//Input Format
//
//A single string containing a time in 12-hour clock format (i.e.: hh:mm:ssAM or hh:mm:ssPM), where 01 <= hh <= 12 and 00 <= mm, ss <= 59.
//
//Output Format
//
//Convert and print the given time in 24-hour format, where 00 <= hh <=23.
//
//Sample Input
//
// 07:05:45PM
//
//Sample Output
//
// 19:05:45

import Foundation

// This is easy to solve with DateFormatters
func timeConversion(_ input: String) {
    
    // There are a multitude of date formats out there and it gets confusing sometimes. The hh:mm:ss is simple enough, but we need "a" to stand in for the AM/PM on the input format
    let formatIn = DateFormatter()
    formatIn.dateFormat = "hh:mm:ssa"
    
    // Output is stupid simple once you have your input formatted correctly. Ditch the "a", switch your "hh" for "HH", and there go.
    let formatOut = DateFormatter()
    formatOut.dateFormat = "HH:mm:ss"
    
    let time = formatIn.date(from: input)
    print(formatOut.string(from: time!))
}

let s = readLine()!
timeConversion(s)
