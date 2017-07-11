//Consider an undirected graph consisting of n nodes where each node is labeled from 1 to  nand the edge between any two nodes is always of length 6. We define node s to be the starting position for a breadth-first search.
//
//Given  queries in the form of a graph and some starting node, , perform each query by calculating the shortest distance from starting node  to all the other nodes in the graph. Then print a single line of  space-separated integers listing node 's shortest distance to each of the  other nodes (ordered sequentially by node number); if  is disconnected from a node, print  as the distance to that node.
//
//Input Format
//
//The first line contains an integer, q, denoting the number of queries. The subsequent lines describe each query in the following format:
//
// * The first line contains two space-separated integers describing the respective values of n (the number of nodes) and m (the number of edges) in the graph.
//
// * Each line i of the m subsequent lines contains two space-separated integers, u and v, describing an edge connecting node u to node v.
//
// * The last line contains a single integer, s, denoting the index of the starting node.
//Constraints
//
// * 1 <= q <= 10
// * 2 <= n <= 100
// * 1 <= m <= n(n-1)/2
// * 1 <= u, v, s <= n
//
//Output Format
//
//For each of the q queries, print a single line of n - 1 space-separated integers denoting the shortest distances to each of the n - 1 other nodes from starting position s. These distances should be listed sequentially by node number (i.e., 1, 2, ..., n ), but should not include node s. If some node is unreachable from s, print -1 as the distance to that node.
//
//Sample Input
//
// 2  <- Number of queries q
// 4 2 <- Number of nodes, number of edges
// 1 2 <- Edge between nodes 1 and 2
// 1 3 <- Eddge between nodes 1 and 4
// 1 <- Start node
// 3 1 <- Line m of the second query
// 2 3 <- Describes and edge between nodes 2 and 3
// 2 <- Start node
//Sample Output
//
// 6 6 -1 <- From position s in node 1, 6 to node 2, 6 to node 3, -1 to node 4
// -1 6 <- From position s in node 2, -1 to node 1, 6 to node 3
//
//Explanation
//
//We perform the following two queries:
//
//1. The given graph can be represented as:
//
//   (1)
//  /   \   (4)
// (3)  (2)
//
//where our start node, s, is node 1. The shortest distances from s to the other nodes are one edge to node 2, one edge to node 3, and an infinite distance to node 4 (which it's not connected to). We then print node 1's distance to nodes 2, 3, and 4 (respectively) as a single line of space-separated integers: 6 6 -1.
//
// 2. The given graph can be represented as:
//
//   (2)
//  /
// (3)  (1)
//
//where our start node, s, is node 2. There is only one edge here, so node 1 is unreachable from node 2 and node 3 has one edge connecting it to node 2. We then print node 2's distance to nodes 1 and 3 (respectively) as a single line of space-separated integers: -1 6.
//
//Note: Recall that the actual length of each edge is 6, and we print -1 as the distance to any node that's unreachable from s.

// Here's what we want to happen:
// 1. Take in the number of nodes
// 2. Declare starting node
// 3. Assign edges to each node pair
// 4. Print out a 6 to each node

import Foundation

class Graph {
    var adjList = [[Int]]()
    let size : Int
    
    init(size: Int) {
        self.size = size
        var size = size
        while size > 0 {
            adjList.append([])
            size -= 1
        }
    }
    
    func addEdge(first: Int, second: Int) {
        adjList[first].append(second)
        adjList[second].append(first)
    }
    
    func shortestReach(startId: Int) -> [Int] {
        var distances = [Int](repeating: -1, count: self.size)
        distances[startId] = 0
        var queue = [Int]()
        var seen = [Int]()
        seen.append(startId)
        print(seen)
        while !queue.isEmpty {
            let current = queue[0]
            queue.removeFirst()
            for node in adjList[current] {
                if !seen.contains(node) {
                    queue.append(node)
                    distances[node] = distances[current] + 6
                }
            }
        }
     return distances
    }
}


//let queries = Int(readLine()!)!
//for _ in 1...queries {
//    let sizeAndEdges = Array(readLine()!.components(separatedBy: " ").map { Int($0)
//    })
//    let size = sizeAndEdges[0]!
//    let edges = sizeAndEdges[1]!
//    let graph = Graph(size: size)
//    
//    for _ in 1...edges {
//        let nodes = Array(readLine()!.components(separatedBy: " ").map { Int($0)
//        })
//        let first = nodes[0]!
//        let second = nodes[1]!
//        graph.addEdge(first: first, second: second)
//    }
//    let startId = Int(readLine()!)!
//    var distances = graph.shortestReach(startId: startId)
//    for i in 0..<distances.count {
//        if i != startId {
//            print("\(distances[i]) ")
//        }
//    }
//}
