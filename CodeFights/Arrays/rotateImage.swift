//Note: Try to solve this task in-place (with O(1) additional memory), since this is what you'll be asked to do during an interview.
//
//You are given an n x n 2D matrix that represents an image. Rotate the image by 90 degrees (clockwise).
//
//Example
//
//For
//
//a = [[1, 2, 3],
//[4, 5, 6],
//[7, 8, 9]]
//the output should be
//
//rotateImage(a) =
//[[7, 4, 1],
//[8, 5, 2],
//[9, 6, 3]]
//Input/Output
//
//[time limit] 20000ms (swift)
//[input] array.array.integer a
//
//Guaranteed constraints:
//1 ≤ a.length ≤ 100,
//a[i].length = a.length,
//1 ≤ a[i][j] ≤ 104.
//
//[output] array.array.integer

func rotateImage(a: [[Int]]) -> [[Int]] {
    var output = Array(repeatElement([Int](), count: a.count))
    for i in 0..<a.count {
        var rowIdx = output.count - 1
        for j in a[i] {
            output[rowIdx].insert(j, at: 0)
            rowIdx -= 1
        }
    }
    return output.reversed()
}
