## Properties of Data Structures ##

We perform the following sequence of actions:  
 1. Insert the following elements into a set: *1, 2, 9, 1, 2, 3, 1, 4, 1, 5, 7.*  
2. Convert the set into a list and sort it in ascending order.  
 
**Select the option below that denotes the sorted list:**  

* {1, 2, 3, 4, 5, 7, 9}
* {9, 7, 5, 4, 3, 2, 1}
* {1, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9}
* None of the above.

## Lookup operations ##

There are several factors that affect the efficiency of lookup operations in a hash table.  
Which of the following is NOT one of those factors?  

**Pick one of the choices:**  

* Number of elements stored in the hash table 
* Size of elements stored in the hash table 
* Number of buckets in the hash table
* Quality of the hash function
  
  
Consider the following code snippet:
```int a = 1;
  while (a < n) {
      a = a * 2;
}
```
What is the complexity of the above code snippet?

**Pick one of the choices:**  

* O(n)
* O(1)
* O(log2(n))
* O(2^n)

## Worst-case Running Time ##

Which of the following sorting algorithms does not have a worst case running time of 0(n2)?

**Pick one of the choices:**  

* insertion sort
* merge sort
* quick sort
* bubble sort

Which of the following is true about abstract classes?

**Pick one of the choices:**  

* abstract classes can be used as just any other class
* abstract classes need to be declared with `abstract` keyword. 
* abstract classes cannot be instantiated
* a class containing at least one abstract method will be an abstract class

## Java: Find the Output ##

Consider the following Java code snippet:
```public int divide(int a, int b) {
     int c = -1;
 
      try {
           c = a / b;
      }
      catch (Exception e) {
           System.err.print("Exception ");
      }
      finally {
           System.err.println("Finally ");
      }
      
      return c;
}
```

what will our code *print* when we *divide(4,0)*?

**Pick one of the choices:**  

* insertion sort
* merge sort
* quick sort
* bubble sort
