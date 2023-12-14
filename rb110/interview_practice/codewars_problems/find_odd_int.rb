# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.
# Examples

# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

=begin    

PROBLEM
input: array of integers
  - There will always be only one integer that appears an odd number of times
  - integers can be negative
output: return the integer that appears an odd number of times


EXAMPLES
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

DATA
input: array of integers
intermediate: array of unique char of the input array 
output: integer rep. the integer that appears an odd number of times

NOTES
- ITERATE through the unique element in the input array (`number`)
  - return number if the count of the number in the original array is odd

ALGORITHM
1. ITERATE through the unique element in the input array (`number`)
  - return number if the count of the number in the original array is odd
=end

def find_it(array)
  array.uniq.each do |number|
    return number if array.count(number).odd?
  end 
end 


p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10