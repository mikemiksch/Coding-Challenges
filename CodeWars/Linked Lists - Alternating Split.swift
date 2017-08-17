//Linked Lists - Alternating Split
//
//Write an AlternatingSplit() function that takes one list and divides up its nodes to make two smaller lists. The sublists should be made from alternating elements in the original list. So if the original list is a -> b -> a -> b -> a -> null then one sublist should be a -> a -> a -> null and the other should be b -> b -> null.
//
//###JavaScript
//
//var list = 1 -> 2 -> 3 -> 4 -> 5 -> null
//alternatingSplit(list).first === 1 -> 3 -> 5 -> null
//alternatingSplit(list).second === 2 -> 4 -> null
//###Python
//
//list = 1 -> 2 -> 3 -> 4 -> 5 -> None
//alternating_split(list).first == 1 -> 3 -> 5 -> None
//alternating_split(list).second == 2 -> 4 -> None
//###Ruby
//
//list = 1 -> 2 -> 3 -> 4 -> 5 -> nil
//alternating_split(list).first == 1 -> 3 -> 5 -> nil
//alternating_split(list).second == 2 -> 4 -> nil
//For simplicity, we use a Context object to store and return the state of the two linked lists. A Context object containing the two mutated lists should be returned by AlternatingSplit().
//
//If the passed in head node is null/None/nil or a single node, throw an error.

import Foundation

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
}

struct Context {
    var source:Node?
    var dest:Node?
}


// An enum to handle our errors.
enum SplittingErrors : Error {
    case nilNode
    case singleNode
}

func alternatingSplit(head:Node?) throws -> Context? {
    
    // Create a context to return at the end.
    var result = Context()
    
    // The source property of the Context is set to the head passed in as an argument.
    result.source = head
    
    // Unwrap the head and throw an error if it's nil.
    guard var nodeA = result.source else { print("Node is nil!"); throw SplittingErrors.nilNode }
    
    // Set the head of our second linked list to the next node or throw an error if the head is only a single node.
    guard var nodeB = result.source?.next else { print("Node is single!"); throw SplittingErrors.singleNode }
    
    // Set the dest property of our Context to nodeB
    result.dest = nodeB
    
    // While there is a next node in our original list...
    while nodeA.next != nil  {
        
        // ... we set our nodeB to that node
        nodeB = nodeA.next!
        
        // If our new nodeB has a node linked to it, nodeA becomes that node.
        if nodeB.next != nil {
            nodeA = nodeB.next!
            
        // If there is no next node on nodeB, we set nodeA.next to nil as well
        } else {
            nodeA.next = nil
        }
    }
    
    // Return our context
    return result
}
