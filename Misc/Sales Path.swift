//Sales Path
//
//The car manufacturer Honda holds their distribution system in the form of a tree (not necessarily binary). The root is the company itself, and every node in the tree represents a car distributor that receives cars from the parent node and ships them to its children nodes. The leaf nodes are car dealerships that sell cars direct to consumers. In addition, every node holds an integer that is the cost of shipping a car to it.
//
//Take for example the tree below:
//
//          (0)
//    -------|----------
//    |      |         |
//   (5)    (3)       (6)
//   /     /   \     /   \
// (4)   (2)   (0) (1)   (5)
//
//A path from Honda’s factory to a car dealership, which is a path from the root to a leaf in the tree, is called a Sales Path. The cost of a Sales Path is the sum of the costs for every node in the path. For example, in the tree above one Sales Path is 0→3→0→10, and its cost is 13 (0+3+0+10).
//
//Honda wishes to find the minimal Sales Path cost in its distribution tree. Given a node rootNode, write an function getCheapestCost that calculates the minimal Sales Path cost in the tree.
//
//Implement your function in the most efficient manner and analyze its time and space complexities.
//
//For example:
//
//Given the rootNode of the tree in diagram above
//
//Your function would return:
//
//7 since it’s the minimal Sales Path cost (there are actually two Sales Paths in the tree whose cost is 7: 0→6→1 and 0→3→2→1→1)
//
//Constraints:
//
//[time limit] 5000ms
//
//[input] Node rootNode
//
//0 ≤ rootNode.cost ≤ 100000
//[output] integer


// Define our Node class
class Node {
    
    // Not being a binary tree, the number of children is variable, so we store it in an array
    var children = [Node]()
    
    // Every node will have a cost
    let cost : Int
    
    // Cost is passed through at creation of the node.
    init (cost: Int) {
        self.cost = cost
    }
}

func getCheapestCost(root: Node) -> Int {
    
    // Our root's cost is the absolute minimum
    var cost = root.cost
    
    // We'll set n to the lenght of the root.children array
    let n = root.children.count
    
    // If n is greater than zero (meaning our children array is not empty)
    if n > 0 {
        
        // Start with the maximum integer to compare against.
        var min = Int.max
        
        // For i in a range from 0 to n - 1...
        for i in 0...n - 1 {
            
            // We have a temporary price that recursively calls each child of the array
            var temp = getCheapestCost(root: root.children[i])
            
            // If the number returned by the recrusive function is less than the current minimum value, the minimum value is reassigned
            if temp < min {
                min = temp
            }
            
        }
        
        // After the minimum number is determined, it is added to our cost
        cost += min
    }
    
    // Cost is returned
    return cost
}
