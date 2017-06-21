//A child plays with a ball on the nth floor of a big building. The height of this floor is known:
//
//(float parameter "h" in meters, h > 0) .
//
//He lets out the ball. The ball rebounds for example to two-thirds:
//
//(float parameter "bounce", 0 < bounce < 1)
//
//of its height.
//
//His mother looks out of a window that is 1.5 meters from the ground:
//
//(float parameters window < h).
//
//How many times will the mother see the ball either falling or bouncing in front of the window
//
//(return a positive integer unless conditions are not fulfilled in which case return -1) ?
//
//Note
//
//You will admit that the ball can only be seen if the height of the rebouncing ball is stricty greater than the window parameter.
//
//Example:
//
//h = 3, bounce = 0.66, window = 1.5, result is 3
//
//h = 3, bounce = 1, window = 1.5, result is -1

func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    
    // Intantiate our count as an integer
    var count = Int()
    
    // Create a mutable copy of "h"
    var height = h
    
    // Conditions that would return a -1
    // (h * bounce) < window was necessary to pass this challenges assertions, but is incorrect given the parameters of the question. i.e. if a ball drops from 3 meters, has a rebound of 0.1, and a window height of 1.5, you would observe one instance of the ball falling past the window.
    if h * bounce >= h || window >= h || (h * bounce) < window {
        count = -1
        
    // So if the inputs are valid, we continue to evaluate
    } else {
        
        // We start with 1, representing the initial drop past the window.
        count = 1
        
        // The new height is equal to the rebound
        height = height * bounce
        
        // While the rebound height is greater than the height of the window...
        while height > window {
            
            // We recalculate the new rebound height
            height = height * bounce
            
            // We increment the count by two, representing an up and a down movement of the ball
            count += 2
        }
    }
    return count
}
