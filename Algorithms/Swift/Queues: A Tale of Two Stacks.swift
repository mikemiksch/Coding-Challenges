//A queue is an abstract data type that maintains the order in which elements were added to it, allowing the oldest elements to be removed from the front and new elements to be added to the rear. This is called a First-In-First-Out (FIFO) data structure because the first element added to the queue (i.e., the one that has been waiting the longest) is always the first one to be removed.
//
//A basic queue has the following operations:
//
//* Enqueue: add a new element to the end of the queue.
//* Dequeue: remove the element from the front of the queue and return it.
//In this challenge, you must first implement a queue using two stacks. Then process  queries, where each query is one of the following  types:
//
//1 x: Enqueue element x into the end of the queue.
//2: Dequeue the element at the front of the queue.
//3: Print the element at the front of the queue.
//Input Format
//
//The first line contains a single integer, q, denoting the number of queries.
//Each line i of the q subsequent lines contains a single query in the form described in the problem statement above. All three queries start with an integer denoting the query type, but only query 1 is followed by an additional space-separated value,x, denoting the value to be enqueued.
//
//Constraints
//* 1 <= q <= 10^5
//* 1 <= type <= 3
//* 1 <= |x| <= 10^9
//* It is guaranteed that a valid answer always exists for each query of type 3.
//
//
//Output Format
//
//For each query of type 3, print the value of the element at the front of the queue on a new line.
//
//Sample Input
//
//10
//1 42
//2
//1 14
//3
//1 28
//3
//1 60
//1 78
//2
//2
//Sample Output
//
//14
//14
//Explanation
//
//We perform the following sequence of actions:
//
//Enqueue 42; queue = {42}.
//Dequeue the value at the head of the queue, 42; queue = {}.
//Enqueue 14; queue = {14}.
//Print the value at the head of the queue, 14; queue = {14}.
//Enqueue 28; queue = {14 <- 28}.
//Print the value at the head of the queue, 14; queue = {14 <- 28}.
//Enqueue 60; queue = {14 <- 28 <- 60}.
//Enqueue 78; queue = {14 <- 28 <- 60 <- 78}.
//Dequeue the value at the head of the queue, 14; queue = {28 <- 60 <- 78}.
//Dequeue the value at the head of the queue, 28; queue = {60 <- 78}.

import Foundation

// These outcomes are easily achievable with a single array and append/popLast, but we're going to go ahead and make two arrays and treat them as stacks for the purposes of this challenge.


// First, we define our Queue object
class Queue {
    
    // We give it the two stacks required by this challenge
    var firstStack = [Int]()
    var secondStack = [Int]()
    
    // This will prepare our stacks when we need to dequeue or retrieve the head value
    func readyStacks() {
        
        // If the second stack is empty, while the first is not empty, if you can pop the last value of the first stack, append it to the second
        if secondStack.isEmpty {
            while !firstStack.isEmpty {
                if let popLast = firstStack.popLast() {
                    secondStack.append(popLast)
                }
            }
        }
    }
    
    // Enqueuing will always append to the first stack
    func enqueue(_ value: Int) {
        firstStack.append(value)
    }
    
    // Dequeuing inverts the enqueued stack and removes the last item (being the first in the queue)
    func dequeue() {
        readyStacks()
        secondStack.popLast()
    }
    
    
    // Similiar to above but instead of removing the last item, it returns its value
    func retrieveHead() -> Int {
        readyStacks()
        let value = secondStack.last!
        return value
    }
}


// Declare a queue as a variable.
var queue = Queue()

// Function takes in a number for the type of action, and an optional value in the case of enqueuing
func manipulateQ(_ type: Int, _ value: Int?) {
    
    // A switch statement handles our action types by calling the methods defined above
    switch type {
    case 1:
        if let value = value {
            queue.enqueue(value)
        }
    case 2:
        queue.dequeue()
    case 3:
        print(queue.retrieveHead())

    default:
        print("Invalid input")
    }
}


// This handles the input as HackerRank gives it. It reads the first line to determine the number of subsquent lines.
if let line = readLine(), let numLines = Int(line) {
    
    // For each line, it reads and separates the two numbers
    for _ in 0..<numLines {
        let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        
        // The first number is captured as our action type, the second as the value to be enqueued (if it exists)
        let actionType = input[0]
        if input.count == 2 {
            let value = input[1]
            manipulateQ(actionType, value)
        } else {
            
            // If there is no value, it passes nill instead.
            manipulateQ(actionType, nil)
        }
    }
}

