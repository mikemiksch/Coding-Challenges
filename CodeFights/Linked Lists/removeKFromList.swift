//Note: Try to solve this task in O(n) time using O(1) additional space, where n is the number of elements in the list, since this is what you'll be asked to do during an interview.
//
//Given a singly linked list of integers l and an integer k, remove all elements from list l that have a value equal to k.
//
//Example
//
//For l = [3, 1, 2, 3, 4, 5] and k = 3, the output should be
//removeKFromList(l, k) = [1, 2, 4, 5];
//For l = [1, 2, 3, 4, 5, 6, 7] and k = 10, the output should be
//removeKFromList(l, k) = [1, 2, 3, 4, 5, 6, 7].
//Input/Output
//
//[time limit] 20000ms (swift)
//[input] linkedlist.integer l
//
//A singly linked list of integers.
//
//Guaranteed constraints:
//0 ≤ list size ≤ 105,
//-1000 ≤ element value ≤ 1000.
//
//[input] integer k
//
//An integer.
//
//Guaranteed constraints:
//-1000 ≤ k ≤ 1000.
//
//[output] linkedlist.integer
//
//Return l with all the values equal to k removed.

import Foundation

// Definition for singly-linked list:
 public class ListNode<T> {
     public var value: T
     public var next: ListNode<T>?
     public init(_ x: T) {
         self.value = x
         self.next = nil
     }
 }

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    
    // Since the function signature given has the ListNode as an optional value, the first thing we have to do is unwrap it. If there's no node, we just return nil.
    // We create head as a mutable copy of the ListNode passed into the function
    guard var head = l else {return nil}
    
    // A while loop handles instances where the head.value and any subsequent values are equal to k. If our head.value is k and there're no valid nodes, we return nil.
    while head.value == k {
        if head.next != nil {
            head = head.next!
        } else {
            return nil
        }
    }
    
    // Once we find a valid head, we create another copy to perform our next while loop on.
    var node = head
    
    // As long as node.next exists...
    while node.next != nil {
        
        //... if node.next.value = k and also has a node.next value
        if node.next!.value == k && node.next!.next != nil {
            
            // We set the node.next of our current node to equal that of the node with the value of k, cutting it out of the list.
            node.next = node.next!.next
            
            // If there is no node.next.next and node.next.value = k, then we jsut set the current node.next to nil and cut the offending node off the end of the list.
        } else if node.next!.value == k {
            node.next = nil
            
            // And if none of the above applies, we just set the value of our node to the current node.next 
        } else {
            node = node.next!
        }
    }
    return head
}
