//A linked list is said to contain a cycle if any node is visited more than once while traversing the list.
//
//Complete the function provided in the editor below. It has one parameter: a pointer to a Node object named that points to the head of a linked list. Your function must return a boolean denoting whether or not there is a cycle in the list. If there is a cycle, return true; otherwise, return false.
//
//Note: If the list is empty, head will be null.
//
//Input Format
//
//Our hidden code checker passes the appropriate argument to your function. You are not responsible for reading any input from stdin.
//
//Constraints
//
// * 0 <= list size <= 100
//
//Output Format
//
//If the list contains a cycle, your function must return true. If the list does not contain a cycle, it must return false. The binary integer corresponding to the boolean value returned by your function is printed to stdout by our hidden code checker.
//
//Sample Input
//
//The following linked lists are passed as arguments to your function:

// [head] -> null
// [head] -> [2] -> [3] -> [2]


// For whatever reason, HackerRank doesn't have an option to answer this challenge in Swift, but here's a solution regardless.

class Node {
    let data : Int
    let next : Node?
    init(data: Int) {
        self.data = data
        self.next = next
    }
}


func hasCycle(head: Node) -> Bool {
    var currNode = head
    
    // Since we're given the paremeter that the list is between 0 and 100 items, this loop checks to see if the node has a non-nil value. If the next is nil, it returns that there is no cycle.
    for each in 0...100 {
        if currNode.next != nil {
            currNode = currNode.next!
        } else {
            return false
        }
    }
    
    // Since we know the maximum size of the linked list, if we go to the end and still have not found a nil value for the next node, we know there's a cycle and return that it's true.
    return true

}
