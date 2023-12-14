# Given a List [] of n integers , find minimum number to be inserted in a list, 
# so that sum of all elements of list should equal the closest prime number .
# Notes

#     List size is at least 2 .

#     List's numbers will only positives (n > 0) .

#     Repetition of numbers in the list could occur .

#     The newer list's sum should equal the closest prime number.

=begin

PROBLEM:
input: array of integers
  - list size is at least 2
  - only postive numbers
  - can have duplicate numbers
output: return the min number needed to get a sum that the closest prime
  - The newer list's sum should equal the closest prime number
  - prime num is any number that is evenly divisible by 1 and itself

EXAMPLES:
# p minimum_number([3,1,2]) == 1
  - 3 + 1 + 2 = 6 (closest prime is 7) --> 7 - 6 = 1
# p minimum_number([5,2]) == 0
  - 5 + 2 = 7 (closest prime is 7) --> 7 - 7 = 0

DATA
input: array of integers
intermediate: grab a sum
output: integer rep. the min number needed to get a sum that is the closet prime #

NOTES
- keep track of how many more is needed to get to the closet prime (min_num)
- loop starting with the sum of the input array until a prime number is reached 
  - IF the number is prime
      return min_num 
  - ELSE
      add one to the sum
      add one to min_num
- either create a prime number method or require it and use prime?

ALGORITHM
** require 'prime'
1. init min_num to 0
2. init sum to the sum of all the elements in input array
3. LOOP until a prime number is reached 
  - IF the sum is prime
      explicitly return min_num
  - ELSE
      add one to the sum
      add one to min_num
=end 

require 'prime'

def minimum_number(array)
  min_num = 0
  sum = array.sum

  loop do
    return min_num if sum.prime?
    
    min_num += 1 
    sum += 1  
  end 
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2