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
```
int a = 1;
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

**Pick the correct choices:**  

* abstract classes can be used as just any other class
* abstract classes need to be declared with `abstract` keyword. 
* abstract classes cannot be instantiated
* a class containing at least one abstract method will be an abstract class

## Java: Find the Output ##

Consider the following Java code snippet:
```
public int divide(int a, int b) {
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

* Exception
* Finally
* No output
* -1

## REST Securely ##

Identify any and all rule(s) to follow when securing a web application based on REST
architecture:

**Pick the correct choices:**  

* Sensitive data such as usernames and passwords must always be passed to a web service using the POST method
* A web service must not use any HTTP error messages
* All input validations must be done on the server
* Validate malformed XML/JSON
* PUT operations must be read-only

## First Five Alerts **

Select the option that has the correct sequence of first five alert messages, when the following javascript code snippet is run:
```
function func(x) { 
     var z = 8;

     return function(y) { 
          alert(x + y + z);
     }
}

var n1 = new Number(32);
var a1 = func(n1);
var n2 = new Number(16);
var a2 = func(n2);
var n3 = new Number(8);
var a3 = func(n3);
var n4 = new Number(4);
var a4 = func(n4);
var n5 = new Number (2);
var a5 = func(n5);
a1(2);
a2(4);
a3(8);
a4(16);
a5(32);
```
**Pick one of the choices:**  

* 34, 36, 40, 48, 64
* 2, 4, 8, 16, 32
* 24, 24, 28, 28, 42
* 42, 28, 24, 28, 42

