"""
For loop Question: 
Write a Python program that iterates the integers from 1 to 50.
 For multiples of three print "Fizz" instead of the number and for multiples of five print "Buzz".
 For numbers that are multiples of three and five, print "FizzBuzz".
 """
##Iterate 1 -50 (51) done
## Fizz for multiples on 3 instead of the number
## Buzz for multiples on 5 instead of the number
## FizzBuzz for multiples on 3 & 5 instead of the number

for fizzbuzz in range(1,51): 
     if fizzbuzz % 3 == 0 and fizzbuzz % 5 == 0:
          print("fizzbuzz")
     elif fizzbuzz % 3 == 0:
          print("fizz")
     else:
          print("buzz")
     print(fizzbuzz)

     


