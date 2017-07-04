import Foundation

// for _ in 1...5 {
//   print("Hello, World!")
// }


/* 

Imagine we have an image. We’ll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s. Write a function that takes in the image and returns the coordinates of the rectangle -- either top-left and bottom-right; or top-left, width, and height.


 */


var image: [[Int]] = 
    [
        [1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 0, 0, 0, 1],
        [1, 1, 1, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1]
    ]
 

func rectangleBoundary(_ binaryMatrix: [[Int]]) {
  var matrix = binaryMatrix
  var upperLeftX = Int()
  var upperLeftY = Int()
  var height = 0
  // var width = 0
  for i in 0..<matrix.count {
    print("this is i: \(i)")
    for j in 0..<matrix[0].count {
      print("this is j: \(j)")
      if matrix[i][j] == 0 {
        upperLeftX = i
        upperLeftY = j
        checkBelow(&matrix, x: i, y: j, counter: &height)
      }
    }
  }
  print(upperLeftX, upperLeftY)
  print(height)
}

func checkBelow(_ matrix: inout [[Int]], x: Int, y: Int, counter: inout Int) {
  var matrixCopy = matrix
  if y < matrix[0].count && matrixCopy[x - 1][y] == 0 {
    counter += 1
    checkBelow(&matrix, x: x - 1, y: y, counter: &counter)
  }
}

  
// func recordCoordinate() {
//   var queue = [(Int, Int)]
//   pushIfValid(some arguments)
// }

// func pushIfValid(queue: inout [(Int, Int], x: Int, y: Int, matrix: [[Int]]) {
//   if x < matrix[0].count && x >= 0 && y < matrix[1].count && y >= 0 {
//     &queue.append(x,y)
//   }
// }
  
  rectangleBoundary(image)
