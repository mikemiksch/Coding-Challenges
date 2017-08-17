//Note: Try to solve this task in O(n) time using O(1) additional space, where n is the number of elements in l, since this is what you'll be asked to do during an interview.
//
//Given a singly linked list of integers, determine whether or not it's a palindrome.
//
//Example
//
//For l = [0, 1, 0], the output should be
//isListPalindrome(l) = true;
//For l = [1, 2, 2, 3], the output should be
//isListPalindrome(l) = false.
//Input/Output
//
//[time limit] 20000ms (swift)
//[input] linkedlist.integer l
//
//A singly linked list of integers.
//
//Guaranteed constraints:
//0 ≤ list size ≤ 5 · 105,
//-109 ≤ element value ≤ 109.
//
//[output] boolean
//
//Return true if l is a palindrome, otherwise return false.

// Definition for singly-linked list:
 public class ListNode<T> {
     public var value: T
     public var next: ListNode<T>?
     public init(_ x: T) {
         self.value = x
         self.next = nil
     }
 }

func isListPalindrome(l: ListNode<Int>?) -> Bool {
    
    // If our node is nil, then it is a palindrome since nothing is nothing backwards and forwards, so we return true.
    guard var node = l else { return true }
    
    // Create an array of our values
    var values = [Int]()
    
    // While our next node exists, we append the value of our current node and move on to the next.
    while node.next != nil {
        values.append(node.value)
        node = node.next!
    }
    
    // When we get to the last node, we append that value.
    values.append(node.value)
    
    // Return whether or not our array equals the same array reversed.
    return values.reversed() == values
}
