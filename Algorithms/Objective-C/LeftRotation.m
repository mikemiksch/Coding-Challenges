//A left rotation operation on an array of size n shifts each of the array's elements 1 unit to the left. For example, if 2 left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [3, 4, 5, 1, 2].
//
//Given an array of n  integers and a number, d, perform d left rotations on the array. Then print the updated array as a single line of space-separated integers.
//
//Input Format
//
//The first line contains two space-separated integers denoting the respective values of  (the number of integers) and  (the number of left rotations you must perform).
//The second line contains  space-separated integers describing the respective elements of the array's initial state.
//
//Constraints
//
//Output Format
//
//Print a single line of  space-separated integers denoting the final state of the array after performing  left rotations.
//
//Sample Input
//
//5 4
//1 2 3 4 5
//Sample Output
//
//5 1 2 3 4
//Explanation
//
//When we perform  left rotations, the array undergoes the following sequence of changes:
//
//Thus, we print the array's final state as a single line of space-separated values, which is 5 1 2 3 4.

#import <Foundation/Foundation.h>

// Function takes in an array of integers, and integer value to offset the rotation, and returns an array of integers.
//Hacker Rank in particular doesn't seem to like Objective-C much, so function declaration is different here.
static NSArray *rotate(NSArray *array, NSInteger offset) {
    
    // Store the maximum index number as a variable
    NSInteger maxIdx = [array count] - 1;
    
    // Instantiate a new array of integers to store results
    NSMutableArray *shiftedArray = [[NSMutableArray alloc]init];
    
    // Set initial offset value equal to d
    NSInteger *newOffset = offset;
    
    // If d is greater than n, the offset is set to be the remainder of d/n
    if (offset > [array count]) {
        newOffset = offset % [array count];
    }
    
    // Starting at the index value equal to the newOffset value and ending at the last index value, append the number at that index in the input array to the output array
    for (NSInteger i = newOffset; i <= maxIdx; i++) {
        [shiftedArray addObject: array[i]];
    }
    
    // Go back to index 0 of the input array and proceed to the indexvalue of d-1 to append those numbers to the output array
    for (NSInteger i = 0; i < newOffset; i++) {
        [shiftedArray addObject: array[i]];
    }
    
    //Return our rotated array
    return shiftedArray;
}

// Still working on how to do scanf/printf correctly, as that wasn't something that we covered in class : /

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int n;
    int k;
    scanf("%i %i",&n,&k);
    int a[n];
    for(int a_i = 0; a_i < n; a_i++){
       scanf("%d",&a[a_i]);
    }
    [pool drain];
    return 0;
}
