//Two cats named A and B are standing at integral points on the x-axis. Cat A is standing at point x and cat B is standing at point y. Both cats run at the same speed, and they want to catch a mouse named C that's hiding at integral point z on the x-axis. Can you determine who will catch the mouse?
//
//You are given  queries in the form of x, y, and z. For each query, print the appropriate answer on a new line:
//
// * If cat  catches the mouse first, print Cat A.
// * If cat  catches the mouse first, print Cat B.
// * If both cats reach the mouse at the same time, print Mouse C as the two cats fight and mouse escapes.
//
//Input Format
//
//The first line contains a single integer, , denoting the number of queries.
//Each of the  subsequent lines contains three space-separated integers describing the respective values of  (cat 's location),  (cat 's location), and  (mouse 's location).
//
//Constraints
//
// * 1 <= q <= 100
// * 1 <= x, y, z <= 100
//
//Output Format
//
//On a new line for each query, print Cat A if cat A catches the mouse first, Cat B if cat  B catches the mouse first, or Mouse C if the mouse escapes.
//
//Sample Input 0
//
// 3
// 1 2 3
// 1 3 2
// 2 1 3
//
//Sample Output 0
//
// Cat B
// Mouse C
// Cat A
//
//Explanation 0
//
//Query 0: The positions of the cats and mouse are shown below:
//
//        Cat B
// (0)-(1)-(2)-(3)-(4)->
//    Cat A   Mouse C
//
//Cat B will catch the mouse first, so we print Cat B on a new line.
//
//Query 1: In this query, cats A and B reach mouse C at the exact same time: 
//
//        Mouse C
// (0)-(1)-(2)-(3)-(4)->
//    Cat A   Cat B
//
//Because the mouse escapes, we print Mouse C on a new line.

import Foundation

func catsAndAMouse(catA: Int, catB: Int, mouseC: Int) -> String {
    
    // If the absolute value of the difference in positions of Cat A and Cat B relative to Mouse C are the same, we return Mouse C
    if abs(mouseC - catA) == abs(mouseC - catB) {
        return "Mouse C"
        
    // If the distance from Cat A is less than Cat B, Cat A wins out
    } else if abs(mouseC - catA) < abs(mouseC - catB) {
        return "Cat A"
        
    // Otherwise, we just have Cat B
    } else {
        return "Cat B"
    }
}

// We can also express this logic by chaining a couple ternary operators together. Less code, but not as easy to read.
func ternaryCatsAndAMouse(catA: Int, catB: Int, mouseC: Int) -> String {
    return (abs(mouseC - catA) < abs(mouseC - catB)) ? "Cat A" : (abs(mouseC - catA) == abs(mouseC - catB)) ? "Mouse C" : "Cat B"
}
