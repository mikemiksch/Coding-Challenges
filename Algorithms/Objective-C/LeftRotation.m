#import <Foundation/Foundation.h>


static NSArray *rotate(NSArray *array, NSInteger offset) {
    NSInteger maxIdx = [array count] - 1;
    NSMutableArray *shiftedArray = [[NSMutableArray alloc]init];
    NSInteger *newOffset = offset;
    if (offset > [array count]) {
        newOffset = offset % [array count];
    }
    
    for (NSInteger i = newOffset; i <= maxIdx; i++) {
        [shiftedArray addObject: array[i]];
    }
    
    for (NSInteger i = 0; i < newOffset; i++) {
        [shiftedArray addObject: array[i]];
    }
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
